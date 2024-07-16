import 'package:flutter/material.dart';
import 'package:impaktfull_ui_example/src/component_library/component_library.dart';

class ComponentLibraryIntInput extends ComponentLibraryInputItem<int> {
  ComponentLibraryIntInput(
    super.label, {
    super.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => TextField(
        onChanged: (value) => updateState(int.tryParse(value)),
      ),
    );
  }
}
