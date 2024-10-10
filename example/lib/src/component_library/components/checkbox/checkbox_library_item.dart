import 'package:impaktfull_ui_example/src/component_library/components/checkbox/checkbox_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_boolean_input.dart';

class CheckboxLibraryItem extends ComponentLibraryItem {
  const CheckboxLibraryItem();

  @override
  String get title => 'ImpaktfullUiCheckbox';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      CheckboxLibraryVariant(),
    ];
  }
}

class CheckboxLibraryInputs extends ComponentLibraryInputs {
  final value = ComponentLibraryBoolInput(
    'Value',
    initialValue: true,
    allowNull: true,
  );

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        value,
      ];
}
