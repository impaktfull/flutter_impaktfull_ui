@TestOn('vm')
library;

// `ImpaktfullUi<Component>Theme.of(context)` is the theme of the app, not the
// theme the caller of a component passed to it. A widget that is part of a
// component must therefore use the theme its component resolved (the
// `componentTheme` of `ImpaktfullUiOverridableComponentBuilder`, passed on as
// a parameter), or a `theme` on the component and an override component would
// not reach it.
//
// A component may read the theme of *another* component from the context: that
// component is not the one being themed here.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// The file that owns a component resolves its own theme: it is the one that
/// turns `theme` into a `componentTheme`, and a `static show` of it has
/// nothing but a context to work with. A widget elsewhere may do the same as
/// long as it falls back to the context *after* the theme it was given, which
/// is `widget.theme ?? ImpaktfullUi<Component>Theme.of(context)`.
bool _ownsTheComponent(String path, String component) {
  final file = path.split('/').last;
  return file == '$component.dart' ||
      file == '${component}_style.dart' ||
      file == '$component.style.dart';
}

/// `ImpaktfullUiTheme.of(context)` (the theme of the app, for a base token) is
/// not what this guard is about.
final _componentThemeOf = RegExp(r'ImpaktfullUi(\w+)Theme\.of\(context\)');

/// The camelCase of a folder name: `color_picker` -> `ColorPicker`.
String _className(String folder) => folder
    .split('_')
    .map((part) => part[0].toUpperCase() + part.substring(1))
    .join();

void main() {
  test('a widget of a component uses the theme its component resolved', () {
    final violations = <String>[];
    for (final root in ['lib/src/components', 'lib/src/building_block']) {
      final directory = Directory(root);
      if (!directory.existsSync()) continue;
      for (final component in directory.listSync().whereType<Directory>()) {
        final name = component.path.split('/').last;
        final className = _className(name);
        for (final file in component
            .listSync(recursive: true)
            .whereType<File>()
            .where((file) => file.path.endsWith('.dart'))) {
          if (_ownsTheComponent(file.path, name)) continue;
          final source = file.readAsStringSync();
          for (final match in _componentThemeOf.allMatches(source)) {
            if (match.group(1) != className) continue;
            final before = source.substring(
              match.start < 40 ? 0 : match.start - 40,
              match.start,
            );
            if (before.contains('theme ??')) continue;
            final path = file.path.replaceFirst('$root/', '');
            violations.add('$path: ${match.group(0)}');
          }
        }
      }
    }

    expect(
      violations,
      isEmpty,
      reason: 'these widgets resolve the theme of their own component from the '
          'context, so a `theme` on the component does not reach them. Take '
          'the `componentTheme` as a parameter '
          'instead:\n${violations.join('\n')}',
    );
  });
}
