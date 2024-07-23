import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';

class ComponentLibraryIntInput extends ComponentLibraryInputItem<int> {
  ComponentLibraryIntInput(
    super.label, {
    super.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => ImpaktfullUiInputField(
        value: value == null ? '' : value.toString(),
        textInputType: TextInputType.number,
        onChanged: (value) => updateState(int.tryParse(value)),
      ),
    );
  }
}
