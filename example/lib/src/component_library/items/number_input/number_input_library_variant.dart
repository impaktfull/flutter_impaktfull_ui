import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/number_input/number_input_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class NumberInputLibraryVariant
    extends ComponentLibraryVariant<NumberInputLibraryPrimaryInputs> {
  const NumberInputLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, NumberInputLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiNumberInput(
        label: 'Number input',
        value: inputs.value.value ?? 0,
        onChanged: inputs.value.updateState,
        min: -1,
        max: 10,
      ),
    ];
  }

  @override
  NumberInputLibraryPrimaryInputs inputs() => NumberInputLibraryPrimaryInputs();
}

class NumberInputLibraryPrimaryInputs extends NumberInputLibraryInputs {}
