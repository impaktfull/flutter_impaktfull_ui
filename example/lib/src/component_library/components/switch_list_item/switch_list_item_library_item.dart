import 'package:impaktfull_ui_example/src/component_library/components/switch_list_item/switch_list_item_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_boolean_input.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_string_input.dart';

class SwitchListItemLibraryItem extends ComponentLibraryItem {
  const SwitchListItemLibraryItem();

  @override
  String get title => 'ImpaktfullUiSwitchListItem';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const SwitchListItemLibraryVariant(),
    ];
  }
}

class SwitchListItemLibraryInputs extends ComponentLibraryInputs {
  final ComponentLibraryStringInput title = ComponentLibraryStringInput(
    'Title',
    initialValue: 'Title',
  );
  final ComponentLibraryStringInput subtitle = ComponentLibraryStringInput(
    'Subtitle',
    initialValue: 'Subtitle',
  );
  final ComponentLibraryBoolInput switchValue =
      ComponentLibraryBoolInput('Switch value');
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        title,
        subtitle,
        switchValue,
      ];
}
