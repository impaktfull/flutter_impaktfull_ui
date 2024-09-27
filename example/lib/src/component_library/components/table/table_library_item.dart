import 'package:impaktfull_ui_example/src/component_library/components/table/table_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_boolean_input.dart';

class TableLibraryItem extends ComponentLibraryItem {
  const TableLibraryItem();

  @override
  String get title => 'ImpaktfullUiTable';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      TableVariant(),
    ];
  }
}

class TableLibraryInputs extends ComponentLibraryInputs {
  final ComponentLibraryBoolInput sortOnTitle1 = ComponentLibraryBoolInput(
    'Sorted on Title 1',
    allowNull: true,
  );

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        sortOnTitle1,
      ];
}
