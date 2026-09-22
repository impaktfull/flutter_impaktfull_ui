import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_overlays_golden_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_date_picker',
    columns: 2,
    goldenTests: () => [
      GoldenTest(
        description: 'Single',
        child: ImpaktfullUiDatePicker(
          selectedDate: DateTime(2023, 7, 6),
          onDateChanged: (_) {},
        ),
      ),
      GoldenTest(
        description: 'Single with margin',
        child: ImpaktfullUiDatePicker(
          selectedDate: DateTime(2024, 2, 29),
          margin: const EdgeInsets.all(16),
          onDateChanged: (_) {},
        ),
      ),
      GoldenTest(
        description: 'Range with only a start date',
        child: ImpaktfullUiDatePicker.range(
          selectedStartDate: DateTime(2023, 7, 6),
          selectedEndDate: null,
          onStartDateChanged: (_) {},
          onEndDateChanged: (_) {},
        ),
      ),
      GoldenTest(
        description: 'Range in one month',
        child: ImpaktfullUiDatePicker.range(
          selectedStartDate: DateTime(2023, 7, 6),
          selectedEndDate: DateTime(2023, 7, 19),
          onStartDateChanged: (_) {},
          onEndDateChanged: (_) {},
        ),
      ),
      GoldenTest(
        description: 'Range over 2 months',
        child: ImpaktfullUiDatePicker.range(
          selectedStartDate: DateTime(2023, 6, 28),
          selectedEndDate: DateTime(2023, 7, 4),
          onStartDateChanged: (_) {},
          onEndDateChanged: (_) {},
        ),
      ),
      GoldenTest(
        description: 'Month starting on a Monday',
        child: ImpaktfullUiDatePicker(
          selectedDate: DateTime(2024, 1, 1),
          onDateChanged: (_) {},
        ),
      ),
    ],
  );

  runOverlayGoldenTest(
    fileName: 'impaktfull_ui_date_picker_months',
    builder: () => ImpaktfullUiDatePicker(
      selectedDate: DateTime(2023, 7, 6),
      onDateChanged: (_) {},
    ),
    whilePerforming: tapAndSettleInteraction(find.text('July 2023')),
  );

  runOverlayGoldenTest(
    fileName: 'impaktfull_ui_date_picker_years',
    builder: () => ImpaktfullUiDatePicker(
      selectedDate: DateTime(2023, 7, 6),
      onDateChanged: (_) {},
    ),
    whilePerforming: (tester) async {
      await tapAndSettle(tester, find.text('July 2023'));
      await tapAndSettle(tester, find.text('2023'));
      return null;
    },
  );
}
