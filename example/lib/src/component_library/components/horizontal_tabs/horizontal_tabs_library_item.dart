import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_int_input.dart';
import 'package:impaktfull_ui_example/src/component_library/components/horizontal_tabs/horizontal_tabs_library_variant.dart';

class HorizontalTabsLibraryItem extends ComponentLibraryItem {
  const HorizontalTabsLibraryItem();

  @override
  String get title => 'ImpaktfullUiHorizontalTabs';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      HorizontalTabsVariant(),
    ];
  }
}

class HorizontalTabsLibraryInputs extends ComponentLibraryInputs {
  final selectedIndex = ComponentLibraryIntInput(
    'SelectedIndex',
    initialValue: 0,
  );
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        selectedIndex,
      ];
}
