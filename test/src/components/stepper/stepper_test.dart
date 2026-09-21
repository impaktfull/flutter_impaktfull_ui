import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  /// The step colors in order, as 'active' or 'inactive'.
  List<String> stepStates(WidgetTester tester) {
    final context = tester.element(find.byType(ImpaktfullUiStepper));
    final colors = ImpaktfullUiStepperTheme.of(context).colors;
    return tester
        .widgetList<Container>(find.descendant(
          of: find.byType(ImpaktfullUiStepper),
          matching: find.byType(Container),
        ))
        .map((container) => (container.decoration as BoxDecoration?)?.color)
        .where((color) =>
            color == colors.activeStep || color == colors.inactiveStep)
        .map((color) => color == colors.activeStep ? 'active' : 'inactive')
        .toList();
  }

  testWidgets('some steps completed', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiStepper.simple(currentStep: 2, amountOfSteps: 4),
    );
    expect(stepStates(tester), ['active', 'active', 'inactive', 'inactive']);
  });

  testWidgets('all steps completed renders every step active', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiStepper.simple(currentStep: 3, amountOfSteps: 3),
    );
    expect(stepStates(tester), ['active', 'active', 'active']);
  });

  testWidgets('no steps completed renders every step inactive', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiStepper.simple(currentStep: 0, amountOfSteps: 3),
    );
    expect(stepStates(tester), ['inactive', 'inactive', 'inactive']);
  });

  testWidgets('identical items use their own position', (tester) async {
    const completed = ImpaktfullUiStepperItem(isCompleted: true);
    const notCompleted = ImpaktfullUiStepperItem(isCompleted: false);
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiStepper(
        items: [completed, notCompleted, completed],
      ),
    );
    expect(stepStates(tester), ['active', 'inactive', 'inactive']);
  });
}
