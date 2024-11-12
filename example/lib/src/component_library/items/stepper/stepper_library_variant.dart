import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/stepper/stepper_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/component/components_library_variant_descriptor.dart';

class StepperLibraryVariant
    extends ComponentLibraryVariant<StepperLibraryPrimaryInputs> {
  const StepperLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, StepperLibraryPrimaryInputs inputs) {
    return [
      ComponentsLibraryVariantDescriptor(
        wrapWithCard: true,
        child: ImpaktfullUiStepper.simple(
          currentStep: 3,
          amountOfSteps: 5,
        ),
      ),
      const ComponentsLibraryVariantDescriptor(
        wrapWithCard: true,
        child: ImpaktfullUiStepper(
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
      ),
      const ComponentsLibraryVariantDescriptor(
        wrapWithCard: true,
        child: ImpaktfullUiStepper(
          orientation: ImpaktfullUiStepperOrientation.vertical,
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
      ),
      ComponentsLibraryVariantDescriptor(
        wrapWithCard: true,
        child: ImpaktfullUiStepper(
          items: [
            ImpaktfullUiStepperItem(
              isCompleted: true,
              title: 'Step 1',
              subtitle: 'User info',
              asset: theme.assets.icons.user,
            ),
            ImpaktfullUiStepperItem(
              isCompleted: true,
              title: 'Step 2',
              subtitle: 'General settings',
              asset: theme.assets.icons.settings,
            ),
            ImpaktfullUiStepperItem(
              isCompleted: false,
              title: 'Step 3',
              subtitle: 'Finishing up',
              asset: theme.assets.icons.confetti,
            ),
          ],
        ),
      ),
    ];
  }

  @override
  StepperLibraryPrimaryInputs inputs() => StepperLibraryPrimaryInputs();
}

class StepperLibraryPrimaryInputs extends StepperLibraryInputs {}
