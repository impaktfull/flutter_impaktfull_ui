import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';

class ComponentLibraryDateTimeInput
    extends ComponentLibraryInputItem<DateTime> {
  ComponentLibraryDateTimeInput(
    super.label, {
    super.initialValue,
    super.extraInfo,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiCard(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ImpaktfullUiDatePicker(
        selectedDate: value,
        onDateChanged: updateState,
        margin: const EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
