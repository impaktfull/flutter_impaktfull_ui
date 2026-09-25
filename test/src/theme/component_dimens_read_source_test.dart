@TestOn('vm')
library;

// A token that no component reads is worse than a hardcoded value: it says a
// design system can change something that it cannot. This scans the sources
// and fails on a `dimens` token of a component theme that its own component
// never reads.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Tokens that are read outside the folder of their component.
const _readElsewhere = <String>{
  // `lib/src/widget/input/base_input_field.dart` renders the field.
  'ImpaktfullUiInputFieldDimensTheme.contentPadding',
  'ImpaktfullUiInputFieldDimensTheme.readOnlyContentPadding',
};

void main() {
  test('every dimens token is read by its component', () {
    final components = Directory('lib/src/components')
        .listSync()
        .whereType<Directory>()
        .toList()
      ..sort((a, b) => a.path.compareTo(b.path));

    final unread = <String>[];
    for (final component in components) {
      final name = component.path.split('/').last;
      final files = component
          .listSync(recursive: true)
          .whereType<File>()
          .where((file) => file.path.endsWith('.dart'))
          .toList();
      final styles =
          files.where((file) => file.path.contains('style')).toList();
      if (styles.isEmpty) continue;

      // Every file of the component, the style files included: a size theme
      // is allowed to resolve a token (the sizes of a button) itself.
      final source = files.map((file) => file.readAsStringSync()).join('\n');
      if (source.isEmpty) continue;

      for (final style in styles) {
        final styleSource = style.readAsStringSync();
        final dimens = RegExp(
          r'class (ImpaktfullUi\w*DimensTheme) \{(.*?)\n\}',
          dotAll: true,
        ).allMatches(styleSource);
        for (final theme in dimens) {
          final className = theme.group(1)!;
          final fields = RegExp(r'^  final [\w<>,? ]+ (\w+);', multiLine: true)
              .allMatches(theme.group(2)!)
              .map((match) => match.group(1)!);
          for (final field in fields) {
            if (_readElsewhere.contains('$className.$field')) continue;
            // A read is `.field`, not the declaration or the `this.field` of
            // the constructor and the copyWith.
            final reads =
                RegExp('(?<!this)\\.$field\\b').allMatches(source).length;
            final forwards =
                RegExp('$field \\?\\? this\\.$field').allMatches(source).length;
            if (reads > forwards) continue;
            unread.add('$name: $className.$field');
          }
        }
      }
    }

    expect(
      unread,
      isEmpty,
      reason: 'these tokens are never read by their component, so a theme '
          'that sets them changes nothing:\n${unread.join('\n')}',
    );
  });
}
