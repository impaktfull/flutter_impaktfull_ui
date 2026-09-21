import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  ImpaktfullUiButton button(String title, ImpaktfullUiButtonType type) =>
      ImpaktfullUiButton(
        type: type,
        title: title,
        fullWidth: true,
        onTap: () {},
      );

  runComponentTest(
    fileName: 'impaktfull_ui_bottom_actions',
    columns: 2,
    goldenTests: () => [
      layoutGoldenCase(
        'One action',
        ImpaktfullUiBottomActions(
          children: [button('Continue', ImpaktfullUiButtonType.primary)],
        ),
        width: 400,
      ),
      layoutGoldenCase(
        'Two actions',
        ImpaktfullUiBottomActions(
          children: [
            button('Continue', ImpaktfullUiButtonType.primary),
            button('Cancel', ImpaktfullUiButtonType.secondaryGrey),
          ],
        ),
        width: 400,
      ),
    ],
  );
}
