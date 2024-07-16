import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/component_library.dart';

class ComponentLibraryStringInput extends ComponentLibraryInputItem<String> {
  ComponentLibraryStringInput(
    super.label, {
    super.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => ImpaktfullUiInputField(
        value: value,
        onChanged: (value) => updateState(value),
      ),
    );
  }

  @override
  void updateState(String? value) {
    if (value == null || value.isEmpty) {
      super.updateState(null);
    } else {
      super.updateState(value);
    }
  }
}
