import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';

class ComponentLibraryBoolInput extends ComponentLibraryInputItem<bool> {
  final bool allowNull;
  ComponentLibraryBoolInput(
    super.label, {
    super.initialValue,
    this.allowNull = false,
  });

  void toggle() {
    final value = this.value;
    bool? newValue;
    if (allowNull) {
      if (value == true) {
        newValue = null;
      } else if (value == false) {
        newValue = true;
      } else {
        newValue = false;
      }
    } else {
      if (value == null) return;
      newValue = !value;
    }
    updateState(newValue);
  }

  @override
  Widget build(BuildContext context) {
    if (allowNull) {
      return ImpaktfullUiCheckBox.indermediate(
        value: value,
        onChanged: updateState,
      );
    }
    return ImpaktfullUiCheckBox(
      value: value ?? false,
      onChanged: updateState,
    );
  }
}
