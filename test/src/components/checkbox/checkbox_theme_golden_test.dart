import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_inputs_test_helpers.dart';

/// Freezes what the size tokens of `ImpaktfullUiCheckboxDimensTheme` do: a
/// 16x16 box, which is what both shadcn/ui and Ant Design use, next to the 24
/// of the default theme.
void main() {
  setUp(() => setupComponentTest());

  final theme = defaultComponentsTheme.checkbox;

  ImpaktfullUiCheckboxTheme small() => theme.copyWith(
        dimens: theme.dimens.copyWith(
          size: 16,
          iconSize: 14,
          activeBorderWidth: 1,
        ),
      );

  runComponentTest(
    fileName: 'impaktfull_ui_checkbox_theme',
    columns: 3,
    goldenTests: () => [
      GoldenTest(
        child: ImpaktfullUiCheckbox(
          value: false,
          onChanged: (_) {},
          theme: small(),
        ),
      ),
      GoldenTest(
        child: ImpaktfullUiCheckbox(
          value: true,
          onChanged: (_) {},
          theme: small(),
        ),
      ),
      GoldenTest(
        child: ImpaktfullUiCheckbox.indeterminate(
          value: null,
          onChanged: (_) {},
          theme: small(),
        ),
      ),
      GoldenTest(
        child: ImpaktfullUiCheckbox(
          value: true,
          onChanged: (_) {},
          theme: theme.copyWith(
            dimens: theme.dimens.copyWith(
              size: 32,
              iconSize: 28,
              borderWidth: 2,
              activeBorderWidth: 4,
            ),
          ),
        ),
      ),
      GoldenTest(
        child: ImpaktfullUiCheckbox(
          value: false,
          onChanged: (_) {},
          theme: theme.copyWith(
            dimens: theme.dimens.copyWith(size: 32, borderWidth: 2),
          ),
        ),
      ),
    ],
  );
}
