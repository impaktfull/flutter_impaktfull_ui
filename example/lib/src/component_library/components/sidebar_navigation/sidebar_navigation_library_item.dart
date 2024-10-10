import 'package:impaktfull_ui_example/src/component_library/components/sidebar_navigation/sidebar_navigation_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_int_input.dart';

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
  final amountOfSecondaryItems = ComponentLibraryIntInput(
    'Amount of secondary items',
    initialValue: 0,
  );
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        amountOfSecondaryItems,
      ];
}
