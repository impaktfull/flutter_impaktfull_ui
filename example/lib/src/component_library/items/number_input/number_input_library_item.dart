import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_double_input.dart';
import 'package:impaktfull_ui_example/src/component_library/items/number_input/number_input_library_variant.dart';
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
  final ComponentLibraryIntInput valueInt = ComponentLibraryIntInput(
    'Int value',
    initialValue: 0,
  );

  final ComponentLibraryDoubleInput valueDouble = ComponentLibraryDoubleInput(
    'Double value',
    initialValue: 0.0,
  );
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        valueInt,
        valueDouble,
      ];
}
