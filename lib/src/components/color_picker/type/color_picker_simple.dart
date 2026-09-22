import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/color_picker/color_picker.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/util/extension/color_extensions.dart';

class ImpaktfullUiColorPickerSimple extends StatelessWidget {
  final Color? selectedColor;
  final List<Color> allowedColors;
  final ValueChanged<Color>? onChanged;
  final bool showActiveColor;
  final ImpaktfullUiColorPickerTheme componentTheme;

  const ImpaktfullUiColorPickerSimple({
    required this.selectedColor,
    required this.allowedColors,
    required this.onChanged,
    required this.showActiveColor,
    required this.componentTheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiAutoLayout.vertical(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (allowedColors.isNotEmpty) ...[
          ImpaktfullUiAutoLayout.horizontal(
            wrap: true,
            spacing: 8,
            children: [
              for (final allowedColor in allowedColors) ...[
                ImpaktfullUiTouchFeedback(
                  color: allowedColor,
                  borderRadius:
                      componentTheme.dimens.simpleColorPickerItemBorderRadius,
                  onTap: () => onChanged?.call(allowedColor),
                  tooltip: allowedColor.toHexString(
                    includeAlpha: allowedColor.a < 1,
                  ),
                  child: SizedBox(
                    width: componentTheme.dimens.simpleColorPickerItemSize,
                    height: componentTheme.dimens.simpleColorPickerItemSize,
                  ),
                ),
              ],
            ],
          ),
        ],
        if (showActiveColor && selectedColor != null) ...[
          const SizedBox(height: 32),
          Container(
            width: componentTheme.dimens.simpleColorPickerItemSize,
            height: componentTheme.dimens.simpleColorPickerItemSize,
            decoration: BoxDecoration(
              color: selectedColor!,
              borderRadius:
                  componentTheme.dimens.simpleColorPickerItemBorderRadius,
            ),
          ),
        ],
      ],
    );
  }
}
