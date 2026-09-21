import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/color_picker/color_picker_style.dart';
import 'package:impaktfull_ui/src/components/color_picker/type/color_picker_simple.dart';
import 'package:impaktfull_ui/src/components/color_picker/type/color_picker_slider.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'color_picker_style.dart';

enum ImpaktfullUiColorPickerType {
  simple,
  slider,
}

class ImpaktfullUiColorPicker extends StatelessWidget {
  final ImpaktfullUiColorPickerType type;
  final Color? selectedColor;
  final bool showActiveColor;
  final List<Color> allowedColors;
  final ValueChanged<Color> onColorChanged;

  /// Called when the user finished picking a color: after tapping a color
  /// ([ImpaktfullUiColorPickerType.simple]) or when releasing the slider
  /// ([ImpaktfullUiColorPickerType.slider]). [onColorChanged] is called for
  /// every change while dragging the slider.
  final ValueChanged<Color>? onColorChangeEnd;
  final ImpaktfullUiColorPickerTheme? theme;

  const ImpaktfullUiColorPicker({
    required this.onColorChanged,
    this.onColorChangeEnd,
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
      ];

  /// The full hue circle, used by the [ImpaktfullUiColorPickerType.slider]
  /// without [allowedColors].
  static List<Color> get _defaultSliderColors => [
        for (var hue = 0; hue <= 360; hue += 60)
          HSVColor.fromAHSV(1, hue.toDouble(), 1, 1).toColor(),
      ];

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        switch (type) {
          case ImpaktfullUiColorPickerType.simple:
            return ImpaktfullUiColorPickerSimple(
              selectedColor: selectedColor,
              allowedColors:
                  allowedColors.isEmpty ? defaultColors : allowedColors,
              onColorChanged: (color) {
                onColorChanged(color);
                onColorChangeEnd?.call(color);
              },
              componentTheme: componentTheme,
              showActiveColor: showActiveColor,
            );
          case ImpaktfullUiColorPickerType.slider:
            return ImpaktfullUiColorPickerSlider(
              selectedColor: selectedColor,
              // The slider picks a color of the gradient, by default every hue.
              allowedColors:
                  allowedColors.isEmpty ? _defaultSliderColors : allowedColors,
              onColorChanged: onColorChanged,
              onColorChangeEnd: onColorChangeEnd,
              componentTheme: componentTheme,
              showActiveColor: showActiveColor,
            );
        }
      },
    );
  }
}
