import 'package:impaktfull_ui_example/src/component_library/items/virtual_keyboard/virtual_keyboard_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class VirtualKeyboardLibraryItem extends ComponentLibraryItem {
  const VirtualKeyboardLibraryItem();

  @override
  String get title => 'ImpaktfullUiVirtualKeyboard';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const VirtualKeyboardLibraryVariant(),
    ];
  }
}

class VirtualKeyboardLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
