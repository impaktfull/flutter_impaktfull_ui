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
  final ValueChanged<Color> onChanged;

  /// Called when the user finished picking a color: after tapping a color
  /// ([ImpaktfullUiColorPickerType.simple]) or when releasing the slider
  /// ([ImpaktfullUiColorPickerType.slider]). [onChanged] is called for
  /// every change while dragging the slider.
  final ValueChanged<Color>? onChangeEnd;
  final ImpaktfullUiColorPickerTheme? theme;

  const ImpaktfullUiColorPicker({
    // `onChanged` becomes `required` again in 1.0.0, when `onColorChanged` is
    // removed.
    ValueChanged<Color>? onChanged,
    @Deprecated('Use onChanged instead. Will be removed in 1.0.0.')
    ValueChanged<Color>? onColorChanged,
    ValueChanged<Color>? onChangeEnd,
    @Deprecated('Use onChangeEnd instead. Will be removed in 1.0.0.')
    ValueChanged<Color>? onColorChangeEnd,
    required this.selectedColor,
    this.showActiveColor = false,
    this.allowedColors = const [],
    this.type = ImpaktfullUiColorPickerType.simple,
    this.theme,
    super.key,
  })  : assert(onChanged != null || onColorChanged != null,
            'onChanged is required'),
        onChanged = (onChanged ?? onColorChanged) as ValueChanged<Color>,
        onChangeEnd = onChangeEnd ?? onColorChangeEnd;

  @Deprecated('Use onChanged instead. Will be removed in 1.0.0.')
  ValueChanged<Color> get onColorChanged => onChanged;

  @Deprecated('Use onChangeEnd instead. Will be removed in 1.0.0.')
  ValueChanged<Color>? get onColorChangeEnd => onChangeEnd;

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
              onChanged: (color) {
                onChanged(color);
                onChangeEnd?.call(color);
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
              onChanged: onChanged,
              onChangeEnd: onChangeEnd,
              componentTheme: componentTheme,
              showActiveColor: showActiveColor,
            );
        }
      },
    );
  }
}
