import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/list_item/list_item_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class ListItemLibraryItem extends ComponentLibraryItem {
  const ListItemLibraryItem();

  @override
  String get title => 'ImpaktfullUiListItem';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      for (final type in ImpaktfullUiListItemType.values) ...[
        ListItemLibraryVariant(type),
      ],
    ];
  }
}

class ListItemLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
