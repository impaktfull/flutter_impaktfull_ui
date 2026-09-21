import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_inputs_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_option_selector',
    columns: 2,
    goldenTests: () => [
      GoldenTest(
        child: goldenSized(const ImpaktfullUiOptionSelector<String>(
          options: ['Belgium', 'France', 'The Netherlands'],
        )),
      ),
      GoldenTest(
        child: goldenSized(const ImpaktfullUiOptionSelector<String>(
          options: ['Belgium', 'France', 'The Netherlands'],
          selectedValue: 'France',
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiOptionSelector<int>(
          options: const [1, 2, 3],
          selectedValue: 3,
          titleBuilder: (item) => 'Option $item',
        )),
      ),
      GoldenTest(
        child: goldenSized(const ImpaktfullUiOptionSelector<String>(
          options: [
            'A very long option that does not fit on a single line of the '
                'option selector',
            'Short',
          ],
          selectedValue: 'Short',
        )),
      ),
      GoldenTest(
        child: goldenSized(
          const ImpaktfullUiOptionSelector<String>(options: []),
          height: 200,
        ),
      ),
    ],
  );
}
