import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/color_picker/color_picker_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/components/components_library_variant_descriptor.dart';

class ColorPickerLibraryVariant extends ComponentLibraryVariant<ColorPickerLibraryPrimaryInputs> {
  final ImpaktfullUiColorPickerType type;
  const ColorPickerLibraryVariant(
    this.type,
  );

  @override
  String get title => type.name;

  @override
  List<Widget> build(BuildContext context, ColorPickerLibraryPrimaryInputs inputs) {
    return [
      ComponentsLibraryVariantDescriptor(
        width: 500,
        wrapWithCard: true,
        child: ImpaktfullUiColorPicker(
          type: type,
          selectedColor: theme.colors.accent,
          onColorChanged: inputs.color.updateState,
        ),
      ),
      ComponentsLibraryVariantDescriptor(
        width: 500,
        wrapWithCard: true,
        child: ImpaktfullUiColorPicker(
          type: type,
          selectedColor: theme.colors.accent,
          allowedColors: [
            theme.colors.accent,
            theme.colors.primary,
            theme.colors.tertiary,
            theme.colors.border,
            theme.colors.success,
            theme.colors.warning,
            theme.colors.error,
            theme.colors.info,
            theme.colors.shadow,
            theme.colors.canvas,
            theme.colors.card,
          ],
          onColorChanged: inputs.color.updateState,
        ),
      ),
    ];
  }

  @override
  ColorPickerLibraryPrimaryInputs inputs() => ColorPickerLibraryPrimaryInputs();
}

class ColorPickerLibraryPrimaryInputs extends ColorPickerLibraryInputs {}
