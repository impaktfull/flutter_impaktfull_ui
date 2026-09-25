@TestOn('vm')
library;

// A theme that this package ships without a showcase golden is a theme nobody
// can look at: this fails when one is added without its golden.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('every theme of this package has a showcase golden', () {
    final missing = <String>[];

    // The impaktfull themes, light and dark, in one golden.
    const own = 'test/src/theme/goldens/macos/impaktfull_ui_theme.png';
    if (!File(own).existsSync()) missing.add(own);

    // One golden per design system theme of `lib/src/theme/presets`.
    for (final preset in Directory('lib/src/theme/presets')
        .listSync()
        .whereType<File>()
        .where((file) => file.path.endsWith('_theme.dart'))) {
      final name = preset.path.split('/').last.replaceAll('.dart', '');
      final golden =
          'test/src/theme/presets/goldens/macos/impaktfull_ui_$name.png';
      if (!File(golden).existsSync()) missing.add(golden);
    }

    expect(
      missing,
      isEmpty,
      reason: 'these goldens are missing, so a theme of this package cannot '
          'be looked at next to the others. Add a golden test that renders '
          '`ThemeShowcase` with it:\n${missing.join('\n')}',
    );
  });
}
