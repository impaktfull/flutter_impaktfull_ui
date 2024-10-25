import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/stepper/stepper_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class StepperLibraryVariant
    extends ComponentLibraryVariant<StepperLibraryPrimaryInputs> {
  const StepperLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, StepperLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiStepper.simple(
        currentStep: 3,
        amountOfSteps: 5,
      ),
      const ImpaktfullUiStepper(
        items: [
          ImpaktfullUiStepperItem(
            isCompleted: true,
            title: 'Step 1',
            subtitle: 'Basic information',
          ),
          ImpaktfullUiStepperItem(
            isCompleted: true,
            title: 'Step 2',
            subtitle: 'Some more information',
          ),
          ImpaktfullUiStepperItem(
            isCompleted: false,
            title: 'Step 3',
            subtitle: 'Important information',
          ),
          ImpaktfullUiStepperItem(
            isCompleted: false,
            title: 'Step 4',
            subtitle: 'GDPR information',
          ),
        ],
      ),
    ];
  }

  @override
  StepperLibraryPrimaryInputs inputs() => StepperLibraryPrimaryInputs();
}

class StepperLibraryPrimaryInputs extends StepperLibraryInputs {}
