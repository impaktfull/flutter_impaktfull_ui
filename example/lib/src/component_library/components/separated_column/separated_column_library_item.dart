import 'package:impaktfull_ui_example/src/component_library/components/separated_column/separated_column_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_boolean_input.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_int_input.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_string_input.dart';

class SeparatedColumnLibraryItem extends ComponentLibraryItem {
  const SeparatedColumnLibraryItem();

  @override
  String get title => 'ImpaktfullUiSeparatedColumn';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const SeparatedColumnLibraryVariant(),
    ];
  }
}

class SeparatedColumnLibraryInputs extends ComponentLibraryInputs {
  final ComponentLibraryStringInput title = ComponentLibraryStringInput(
    'Title',
    initialValue: 'My title',
  );

  final ComponentLibraryIntInput amountOfItems = ComponentLibraryIntInput(
    'Amount of items',
    initialValue: 2,
  );

  final ComponentLibraryBoolInput showFirstDivider = ComponentLibraryBoolInput(
    'Show first divider',
  );

  final ComponentLibraryBoolInput showLastDivider = ComponentLibraryBoolInput(
    'Show last divider',
  );

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        title,
        amountOfItems,
        showFirstDivider,
        showLastDivider,
      ];
}
