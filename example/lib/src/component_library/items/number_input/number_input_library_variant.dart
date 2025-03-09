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
        label: 'Number input (int)',
        value: inputs.valueInt.value ?? 0,
        onChanged: inputs.valueInt.updateState,
        min: -1,
        max: 10,
      ),
      ImpaktfullUiNumberInput(
        label: 'Number input (double)',
        value: inputs.valueDouble.value ?? 0.0,
        onChanged: inputs.valueDouble.updateState,
        min: -1.0,
        max: 10.0,
      ),
    ];
  }

  @override
  NumberInputLibraryPrimaryInputs inputs() => NumberInputLibraryPrimaryInputs();
}

class NumberInputLibraryPrimaryInputs extends NumberInputLibraryInputs {}
