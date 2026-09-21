import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_date_time_picker',
    columns: 2,
    goldenTests: () => [
      GoldenTest(
        description: 'Afternoon',
        child: ImpaktfullUiDateTimePicker(
          value: DateTime(2023, 7, 6, 14, 30),
          onChanged: (_) {},
        ),
      ),
      GoldenTest(
        description: 'Leap day with margin',
        child: ImpaktfullUiDateTimePicker(
          value: DateTime(2024, 2, 29, 8, 5),
          margin: const EdgeInsets.all(16),
          onChanged: (_) {},
        ),
      ),
    ],
  );
}
