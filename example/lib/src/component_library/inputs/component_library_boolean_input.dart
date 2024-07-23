import 'package:flutter/material.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';

class ComponentLibraryBoolInput extends ComponentLibraryInputItem<bool> {
  ComponentLibraryBoolInput(
    super.label, {
    super.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => TextField(
        onChanged: (value) => updateState(value == '1'),
      ),
    );
  }
}
