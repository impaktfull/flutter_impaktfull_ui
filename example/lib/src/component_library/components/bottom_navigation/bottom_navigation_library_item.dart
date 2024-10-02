import 'package:impaktfull_ui_example/src/component_library/components/bottom_navigation/bottom_navigation_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_int_input.dart';

class BottomNavigationLibraryItem extends ComponentLibraryItem {
  const BottomNavigationLibraryItem();

  @override
  String get title => 'ImpaktfullUiBottomNavigation';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const BottomNavigationLibraryVariant(),
    ];
  }
}

class BottomNavigationLibraryInputs extends ComponentLibraryInputs {
  final ComponentLibraryIntInput selectedIndex = ComponentLibraryIntInput(
    'Selectred Index',
    initialValue: 0,
  );
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        selectedIndex,
      ];
}
