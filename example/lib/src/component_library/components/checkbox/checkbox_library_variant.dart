import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/checkbox/checkbox_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class CheckboxLibraryVariant extends ComponentLibraryVariant<CheckboxLibraryPrimaryInputs> {
  CheckboxLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, CheckboxLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiCheckBox(
        value: inputs.value.value ?? false,
        onChanged: inputs.value.updateState,
      ),
    ];
  }

  @override
  CheckboxLibraryPrimaryInputs inputs() => CheckboxLibraryPrimaryInputs();
}

class CheckboxLibraryPrimaryInputs extends CheckboxLibraryInputs {}
