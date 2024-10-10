import 'package:impaktfull_ui_example/src/component_library/components/tab_bar_item/tab_bar_item_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class TabBarItemLibraryItem extends ComponentLibraryItem {
  const TabBarItemLibraryItem();

  @override
  String get title => 'ImpaktfullUiTabBarItem';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const TabBarItemLibraryVariant(),
    ];
  }
}

class TabBarItemLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
