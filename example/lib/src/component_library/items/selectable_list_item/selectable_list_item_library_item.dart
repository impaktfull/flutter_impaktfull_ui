import 'package:impaktfull_ui_example/src/component_library/items/selectable_list_item/selectable_list_item_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_boolean_input.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_string_input.dart';

class SelectableListItemLibraryItem extends ComponentLibraryItem {
  const SelectableListItemLibraryItem();

  @override
  String get title => 'ImpaktfullUiSelectableListItem';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const SelectableListItemLibraryVariant(),
    ];
  }
}

class SelectableListItemLibraryInputs extends ComponentLibraryInputs {
  final title = ComponentLibraryStringInput(
    'Title',
    initialValue: 'Title',
  );
  final subtitle = ComponentLibraryStringInput(
    'Subtitle',
    initialValue: 'Subtitle',
  );
  final value = ComponentLibraryBoolInput(
    'Value',
    initialValue: true,
  );
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        title,
        subtitle,
        value,
      ];
}
