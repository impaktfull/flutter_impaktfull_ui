import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/color_input_field/color_input_field_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class ColorInputFieldLibraryVariant
    extends ComponentLibraryVariant<ColorInputFieldLibraryPrimaryInputs> {
  const ColorInputFieldLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, ColorInputFieldLibraryPrimaryInputs inputs) {
    return [
      const ImpaktfullUiColorInputField(
        label: 'Color',
      ),
    ];
  }

  @override
  ColorInputFieldLibraryPrimaryInputs inputs() =>
      ColorInputFieldLibraryPrimaryInputs();
}

class ColorInputFieldLibraryPrimaryInputs
    extends ColorInputFieldLibraryInputs {}
