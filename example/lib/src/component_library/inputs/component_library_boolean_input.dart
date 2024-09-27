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
    String stringValue;
    if (value == true) {
      stringValue = '1';
    } else if (value == false) {
      stringValue = '0';
    } else {
      stringValue = '';
    }
    return ImpaktfullUiInputField(
      value: stringValue,
      onChanged: (value) => updateState(value == '1'),
    );
  }
}
