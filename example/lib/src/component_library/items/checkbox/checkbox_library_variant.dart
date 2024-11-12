import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/checkbox/checkbox_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class CheckboxLibraryVariant
    extends ComponentLibraryVariant<CheckboxLibraryPrimaryInputs> {
  CheckboxLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, CheckboxLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiCheckBox(
        value: inputs.value.value ?? false,
        onChanged: inputs.value.updateState,
      ),
      ImpaktfullUiCheckBox.indermediate(
        value: inputs.value.value,
        onChanged: (value) => inputs.value.toggle(),
      ),
    ];
  }

  @override
  CheckboxLibraryPrimaryInputs inputs() => CheckboxLibraryPrimaryInputs();
}

class CheckboxLibraryPrimaryInputs extends CheckboxLibraryInputs {}
