import 'package:impaktfull_ui_example/src/component_library/components/list_view/list_view_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class ListViewLibraryItem extends ComponentLibraryItem {
  const ListViewLibraryItem();

  @override
  String get title => 'ImpaktfullUiListView';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const ListViewLibraryVariant(),
    ];
  }
}

class ListViewLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
