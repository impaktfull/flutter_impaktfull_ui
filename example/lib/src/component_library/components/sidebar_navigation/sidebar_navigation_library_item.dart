import 'package:impaktfull_ui_example/src/component_library/components/sidebar_navigation/sidebar_navigation_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class SidebarNavigationLibraryItem extends ComponentLibraryItem {
  const SidebarNavigationLibraryItem();

  @override
  String get title => 'ImpaktfullUiSidebarNavigation';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const SidebarNavigationLibraryVariant(),
    ];
  }
}

class SidebarNavigationLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
