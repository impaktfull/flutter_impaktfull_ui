import 'package:impaktfull_ui_example/src/component_library/components/simple_list_item/simple_list_item_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class SimpleListItemLibraryItem extends ComponentLibraryItem {
  const SimpleListItemLibraryItem();

  @override
  String get title => 'ImpaktfullUiSimpleListItem';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const SimpleListItemLibraryVariant(),
    ];
  }
}

class SimpleListItemLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
