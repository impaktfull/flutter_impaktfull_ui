import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';

void main() {
  setUp(() => setupComponentTest());

  GoldenTest timePicker(
    String description,
    TimeOfDay value, {
    String? label,
  }) =>
      GoldenTest(
        description: description,
        child: SizedBox(
          width: 280,
          child: ImpaktfullUiTimePicker(
            label: label,
            value: value,
            onChanged: (_) {},
          ),
        ),
      );

  runComponentTest(
    fileName: 'impaktfull_ui_time_picker',
    goldenTests: () => [
      timePicker('Morning', const TimeOfDay(hour: 9, minute: 5)),
      timePicker('Midnight', const TimeOfDay(hour: 0, minute: 0)),
      timePicker('End of the day', const TimeOfDay(hour: 23, minute: 59)),
      timePicker(
        'With label',
        const TimeOfDay(hour: 14, minute: 30),
        label: 'Start time',
      ),
    ],
  );
}
