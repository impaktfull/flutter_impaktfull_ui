import 'package:impaktfull_ui_example/src/component_library/items/auto_complete/auto_complete_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_int_input.dart';

class AutoCompleteLibraryItem extends ComponentLibraryItem {
  const AutoCompleteLibraryItem();

  @override
  String get title => 'ImpaktfullUiAutoComplete';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const AutoCompleteLibraryVariant(),
    ];
  }
}

class AutoCompleteLibraryInputs extends ComponentLibraryInputs {
  final selectedIndex = ComponentLibraryIntInput('Selected index');
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        selectedIndex,
      ];
}
