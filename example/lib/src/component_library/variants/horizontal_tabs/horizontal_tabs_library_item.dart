import 'package:impaktfull_ui_example/src/component_library/component_library.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_int_input.dart';
import 'package:impaktfull_ui_example/src/component_library/variants/horizontal_tabs/horizontal_tabs_library_variant.dart';

class HorizontalTabsLibraryItem extends ComponentLibraryItem {
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
  final ComponentLibraryIntInput selectedIndex = ComponentLibraryIntInput(
    'SelectedIndex',
    initialValue: 0,
  );
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        selectedIndex,
      ];
}
