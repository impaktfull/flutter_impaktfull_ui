import 'package:impaktfull_ui_example/src/component_library/items/chat/chat_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class ChatLibraryItem extends ComponentLibraryItem {
  const ChatLibraryItem();

  @override
  String get title => 'ImpaktfullUiChat';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const ChatLibraryVariant(),
    ];
  }
}

class ChatLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
