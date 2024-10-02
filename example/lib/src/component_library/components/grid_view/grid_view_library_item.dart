import 'package:impaktfull_ui_example/src/component_library/components/grid_view/grid_view_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class GridViewLibraryItem extends ComponentLibraryItem {
  const GridViewLibraryItem();

  @override
  String get title => 'ImpaktfullUiGridView';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const GridViewLibraryVariant(),
    ];
  }
}

class GridViewLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
