@TestOn('vm')
library;

// A theme this package ships that is not in `test/util/shipped_themes.dart`
// is a theme no golden ever renders: every component golden is rendered with
// the themes of that list, so a new one has to be added to it.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// `abstract final class ImpaktfullUiShadcnTheme {` → `ImpaktfullUiShadcnTheme`
final _themeClass = RegExp(r'class\s+(ImpaktfullUi\w*Theme)\b');

void main() {
  final list = File('test/util/shipped_themes.dart').readAsStringSync();

  test('every design system theme is rendered in light and in dark', () {
    final missing = <String>[];
    for (final preset in Directory('lib/src/theme/presets')
        .listSync()
        .whereType<File>()
        .where((file) => file.path.endsWith('.dart'))) {
      final source = preset.readAsStringSync();
      for (final match in _themeClass.allMatches(source)) {
        final name = match.group(1)!;
        for (final brightness in ['light', 'dark']) {
          if (!source.contains('$brightness(')) continue;
          if (list.contains('$name.$brightness')) continue;
          missing.add('$name.$brightness');
        }
      }
    }

    expect(
      missing,
      isEmpty,
      reason: 'add these to `shippedThemes` in test/util/shipped_themes.dart, '
          'so every component golden is rendered with them as well:\n'
          '${missing.join('\n')}',
    );
  });

  test('the themes of the package itself are rendered too', () {
    // The default theme is the one an `ImpaktfullUiApp` uses without a theme,
    // which is why its entry builds `null` instead of naming it.
    expect(list, contains('ImpaktfullUiTheme.getDefaultDark'));
    expect(list, contains("fileSuffix: ''"));
  });
}
