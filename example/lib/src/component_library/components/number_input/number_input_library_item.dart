import 'package:impaktfull_ui_example/src/component_library/components/number_input/number_input_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_int_input.dart';

class NumberInputLibraryItem extends ComponentLibraryItem {
  const NumberInputLibraryItem();

  @override
  String get title => 'ImpaktfullUiNumberInput';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const NumberInputLibraryVariant(),
    ];
  }
}

class NumberInputLibraryInputs extends ComponentLibraryInputs {
  final ComponentLibraryIntInput value = ComponentLibraryIntInput(
    'Value',
    initialValue: 0,
  );
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        value,
      ];
}
