import 'package:impaktfull_ui_example/src/component_library/items/pin_code/pin_code_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_string_input.dart';

class PinCodeLibraryItem extends ComponentLibraryItem {
  const PinCodeLibraryItem();

  @override
  String get title => 'ImpaktfullUiPinCode';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const PinCodeLibraryVariant(),
    ];
  }
}

class PinCodeLibraryInputs extends ComponentLibraryInputs {
  final code = ComponentLibraryStringInput('Code');

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        code,
      ];
}
