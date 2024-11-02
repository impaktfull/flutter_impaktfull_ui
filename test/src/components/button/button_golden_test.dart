import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_button',
    columns: 5,
    goldenTests: () => [
      for (final type in ImpaktfullUiButtonType.values) ...[
        for (final size in ImpaktfullUiButtonSize.values) ...[
          GoldenTest(
            child: ImpaktfullUiButton(
              type: type,
              title: 'Button',
              size: size,
              onTap: () {},
            ),
          ),
        ],
      ],
    ],
  );

  runComponentTest(
    fileName: 'impaktfull_ui_button_disabled',
    columns: 5,
    goldenTests: () => [
      for (final type in ImpaktfullUiButtonType.values) ...[
        for (final size in ImpaktfullUiButtonSize.values) ...[
          GoldenTest(
            child: ImpaktfullUiButton(
              type: type,
              title: 'Button',
              size: size,
              onTap: null,
            ),
          ),
        ],
      ],
    ],
  );
}
