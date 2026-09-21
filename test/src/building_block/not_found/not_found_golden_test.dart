import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../_core_golden_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  runScreenGoldenTest(
    fileName: 'impaktfull_ui_bb_not_found',
    builder: () => const ImpaktfullUiBBNotFound(),
  );

  runScreenGoldenTest(
    fileName: 'impaktfull_ui_bb_not_found_with_actions',
    builder: () => ImpaktfullUiBBNotFound(
      actions: [
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.secondary,
          title: 'Go back',
          onTap: () {},
        ),
        ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Home',
          onTap: () {},
        ),
      ],
    ),
  );
}
