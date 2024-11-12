import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/radio_button/radio_button_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class RadioButtonLibraryVariant
    extends ComponentLibraryVariant<RadioButtonLibraryPrimaryInputs> {
  const RadioButtonLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, RadioButtonLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiRadioButton(
        value: '1',
        groupValue: inputs.groupValue.value,
        onChanged: inputs.groupValue.updateState,
      ),
      ImpaktfullUiRadioButton(
        value: '2',
        groupValue: inputs.groupValue.value,
        onChanged: inputs.groupValue.updateState,
      ),
    ];
  }

  @override
  RadioButtonLibraryPrimaryInputs inputs() => RadioButtonLibraryPrimaryInputs();
}

class RadioButtonLibraryPrimaryInputs extends RadioButtonLibraryInputs {}
