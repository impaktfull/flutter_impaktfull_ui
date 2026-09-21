import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_layout_test_helpers.dart';

// The active/inactive step bars are tested in stepper_test.dart.
void main() {
  test('currentStep is the first step that is not completed', () {
    ImpaktfullUiStepper stepper(List<bool> completed) => ImpaktfullUiStepper(
          items: [
            for (final isCompleted in completed)
              ImpaktfullUiStepperItem(isCompleted: isCompleted),
          ],
        );
    expect(stepper([false, false]).currentStep, 0);
    expect(stepper([true, false]).currentStep, 1);
    expect(stepper([true, true]).currentStep, -1);
    expect(stepper([true, true]).amountOfSteps, 2);
  });

  test('simple creates the items', () {
    final stepper = ImpaktfullUiStepper.simple(
      currentStep: 2,
      amountOfSteps: 5,
    );
    expect(stepper.items.map((item) => item.isCompleted),
        [true, true, false, false, false]);
    expect(stepper.currentStep, 2);
    expect(stepper.orientation, ImpaktfullUiStepperOrientation.horizontal);
  });

  testWidgets('shows the titles and subtitles', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiStepper(
        items: [
          ImpaktfullUiStepperItem(
            isCompleted: true,
            title: 'Step 1',
            subtitle: 'Sub 1',
          ),
          ImpaktfullUiStepperItem(isCompleted: false, title: 'Step 2'),
        ],
      ),
    );
    expect(find.text('Step 1'), findsOneWidget);
    expect(find.text('Sub 1'), findsOneWidget);
    expect(find.text('Step 2'), findsOneWidget);
  });

  testWidgets('horizontal steps share the width', (tester) async {
    await pumpLayoutApp(
      tester,
      Align(
        alignment: Alignment.topCenter,
        child: ImpaktfullUiStepper(
          items: [
            for (var i = 0; i < 3; i++)
              ImpaktfullUiStepperItem(isCompleted: false, title: 'Step $i'),
          ],
        ),
      ),
    );
    final left = [
      for (var i = 0; i < 3; i++) tester.getTopLeft(find.text('Step $i')).dx,
    ];
    expect(left[0], lessThan(left[1]));
    expect(left[1] - left[0], moreOrLessEquals(left[2] - left[1]));
  });

  testWidgets('vertical steps are stacked', (tester) async {
    await pumpLayoutApp(
      tester,
      ImpaktfullUiStepper(
        orientation: ImpaktfullUiStepperOrientation.vertical,
        items: [
          for (var i = 0; i < 3; i++)
            ImpaktfullUiStepperItem(isCompleted: false, title: 'Step $i'),
        ],
      ),
    );
    final top = [
      for (var i = 0; i < 3; i++) tester.getTopLeft(find.text('Step $i')).dy,
    ];
    expect(top[0], lessThan(top[1]));
    expect(top[1], lessThan(top[2]));
    expect(tester.takeException(), isNull);
  });

  testWidgets('completed asset steps use the completed colors', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiStepper(
        items: [
          ImpaktfullUiStepperItem(isCompleted: true, asset: testAsset),
          ImpaktfullUiStepperItem(isCompleted: false, asset: testAsset),
        ],
      ),
    );
    final theme = ImpaktfullUiStepperTheme.of(
      tester.element(find.byType(ImpaktfullUiStepper)),
    );
    final colors = tester
        .widgetList<ImpaktfullUiAssetWidget>(
            find.byType(ImpaktfullUiAssetWidget))
        .map((asset) => asset.color)
        .toList();
    expect(colors, [
      theme.colors.assetColorCompleted,
      theme.colors.assetColor,
    ]);
  });
}
