import 'package:impaktfull_ui_example/src/component_library/items/sidebar_navigation_item/sidebar_navigation_item_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_int_input.dart';

class SidebarNavigationItemLibraryItem extends ComponentLibraryItem {
  const SidebarNavigationItemLibraryItem();

  @override
  String get title => 'ImpaktfullUiSidebarNavigationItem';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const SidebarNavigationItemLibraryVariant(),
    ];
  }
}

class SidebarNavigationItemLibraryInputs extends ComponentLibraryInputs {
  final selectedPage = ComponentLibraryIntInput(
    'Selected Page',
    initialValue: 0,
  );
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        selectedPage,
      ];
}
