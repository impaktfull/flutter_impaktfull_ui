import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';

class ComponentLibraryColorInput extends ComponentLibraryInputItem<Color> {
  ComponentLibraryColorInput(
    super.label, {
    super.initialValue,
    super.extraInfo,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiCard(
      width: 200,
      height: 200,
      child: ImpaktfullUiColorPicker(
        selectedColor: value,
        showActiveColor: true,
        onColorChanged: updateState,
      ),
    );
  }
}
