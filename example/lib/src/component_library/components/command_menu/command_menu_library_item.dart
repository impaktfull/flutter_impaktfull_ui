import 'package:impaktfull_ui_example/src/component_library/components/command_menu/command_menu_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_boolean_input.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_string_input.dart';

class CommandMenuLibraryItem extends ComponentLibraryItem {
  const CommandMenuLibraryItem();

  @override
  String get title => 'ImpaktfullUiCommandMenu';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const CommandMenuLibraryVariant(),
    ];
  }
}

class CommandMenuLibraryInputs extends ComponentLibraryInputs {
  final input = ComponentLibraryStringInput('Search value');
  final blurBackground = ComponentLibraryBoolInput('Blur background');
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        input,
        blurBackground,
      ];
}
