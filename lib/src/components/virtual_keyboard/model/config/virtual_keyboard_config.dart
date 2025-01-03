import 'package:impaktfull_ui/src/components/virtual_keyboard/model/virtual_keyboard_key.dart';

abstract class VirtualKeyboardConfig {
  List<List<ImpaktfullUiVirtualKeyboardKeyItem>> get keys;

  const VirtualKeyboardConfig();
}
