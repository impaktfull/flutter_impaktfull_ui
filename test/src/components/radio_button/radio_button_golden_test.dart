import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_radio_button',
    columns: 2,
    goldenTests: () => [
      for (final enabled in [true, false]) ...[
        GoldenTest(
          child: ImpaktfullUiRadioButton<int>(
            value: 1,
            groupValue: 2,
            onChanged: enabled ? (_) {} : null,
          ),
        ),
        GoldenTest(
          child: ImpaktfullUiRadioButton<int>(
            value: 1,
            groupValue: 1,
            onChanged: enabled ? (_) {} : null,
          ),
        ),
      ],
    ],
  );
}
