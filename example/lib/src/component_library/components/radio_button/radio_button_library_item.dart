import 'package:impaktfull_ui_example/src/component_library/components/radio_button/radio_button_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_string_input.dart';

class RadioButtonLibraryItem extends ComponentLibraryItem {
  const RadioButtonLibraryItem();

  @override
  String get title => 'ImpaktfullUiRadioButton';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const RadioButtonLibraryVariant(),
    ];
  }
}

class RadioButtonLibraryInputs extends ComponentLibraryInputs {
  final groupValue = ComponentLibraryStringInput(
    'Group value',
    initialValue: '1',
  );
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        groupValue,
      ];
}
