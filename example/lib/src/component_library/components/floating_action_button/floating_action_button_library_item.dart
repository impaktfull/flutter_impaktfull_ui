import 'package:impaktfull_ui_example/src/component_library/components/floating_action_button/floating_action_button_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

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
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
