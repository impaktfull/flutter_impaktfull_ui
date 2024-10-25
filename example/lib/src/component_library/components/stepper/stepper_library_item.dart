import 'package:impaktfull_ui_example/src/component_library/components/stepper/stepper_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class StepperLibraryItem extends ComponentLibraryItem {
  const StepperLibraryItem();

  @override
  String get title => 'ImpaktfullUiStepper';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const StepperLibraryVariant(),
    ];
  }
}

class StepperLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
