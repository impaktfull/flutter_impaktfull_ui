import 'package:impaktfull_ui_example/src/component_library/components/modal/modal_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_boolean_input.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_int_input.dart';

class ModalLibraryItem extends ComponentLibraryItem {
  const ModalLibraryItem();

  @override
  String get title => 'ImpaktfullUiModal';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const ModalLibraryVariant(),
    ];
  }
}

class ModalLibraryInputs extends ComponentLibraryInputs {
  final ComponentLibraryBoolInput showDividers = ComponentLibraryBoolInput('Show dividers');
  final ComponentLibraryBoolInput showBackgroundBlur = ComponentLibraryBoolInput('Show background blur');
  final ComponentLibraryIntInput amountOfActions = ComponentLibraryIntInput(
    'Amount of actions',
    initialValue: 1,
    min: 1,
    max: 3,
  );

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        showDividers,
        showBackgroundBlur,
        amountOfActions,
      ];
}
