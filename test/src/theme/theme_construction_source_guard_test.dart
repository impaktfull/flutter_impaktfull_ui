// A widget must never construct a theme (or a sub theme) to read a value from
// it: `const ImpaktfullUiAccordionDurationsTheme().expand` is a hardcoded
// default wearing a token's clothes. It ignores the `theme` of the widget and
// the theme of the app, so an app that changes the token sees nothing happen.
//
// This test scans every source file of the components and the building blocks
// that is not a theme file, and fails on a `ImpaktfullUi*Theme(...)`
// construction.
//
// Fix a failure by reading the value from the theme that is already there:
// `widget.theme ?? ImpaktfullUi<Component>Theme.of(context)`, or the
// `componentTheme` of `ImpaktfullUiOverridableComponentBuilder`. An
// `AnimationController` that is created in `initState` gets no `duration`
// there; set it in `didChangeDependencies`, which runs before the first build.
// The default of the token belongs in the `*_style.dart` theme class.

// Reads the sources with dart:io, so it only runs on the Dart VM.
@TestOn('vm')
library;

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Directories whose widgets must read their values from the theme.
const _directories = [
  'lib/src/components',
  'lib/src/building_block',
];

/// The files that define the themes themselves: they build them by design.
bool _isThemeFile(String path) =>
    path.endsWith('_style.dart') ||
    path.endsWith('.style.dart') ||
    path.endsWith('.theme.dart');

/// Files that construct a theme for a reason, with that reason.
///
/// Keep this empty unless there is no way to reach a `BuildContext`: a widget,
/// a `State` and a builder always have one.
const _allowed = <String, String>{};

/// A constructor call of a theme class, with or without `const`. The
/// lookbehind keeps `x.ImpaktfullUiCardTheme(` out, and the `(` right after
/// the name keeps `ImpaktfullUiCardTheme.of(context)` and
/// `ImpaktfullUiCardTheme.getDefault(...)` out: those read a theme that
/// already exists.
final _themeConstruction = RegExp(
  r'(?<![\w.])(?:const\s+)?(Impaktfull\w*Theme)\s*\(',
);

class _Violation {
  final String file;
  final int line;
  final String name;

  const _Violation(this.file, this.line, this.name);

  @override
  String toString() => '$file:$line: $name(...)';
}

List<_Violation> _findThemeConstructions(String file, String source) {
  final lines = source.split('\n');
  final violations = <_Violation>[];
  for (final match in _themeConstruction.allMatches(source)) {
    final line = '\n'.allMatches(source.substring(0, match.start)).length;
    final text = lines[line].trimLeft();
    // A comment or a doc comment that names a theme is fine.
    if (text.startsWith('//')) continue;
    violations.add(_Violation(file, line + 1, match.group(1)!));
  }
  return violations;
}

void main() {
  test('components never construct a theme to read a value from it', () {
    final violations = <_Violation>[];
    for (final directory in _directories) {
      final files = Directory(directory)
          .listSync(recursive: true)
          .whereType<File>()
          .where((file) => file.path.endsWith('.dart'))
          .where((file) => !_isThemeFile(file.path))
          .where((file) => !_allowed.containsKey(file.path));
      for (final file in files) {
        violations.addAll(
            _findThemeConstructions(file.path, file.readAsStringSync()));
      }
    }
    expect(
      violations,
      isEmpty,
      reason: 'A widget must never build a theme to read a value from it: '
          'that hardcodes the default again and ignores both the `theme` of '
          'the widget and the theme of the app. Read the value from '
          '`widget.theme ?? ImpaktfullUi<Component>Theme.of(context)` (or the '
          '`componentTheme` of the overridable component builder) instead, '
          'and keep the default in the `*_style.dart` theme class. An '
          '`AnimationController` created in `initState` gets its `duration` '
          'in `didChangeDependencies`.\n${violations.join('\n')}',
    );
  });

  test('the scan finds the theme files it has to skip', () {
    // Guards the scan itself: without this, a broken `_isThemeFile` or an
    // empty file list would make the test above pass without checking.
    final themeFiles = Directory('lib/src/components')
        .listSync(recursive: true)
        .whereType<File>()
        .where((file) => _isThemeFile(file.path));
    expect(themeFiles.length, greaterThan(80));
    expect(
      _findThemeConstructions(
        'x_style.dart',
        'const ImpaktfullUiCardTheme(colors: ImpaktfullUiCardColorTheme())',
      ),
      hasLength(2),
      reason: 'the theme files really do construct themes, so they are only '
          'skipped by their file name',
    );
  });

  group('findThemeConstructions', () {
    List<String> check(String source) =>
        _findThemeConstructions('file.dart', source)
            .map((e) => e.name)
            .toList();

    test('finds a constructed theme', () {
      expect(check('const ImpaktfullUiAccordionDurationsTheme().expand'),
          ['ImpaktfullUiAccordionDurationsTheme']);
      expect(check('ImpaktfullUiSkeletonDurationsTheme(shimmer: d)'),
          ['ImpaktfullUiSkeletonDurationsTheme']);
      expect(
        check('var x = const ImpaktfullUiBBLicensesDimensTheme();'),
        ['ImpaktfullUiBBLicensesDimensTheme'],
      );
    });

    test('allows reading from a theme that already exists', () {
      expect(check('ImpaktfullUiAccordionTheme.of(context)'), isEmpty);
      expect(check('ImpaktfullUiTheme.maybeOf(context)'), isEmpty);
      expect(
          check('ImpaktfullUiCardTheme.getDefault(colors: colors)'), isEmpty);
      expect(check('componentTheme.durations.expand'), isEmpty);
      expect(check('widget.theme?.copyWith()'), isEmpty);
      expect(check('base.components.card.copyWith(dimens: dimens)'), isEmpty);
    });

    test('allows a theme name in a comment', () {
      expect(check('// const ImpaktfullUiCardTheme() is not allowed'), isEmpty);
      expect(check('/// See [ImpaktfullUiCardTheme].'), isEmpty);
    });

    test('does not match a type annotation or a parameter', () {
      expect(check('final ImpaktfullUiCardTheme? theme;'), isEmpty);
      expect(check('ImpaktfullUiCardTheme theme,'), isEmpty);
    });
  });
}
