import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  List<ImpaktfullUiStepperItem> items({
    required int completed,
    bool withAsset = false,
  }) =>
      [
        for (var i = 0; i < 3; i++)
          ImpaktfullUiStepperItem(
            isCompleted: i < completed,
            title: 'Step ${i + 1}',
            subtitle: 'Subtitle ${i + 1}',
            asset: withAsset ? testAsset : null,
          ),
      ];

  runComponentTest(
    fileName: 'impaktfull_ui_stepper',
    columns: 2,
    goldenTests: () => [
      for (final completed in [0, 1, 3])
        layoutGoldenCase(
          'Simple, $completed of 4 completed',
          ImpaktfullUiStepper.simple(currentStep: completed, amountOfSteps: 4),
          width: 300,
        ),
      for (final completed in [0, 2, 3])
        layoutGoldenCase(
          'Titles, $completed of 3 completed',
          ImpaktfullUiStepper(items: items(completed: completed)),
          width: 400,
        ),
      layoutGoldenCase(
        'Assets, 1 of 3 completed',
        ImpaktfullUiStepper(items: items(completed: 1, withAsset: true)),
        width: 400,
      ),
      layoutGoldenCase(
        'Vertical, 1 of 3 completed',
        ImpaktfullUiStepper(
          orientation: ImpaktfullUiStepperOrientation.vertical,
          items: items(completed: 1),
        ),
        size: const Size(200, 400),
      ),
      layoutGoldenCase(
        'Vertical assets, 2 of 3 completed',
        ImpaktfullUiStepper(
          orientation: ImpaktfullUiStepperOrientation.vertical,
          items: items(completed: 2, withAsset: true),
        ),
        size: const Size(200, 400),
      ),
    ],
  );
}
