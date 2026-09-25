import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../util/golden_test_util.dart';
import '../../util/golden_test_variant.dart';
import '_theme_showcase.dart';

/// What the themes of this package look like, in the same showcase as the
/// design system themes of `presets/`, so the four of them can be compared.
///
/// This replaces the golden of a handful of components with the dark theme:
/// the showcase covers those and more, and in the same layout as every other
/// theme.
void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    // One golden: the showcase renders the themes itself.
    perTheme: false,
    fileName: 'impaktfull_ui_theme',
    goldenTests: () => [
      for (final theme in [
        ImpaktfullUiTheme.getDefault(package: null),
        ImpaktfullUiTheme.getDefaultDark(package: null),
      ])
        GoldenTest(
          child: ImpaktfullUiApp(
            showDebugFlag: false,
            title: 'impaktfull app',
            impaktfullUiTheme: theme,
            home: const ThemeShowcase(),
          ),
        ),
    ],
  );
}
