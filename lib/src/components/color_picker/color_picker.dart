import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/color_picker/color_picker_style.dart';
import 'package:impaktfull_ui_2/src/components/color_picker/type/color_picker_simple.dart';
import 'package:impaktfull_ui_2/src/components/color_picker/type/color_picker_slider.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'color_picker_style.dart';

part 'color_picker.describe.dart';

enum ImpaktfullUiColorPickerType {
  simple,
  slider,
}

class ImpaktfullUiColorPicker extends StatelessWidget
    with ComponentDescriptorMixin {
  final ImpaktfullUiColorPickerType type;
  final Color? selectedColor;
  final bool showActiveColor;
  final List<Color> allowedColors;
  final ValueChanged<Color> onColorChanged;
  final ImpaktfullUiColorPickerTheme? theme;

  const ImpaktfullUiColorPicker({
    required this.onColorChanged,
    required this.selectedColor,
    this.showActiveColor = false,
    this.allowedColors = const [],
    this.type = ImpaktfullUiColorPickerType.simple,
    this.theme,
    super.key,
  });

  static List<Color> get defaultColors => [
        Colors.red,
        Colors.yellow,
        Colors.green,
        Colors.cyan,
        Colors.blue,
        Colors.purple,
        Colors.red,
      ];
  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder<ImpaktfullUiColorPickerTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final allowedColors =
            this.allowedColors.isEmpty ? defaultColors : this.allowedColors;
        switch (type) {
          case ImpaktfullUiColorPickerType.simple:
            return ImpaktfullUiColorPickerSimple(
              selectedColor: selectedColor,
              allowedColors: allowedColors,
              onColorChanged: onColorChanged,
              componentTheme: componentTheme,
              showActiveColor: showActiveColor,
            );
          case ImpaktfullUiColorPickerType.slider:
            return ImpaktfullUiColorPickerSlider(
              selectedColor: selectedColor,
              allowedColors: allowedColors,
              onColorChanged: onColorChanged,
              componentTheme: componentTheme,
              showActiveColor: showActiveColor,
            );
        }
      },
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}
