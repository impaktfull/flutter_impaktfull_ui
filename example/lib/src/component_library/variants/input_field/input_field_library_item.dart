import 'package:impaktfull_ui_example/src/component_library/component_library.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_icon_input.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_string_input.dart';
import 'package:impaktfull_ui_example/src/component_library/variants/input_field/input_field_library_variant.dart';

class InputFieldLibraryItem extends ComponentLibraryItem {
  @override
  String get title => 'ImpaktfullUiInputFIeld';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      InputFieldVariant(),
    ];
  }
}

class InputLibraryInputs extends ComponentLibraryInputs {
  final ComponentLibraryStringInput label = ComponentLibraryStringInput('Label');
  final ComponentLibraryIconInput leadingIcon = ComponentLibraryIconInput('Leading icon');
  final ComponentLibraryStringInput hint = ComponentLibraryStringInput('Value');
  final ComponentLibraryStringInput value = ComponentLibraryStringInput('Value');

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        label,
        leadingIcon,
        hint,
        value,
      ];
}
