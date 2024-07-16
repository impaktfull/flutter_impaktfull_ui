import 'package:impaktfull_ui_example/src/component_library/component_library.dart';
import 'package:impaktfull_ui_example/src/component_library/variants/table/table_library_variant.dart';

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
