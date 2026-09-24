import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '_preset_showcase.dart';

/// What `ImpaktfullUiAntDesignTheme` looks like. This golden is the regression
/// test of the theme system: a component that starts to hardcode a size, a
/// radius or a state color shows up here.
void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_ant_design_theme',
    goldenTests: () => [
      for (final theme in [
        ImpaktfullUiAntDesignTheme.light(),
        ImpaktfullUiAntDesignTheme.dark(),
      ])
        GoldenTest(
          child: ImpaktfullUiApp(
            showDebugFlag: false,
            title: 'impaktfull app',
            impaktfullUiTheme: theme,
            home: const PresetShowcase(),
          ),
        ),
    ],
  );
}
