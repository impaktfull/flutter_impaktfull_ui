import 'package:impaktfull_ui_example/src/component_library/components/table/table_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class TableLibraryItem extends ComponentLibraryItem {
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
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
