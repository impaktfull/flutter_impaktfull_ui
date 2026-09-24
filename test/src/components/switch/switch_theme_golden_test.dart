import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_inputs_test_helpers.dart';

/// Freezes what the size tokens of `ImpaktfullUiSwitchDimensTheme` do: a 44x22
/// track with an 18 knob (Ant Design), next to the 40x24 with a 16 knob of the
/// default theme.
void main() {
  setUp(() => setupComponentTest());

  final theme = defaultComponentsTheme.switchTheme;

  ImpaktfullUiSwitchTheme ant() => theme.copyWith(
        dimens: theme.dimens.copyWith(
          thumbSize: 18,
          verticalPadding: 2,
          horizontalPadding: 24,
        ),
      );

  ImpaktfullUiSwitchTheme big() => theme.copyWith(
        dimens: theme.dimens.copyWith(
          thumbSize: 28,
          verticalPadding: 6,
          horizontalPadding: 30,
        ),
      );

  runComponentTest(
    fileName: 'impaktfull_ui_switch_theme',
    columns: 2,
    goldenTests: () => [
      GoldenTest(
        child:
            ImpaktfullUiSwitch(value: false, onChanged: (_) {}, theme: ant()),
      ),
      GoldenTest(
        child: ImpaktfullUiSwitch(value: true, onChanged: (_) {}, theme: ant()),
      ),
      GoldenTest(
        child:
            ImpaktfullUiSwitch(value: false, onChanged: (_) {}, theme: big()),
      ),
      GoldenTest(
        child: ImpaktfullUiSwitch(value: true, onChanged: (_) {}, theme: big()),
      ),
    ],
  );
}
