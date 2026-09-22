import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/color_picker/color_picker.dart';

class ImpaktfullUiColorPickerSlider extends StatefulWidget {
  final Color? selectedColor;
  final List<Color> allowedColors;
  final ValueChanged<Color> onChanged;
  final ValueChanged<Color>? onChangeEnd;
  final bool showActiveColor;
  final ImpaktfullUiColorPickerTheme componentTheme;

  const ImpaktfullUiColorPickerSlider({
    required this.selectedColor,
    required this.allowedColors,
    required this.onChanged,
    required this.showActiveColor,
    required this.componentTheme,
    this.onChangeEnd,
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
            if (pickerHeight <= 0) return;
            final fraction = localOffset.dy / pickerHeight;
            if (fraction < 0 || fraction > 1) return;
            final selectedColor = _getColorAt(fraction);
            if (selectedColor == null) return;
            _lastColor = selectedColor;
            widget.onChanged(selectedColor);
          },
          onPanEnd: (_) {
            final lastColor = _lastColor;
            _lastColor = null;
            if (lastColor == null) return;
            widget.onChangeEnd?.call(lastColor);
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

  /// The color of the gradient of [ImpaktfullUiColorPickerSlider.allowedColors]
  /// at [fraction] (0 is the top, 1 is the bottom).
  Color? _getColorAt(double fraction) {
    final colors = widget.allowedColors;
    if (colors.isEmpty) return null;
    if (colors.length == 1) return colors.first;
    final position = fraction * (colors.length - 1);
    final index = position.floor().clamp(0, colors.length - 2);
    return Color.lerp(colors[index], colors[index + 1], position - index);
  }
}
