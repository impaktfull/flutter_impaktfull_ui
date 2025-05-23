import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_boolean_input.dart';
import 'package:impaktfull_ui_example/src/component_library/items/check_box_list_item/check_box_list_item_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class CheckBoxListItemLibraryItem extends ComponentLibraryItem {
  const CheckBoxListItemLibraryItem();

  @override
  String get title => 'ImpaktfullUiCheckBoxListItem';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const CheckBoxListItemLibraryVariant(),
    ];
  }
}

class CheckBoxListItemLibraryInputs extends ComponentLibraryInputs {
  final value = ComponentLibraryBoolInput('Value');

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        value,
      ];
}
