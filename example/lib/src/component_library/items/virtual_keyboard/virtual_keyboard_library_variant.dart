import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/virtual_keyboard/virtual_keyboard_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class VirtualKeyboardLibraryVariant extends ComponentLibraryVariant<VirtualKeyboardLibraryPrimaryInputs> {
  const VirtualKeyboardLibraryVariant();

  @override
  String get title => 'Default';

  static final controller = ImpaktfullUiVirtualKeyboardTextEditController(
    config: ImpaktfullUiVirtualQwertyKeyboardConfig(),
  );

  @override
  List<Widget> build(BuildContext context, VirtualKeyboardLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiVirtualKeyboard(
        controller: controller,
      ),
      ImpaktfullUiButton(
        title: 'Open keyboard',
        onTap: () => controller.openKeyboard(context),
        type: ImpaktfullUiButtonType.primary,
      ),
      ImpaktfullUiInputField(
        value: '',
        controller: controller,
        onChanged: (value) => ImpaktfullUiNotification.show(title: 'New value `$value`'),
      ),
      ImpaktfullUiInputField(
        value: '',
        controller: controller,
        obscureText: true,
        onChanged: (value) => ImpaktfullUiNotification.show(title: 'New value `$value`'),
      ),
    ];
  }

  @override
  VirtualKeyboardLibraryPrimaryInputs inputs() => VirtualKeyboardLibraryPrimaryInputs();
}

class VirtualKeyboardLibraryPrimaryInputs extends VirtualKeyboardLibraryInputs {}
