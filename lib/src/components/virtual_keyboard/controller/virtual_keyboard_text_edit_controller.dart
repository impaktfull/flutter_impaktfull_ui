import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/components/virtual_keyboard/virtual_keyboard.dart';

class ImpaktfullUiVirtualKeyboardTextEditController
    extends TextEditingController {
  final ImpaktfullUiVirtualKeyboardConfig config;

  ImpaktfullUiVirtualKeyboardTextEditController({
    super.text,
    required this.config,
  });

  void openKeyboard(
    BuildContext context, {
    ValueChanged<String>? onChanged,
    VoidCallback? onSubmitted,
    @Deprecated('Use onSubmitted instead. Will be removed in 1.0.0.')
    VoidCallback? onSubmit,
    bool obscureText = false,
  }) {
    ImpaktfullUiVirtualKeyboard.show(
      context: context,
      controller: this,
      onChanged: onChanged,
      onSubmitted: onSubmitted ?? onSubmit,
      obscureText: obscureText,
    );
  }
}
