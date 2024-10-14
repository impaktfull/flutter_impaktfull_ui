import 'package:impaktfull_ui_example/src/component_library/components/floating_action_button/floating_action_button_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_boolean_input.dart';

class FloatingActionButtonLibraryItem extends ComponentLibraryItem {
  const FloatingActionButtonLibraryItem();

  @override
  String get title => 'ImpaktfullUiFloatingActionButton';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const FloatingActionButtonLibraryVariant(),
    ];
  }
}

class FloatingActionButtonLibraryInputs extends ComponentLibraryInputs {
  final expanded = ComponentLibraryBoolInput(
    'Expanded',
    initialValue: true,
  );
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        expanded,
      ];
}
