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
          date: null,
          placeholder: 'Select a date',
          onDateSelected: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiDateInputField(
          date: date,
          onDateSelected: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiDateInputField(
          label: 'Birthday',
          date: date,
          hint: 'Your date of birth',
          onDateSelected: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiDateInputField(
          label: 'Error',
          date: date,
          error: 'This date is not allowed',
          onDateSelected: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiDateInputField(
          label: 'Disabled',
          date: date,
          isDisabled: true,
          onDateSelected: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiDateInputField(
          label: 'Read only',
          date: date,
          readOnly: true,
          onDateSelected: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiDateInputField(
          label: 'Custom format',
          date: date,
          dateFormat: 'EEEE d MMMM yyyy',
          leadingIcon: icons.info,
          onDateSelected: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiDateInputField(
          label: 'A very long label that does not fit on a single line of '
              'the date input field',
          date: null,
          placeholder: 'A very long placeholder that does not fit on one line',
          onDateSelected: (_) {},
        )),
      ),
    ],
  );
}
