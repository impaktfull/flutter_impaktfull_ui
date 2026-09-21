import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Every user-facing text of a component or building block goes through its
/// localizations (`<name>.localizations.dart`), so apps can translate it.
///
/// This test scans the source for string literals with words passed to a
/// text widget or a user-facing parameter (`Text('...')`,
/// `tooltip: '...'`, `title: '...'`, ...).
///
/// When it fails: add the text to the localizations of the component (see
/// `.claude/skills/create_component/SKILL.md`). Only add it to [_allowlist]
/// when it is not shown to users of an app (debug output, example data).
void main() {
  test('components and building blocks have no hardcoded user-facing texts',
      () {
    final violations = <String>[];
    for (final directory in _scannedDirectories) {
      final files = Directory(directory)
          .listSync(recursive: true)
          .whereType<File>()
          .where((file) => file.path.endsWith('.dart'))
          .where((file) => !_isLocalizationsFile(file.path));
      for (final file in files) {
        final path = file.path.replaceAll(r'\', '/');
        final source = _withoutComments(file.readAsStringSync());
        for (final match in _userFacingLiteral.allMatches(source)) {
          final literal = match.group(3)!;
          if (!_containsWords(literal)) continue;
          final allowed = _allowlist[path] ?? const <String>{};
          if (allowed.contains(literal)) continue;
          final line = '\n'.allMatches(source.substring(0, match.start)).length;
          violations.add('$path:${line + 1}: ${match.group(1)} "$literal"');
        }
      }
    }
    expect(
      violations,
      isEmpty,
      reason: 'Hardcoded user-facing texts found. Move them to the '
          'localizations of the component, or add them to the allowlist in '
          'test/src/localizations/hardcoded_strings_test.dart when they are '
          'not user-facing:\n${violations.join('\n')}',
    );
  });

  test('the scan finds hardcoded texts', () {
    const source = '''
      Text('Hello world'),
      Text(
        "Multi line",
      ),
      ImpaktfullUiIconButton(tooltip: 'Close', onTap: () {}),
      ImpaktfullUiButton(title: 'Page \$page of \$total'),
      Text(localizations.title),
      Text(':'),
      Text('\$value'),
    ''';
    final literals = _userFacingLiteral
        .allMatches(source)
        .map((match) => match.group(3)!)
        .where(_containsWords)
        .toList();
    expect(literals, [
      'Hello world',
      'Multi line',
      'Close',
      r'Page $page of $total',
    ]);
  });
}

const _scannedDirectories = [
  'lib/src/components',
  'lib/src/building_block',
];

/// The literals that are allowed, per file.
const _allowlist = <String, Set<String>>{
  // Debug banner, only shown in debug builds.
  'lib/src/components/app/debug/app_debug_flag.dart': {'Debug'},
  // Debug output.
  'lib/src/components/auto_complete/widget/auto_complete_overlay.dart': {
    r'Error in _getData (ImpaktfullUiAutoCompleteOverlay): $error',
  },
  // Example data of the command menu.
  'lib/src/components/command_menu/commander/src/widget/commander_configurator_widget.dart':
      {'Commander Example'},
  // Names of the breakpoints, to debug the layout.
  'lib/src/components/fluid_padding/fluid_padding_style.dart': {
    'Mobile',
    'Tablet',
    'Desktop',
    'Large Desktop',
    'Ultra Wide Desktop',
  },
  // Only shown in debug mode, to notice a broken url during development.
  'lib/src/components/network_image/widget/network_image_error.dart': {
    r'Error: $error',
  },
  // A keyboard layout: apps pass their own configuration for other layouts
  // and languages.
  'lib/src/components/virtual_keyboard/model/config/qwerty/virtual_qwerty_keyboard_config.dart':
      {
    'Backspace',
    'Tab',
    'Caps Lock',
    'Enter',
    'Shift',
    'Ctrl',
  },
  // The English tooltip of the enum. The editor shows
  // ImpaktfullUiWysiwygLocalizations.tooltipFor(action).
  'lib/src/components/wysiwyg/model/wysiwyg_action.dart': {
    'Header',
    'Bold',
    'Italic',
    'Unordered List',
    'Ordered List',
    'Link',
    'Code',
    'Code Block',
    'Photo',
  },
};

/// A string literal passed to a text widget or to a parameter that is shown
/// to the user.
final _userFacingLiteral = RegExp(
  r'(Text\(|TextSpan\(\s*text:|\b(?:tooltip|message|title|subtitle|label|'
  r'placeholder|hint|hintText|semanticsLabel|semanticLabel|noDataLabel|'
  r'buttonText|text|value|description|error)\s*:)\s*'
  r'''(['"])((?:\\.|(?!\2).)*)\2''',
);

bool _containsWords(String literal) {
  // Ignore interpolations: only the text around them matters.
  final text = literal.replaceAll(RegExp(r'\$\{[^}]*\}|\$\w+'), '');
  return RegExp('[A-Za-z]{2}').hasMatch(text);
}

bool _isLocalizationsFile(String path) =>
    path.endsWith('.localizations.dart') || path.endsWith('.localization.dart');

/// Removes line comments (including doc comments), keeping the line count.
String _withoutComments(String source) => source
    .split('\n')
    .map((line) => line.trimLeft().startsWith('//') ? '' : line)
    .join('\n');
