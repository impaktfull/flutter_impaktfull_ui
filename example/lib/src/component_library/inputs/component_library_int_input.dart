import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';

class ComponentLibraryIntInput extends ComponentLibraryInputItem<int> {
  final int? min;
  final int? max;

  ComponentLibraryIntInput(
    super.label, {
    super.initialValue,
    this.min,
    this.max,
  });

  @override
  void updateState(int? value) {
    final min = this.min;
    final max = this.max;
    if (min == null && max == null) {
      super.updateState(value);
      return;
    }
    if (value == null) {
      super.updateState(null);
      return;
    }
    if (min != null && value < min) {
      super.updateState(min);
      return;
    }
    if (max != null && value > max) {
      super.updateState(max);
      return;
    }
    super.updateState(value);
  }

  void toggle(int value) {
    if (this.value == value) {
      updateState(null);
    } else {
      updateState(value);
    }
  }

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
