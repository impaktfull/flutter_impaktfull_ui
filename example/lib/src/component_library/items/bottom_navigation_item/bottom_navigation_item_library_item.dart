import 'package:impaktfull_ui_example/src/component_library/items/bottom_navigation_item/bottom_navigation_item_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_boolean_input.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_string_input.dart';

class BottomNavigationItemLibraryItem extends ComponentLibraryItem {
  const BottomNavigationItemLibraryItem();

  @override
  String get title => 'ImpaktfullUiBottomNavigationItem';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const BottomNavigationItemLibraryVariant(),
    ];
  }
}

class BottomNavigationItemLibraryInputs extends ComponentLibraryInputs {
  final isSelected = ComponentLibraryBoolInput(
    'Is selected',
    initialValue: false,
  );
  final badgeShow = ComponentLibraryBoolInput(
    'Badge show',
    initialValue: false,
  );
  final badgeText = ComponentLibraryStringInput('Badge text');

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        isSelected,
        badgeShow,
        badgeText,
      ];
}
