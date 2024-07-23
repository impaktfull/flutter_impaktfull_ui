import 'package:impaktfull_ui_example/src/component_library/components/dropdown/dropdown_library_variant.dart';
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
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
