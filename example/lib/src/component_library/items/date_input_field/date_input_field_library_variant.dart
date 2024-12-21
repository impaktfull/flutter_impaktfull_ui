import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/date_input_field/date_input_field_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class DateInputFieldLibraryVariant
    extends ComponentLibraryVariant<DateInputFieldLibraryPrimaryInputs> {
  const DateInputFieldLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, DateInputFieldLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiDateInputField(
        label: 'Date',
        placeholder: 'Select date',
        date: inputs.date.value,
        onDateSelected: inputs.date.updateState,
      ),
    ];
  }

  @override
  DateInputFieldLibraryPrimaryInputs inputs() =>
      DateInputFieldLibraryPrimaryInputs();
}

class DateInputFieldLibraryPrimaryInputs extends DateInputFieldLibraryInputs {}
