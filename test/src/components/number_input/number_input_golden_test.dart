import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_inputs_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_number_input',
    columns: 2,
    goldenTests: () => [
      GoldenTest(
        child: goldenSized(ImpaktfullUiNumberInput<int>(
          value: 0,
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiNumberInput<int>(
          label: 'Quantity',
          value: 42,
          min: 0,
          max: 100,
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiNumberInput<double>(
          label: 'Price',
          value: 12.5,
          step: 0.5,
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiNumberInput<int>(
          label: 'Negative',
          value: -10,
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiNumberInput<int>(
          label: 'A very long label for a number input that wraps',
          value: 123456789012,
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(
          ImpaktfullUiNumberInput<double>(
            label: 'Narrow',
            value: 3.14159,
            onChanged: (_) {},
          ),
          width: 200,
        ),
      ),
    ],
  );
}
