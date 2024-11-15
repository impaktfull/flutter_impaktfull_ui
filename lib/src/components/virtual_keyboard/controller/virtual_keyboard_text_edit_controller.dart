import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/components/virtual_keyboard/virtual_keyboard.dart';

class ImpaktfullUiVirtualKeyboardTextEditController
    extends TextEditingController {
  final VirtualKeyboardConfig config;

  ImpaktfullUiVirtualKeyboardTextEditController({
    super.text,
    required this.config,
  });

  void openKeyboard(
    BuildContext context, {
    ValueChanged<String>? onChanged,
    VoidCallback? onSubmit,
    bool obscureText = false,
  }) {
    ImpaktfullUiVirtualKeyboard.show(
      context: context,
      controller: this,
      onChanged: onChanged,
      onSubmit: onSubmit,
      obscureText: obscureText,
    );
  }
}
