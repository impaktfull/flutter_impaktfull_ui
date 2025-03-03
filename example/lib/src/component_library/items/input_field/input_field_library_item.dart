import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_boolean_input.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_icon_input.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_string_input.dart';
import 'package:impaktfull_ui_example/src/component_library/items/input_field/input_field_library_variant.dart';

class InputFieldLibraryItem extends ComponentLibraryItem {
  const InputFieldLibraryItem();

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
  final label =
      ComponentLibraryStringInput('Label', initialValue: 'Email adress');
  final leadingIcon = ComponentLibraryIconInput('Leading icon');
  final placholder = ComponentLibraryStringInput('Placeholder',
      initialValue: 'Enter your email adress');
  final value = ComponentLibraryStringInput('Value');
  final hint = ComponentLibraryStringInput('Hint');
  final error = ComponentLibraryStringInput('Error');
  final showLabelAction = ComponentLibraryBoolInput('Show label action');
  final showTrailingAction = ComponentLibraryBoolInput('Show trailing action');
  final multiLine = ComponentLibraryBoolInput('Multi line');
  final obscureText = ComponentLibraryBoolInput('Obscure text');

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        label,
        leadingIcon,
        placholder,
        value,
        hint,
        error,
        showLabelAction,
        showTrailingAction,
        multiLine,
        obscureText,
      ];
}
