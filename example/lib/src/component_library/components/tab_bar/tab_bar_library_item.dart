import 'package:impaktfull_ui_example/src/component_library/components/tab_bar/tab_bar_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class TabBarLibraryItem extends ComponentLibraryItem {
  const TabBarLibraryItem();

  @override
  String get title => 'ImpaktfullUiTabBar';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const TabBarLibraryVariant(),
    ];
  }
}

class TabBarLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
