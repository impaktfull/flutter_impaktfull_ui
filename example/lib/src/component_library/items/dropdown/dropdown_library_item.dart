import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_string_input.dart';
import 'package:impaktfull_ui_example/src/component_library/items/dropdown/dropdown_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class DropdownLibraryItem extends ComponentLibraryItem {
  const DropdownLibraryItem();

  @override
  String get title => 'ImpaktfullUiDropdown';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      DropdownVariant(),
    ];
  }
}

class DropdownLibraryInputs extends ComponentLibraryInputs {
  final selectedValue = ComponentLibraryStringInput('Selected Value');

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        selectedValue,
      ];
}
