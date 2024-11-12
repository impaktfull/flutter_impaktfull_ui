import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/time_picker/time_picker_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class TimePickerLibraryVariant
    extends ComponentLibraryVariant<TimePickerLibraryPrimaryInputs> {
  const TimePickerLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, TimePickerLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiTimePicker(
        label: 'Start time',
        value: null,
        onChanged: (value) {},
      ),
    ];
  }

  @override
  TimePickerLibraryPrimaryInputs inputs() => TimePickerLibraryPrimaryInputs();
}

class TimePickerLibraryPrimaryInputs extends TimePickerLibraryInputs {}
