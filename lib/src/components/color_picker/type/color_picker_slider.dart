import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/color_picker/color_picker.dart';

class ImpaktfullUiColorPickerSlider extends StatefulWidget {
  final Color? selectedColor;
  final List<Color> allowedColors;
  final ValueChanged<Color> onColorChanged;
  final ValueChanged<Color>? onColorChangeEnd;
  final bool showActiveColor;
  final ImpaktfullUiColorPickerTheme componentTheme;

  const ImpaktfullUiColorPickerSlider({
    required this.selectedColor,
    required this.allowedColors,
    required this.onColorChanged,
    required this.showActiveColor,
    required this.componentTheme,
    this.onColorChangeEnd,
    super.key,
  });

  @override
  State<ImpaktfullUiColorPickerSlider> createState() =>
      _ImpaktfullUiColorPickerSliderState();
}

class _ImpaktfullUiColorPickerSliderState
    extends State<ImpaktfullUiColorPickerSlider> {
  Color? _lastColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Builder(
        builder: (context) => GestureDetector(
          onPanUpdate: (details) {
            final box = context.findRenderObject() as RenderBox;
            final localOffset = box.globalToLocal(details.globalPosition);
            final pickerHeight = box.size.height;
            final hue = (localOffset.dy / pickerHeight) * 360;
            if (hue < 0 || hue > 360) return;
            final selectedColor = HSVColor.fromAHSV(
              1.0,
              hue,
              1.0,
              1.0,
            ).toColor();
            _lastColor = selectedColor;
            widget.onColorChanged(selectedColor);
          },
          onPanEnd: (_) {
            final lastColor = _lastColor;
            _lastColor = null;
            if (lastColor == null) return;
            widget.onColorChangeEnd?.call(lastColor);
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: widget.allowedColors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
