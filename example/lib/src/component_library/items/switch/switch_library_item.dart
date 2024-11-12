import 'package:impaktfull_ui_example/src/component_library/items/switch/switch_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_boolean_input.dart';

class SwitchLibraryItem extends ComponentLibraryItem {
  const SwitchLibraryItem();

  @override
  String get title => 'ImpaktfullUiSwitch';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const SwitchLibraryVariant(),
    ];
  }
}

class SwitchLibraryInputs extends ComponentLibraryInputs {
  final value = ComponentLibraryBoolInput('Value');

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        value,
      ];
}
