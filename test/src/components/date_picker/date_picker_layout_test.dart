// Runs on the Dart VM and in Chrome (tool/test_web.sh). Chrome measures text
// a bit wider than the VM: the title of the header wrapped and the weekdays
// wrapped, which cut off the last week of the month.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/date_picker/widgets/date_picker_cell.dart';
import 'package:impaktfull_ui/src/components/date_picker/widgets/date_picker_weekdays.dart';

import '../../../util/test_util.dart';

Future<void> _pumpPicker(WidgetTester tester, double textScale) =>
    pumpAndSettleComponent(
      tester,
      Center(
        child: MediaQuery(
          data: MediaQueryData(textScaler: TextScaler.linear(textScale)),
          child: ImpaktfullUiDatePicker(
            selectedDate: DateTime(2023, 7, 6),
            onDateChanged: (_) {},
          ),
        ),
      ),
    );

void main() {
  for (final textScale in [1.0, 2.0]) {
    testWidgets('the last week is shown with text scale $textScale',
        (tester) async {
      await _pumpPicker(tester, textScale);
      expect(tester.takeException(), isNull);
      // July 2023 has 6 weeks when the week starts on Monday: the grid ends
      // with 6 August.
      final lastCell = find.byWidgetPredicate(
        (widget) =>
            widget is ImpaktfullUiDatePickerCell &&
            widget.value == '6' &&
            !widget.active,
      );
      expect(lastCell, findsOneWidget);
      final picker = tester.getRect(find.byType(ImpaktfullUiDatePicker));
      expect(tester.getRect(lastCell).bottom, lessThanOrEqualTo(picker.bottom));
    });
  }

  testWidgets('the weekdays stay on one line', (tester) async {
    await _pumpPicker(tester, 2);
    final weekdays =
        tester.getSize(find.byType(ImpaktfullUiDatePickerWeekdays));
    final cell = tester.getSize(find.byType(ImpaktfullUiDatePickerCell).first);
    expect(weekdays.height, lessThan(cell.height));
  });
}
