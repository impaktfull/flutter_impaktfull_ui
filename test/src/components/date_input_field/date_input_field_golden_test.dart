import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_inputs_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  final icons = ImpaktfullUiTheme.getDefault().assets.icons;
  final date = DateTime(2024, 3, 15);

  runComponentTest(
    fileName: 'impaktfull_ui_date_input_field',
    columns: 3,
    goldenTests: () => [
      GoldenTest(
        child: goldenSized(ImpaktfullUiDateInputField(
          value: null,
          placeholder: 'Select a date',
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiDateInputField(
          value: date,
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiDateInputField(
          label: 'Birthday',
          value: date,
          hint: 'Your date of birth',
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiDateInputField(
          label: 'Error',
          value: date,
          error: 'This date is not allowed',
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiDateInputField(
          label: 'Disabled',
          value: date,
          isDisabled: true,
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiDateInputField(
          label: 'Read only',
          value: date,
          readOnly: true,
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiDateInputField(
          label: 'Custom format',
          value: date,
          dateFormat: 'EEEE d MMMM yyyy',
          leadingIcon: icons.info,
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiDateInputField(
          label: 'A very long label that does not fit on a single line of '
              'the date input field',
          value: null,
          placeholder: 'A very long placeholder that does not fit on one line',
          onChanged: (_) {},
        )),
      ),
    ],
  );
}
