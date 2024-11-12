import 'package:impaktfull_ui_example/src/component_library/items/nav_bar/nav_bar_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_boolean_input.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_string_input.dart';

class NavBarLibraryItem extends ComponentLibraryItem {
  const NavBarLibraryItem();

  @override
  String get title => 'ImpaktfullUiNavBar';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const NavBarLibraryVariant(),
    ];
  }
}

class NavBarLibraryInputs extends ComponentLibraryInputs {
  final title = ComponentLibraryStringInput(
    'Title',
    initialValue: 'My title',
  );
  final subtitle = ComponentLibraryStringInput(
    'Subtitle',
    initialValue: 'My subtitle',
  );
  final isFullScreen = ComponentLibraryBoolInput(
    'Is full screen',
    initialValue: false,
  );
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        title,
        subtitle,
        isFullScreen,
      ];
}
