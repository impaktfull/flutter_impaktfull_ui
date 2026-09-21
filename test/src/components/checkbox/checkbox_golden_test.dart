import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_checkbox',
    columns: 3,
    goldenTests: () => [
      for (final enabled in [true, false]) ...[
        GoldenTest(
          child: ImpaktfullUiCheckbox(
            value: false,
            onChanged: enabled ? (_) {} : null,
          ),
        ),
        GoldenTest(
          child: ImpaktfullUiCheckbox(
            value: true,
            onChanged: enabled ? (_) {} : null,
          ),
        ),
        GoldenTest(
          child: ImpaktfullUiCheckbox.indeterminate(
            value: null,
            onChanged: enabled ? (_) {} : null,
          ),
        ),
      ],
    ],
  );
}
