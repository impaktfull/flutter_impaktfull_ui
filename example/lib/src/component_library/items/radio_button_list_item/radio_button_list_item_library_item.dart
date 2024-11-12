import 'package:impaktfull_ui_example/src/component_library/items/radio_button_list_item/radio_button_list_item_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_string_input.dart';

class RadioButtonListItemLibraryItem extends ComponentLibraryItem {
  const RadioButtonListItemLibraryItem();

  @override
  String get title => 'ImpaktfullUiRadioButtonListItem';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const RadioButtonListItemLibraryVariant(),
    ];
  }
}

class RadioButtonListItemLibraryInputs extends ComponentLibraryInputs {
  final title = ComponentLibraryStringInput(
    'Title',
    initialValue: 'Title',
  );
  final subtitle = ComponentLibraryStringInput(
    'Subtitle',
    initialValue: 'Subtitle',
  );
  final groupValue = ComponentLibraryStringInput(
    'Switch value',
    initialValue: '1',
  );
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        title,
        subtitle,
        groupValue,
      ];
}
