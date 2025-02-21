import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/util/extensions/color_extensions.dart';

class ColorStyleCard extends StatelessWidget {
  final Color color;
  final String label;

  const ColorStyleCard({
    required this.color,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final hexColor = color.getHexColor();
    return ImpaktfullUiCard(
      padding: EdgeInsets.zero,
      onTap: () {
        Clipboard.setData(ClipboardData(text: hexColor));
        ImpaktfullUiNotification.show(title: '$hexColor copied to clipboard');
      },
      child: GestureDetector(
        onDoubleTap: () {
          final colorWithoutOpacity = color.getHexColorWithoutAlpha();
          Clipboard.setData(ClipboardData(text: colorWithoutOpacity));
          ImpaktfullUiNotification.show(
              title: '$colorWithoutOpacity copied to clipboard');
        },
        child: ImpaktfullUiAutoLayout.vertical(
          children: [
            Expanded(
              child: Container(
                color: color,
              ),
            ),
            const ImpaktfullUiDivider(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ImpaktfullUiAutoLayout.vertical(
                spacing: 8,
                children: [
                  Text(
                    label,
                    style: theme.textStyles.onCanvas.text.medium,
                  ),
                  ImpaktfullUiAutoLayout.vertical(
                    spacing: 4,
                    children: [
                      Text(
                        'HEX: $hexColor',
                        style: theme.textStyles.onCanvasTertiary.text.small,
                      ),
                      Text(
                        'HSL: ${HSLColor.fromColor(color).hue.toStringAsFixed(0)}°, ${(HSLColor.fromColor(color).saturation * 100).toStringAsFixed(0)}%, ${(HSLColor.fromColor(color).lightness * 100).toStringAsFixed(0)}%, ${(color.a * 100).toStringAsFixed(0)}%',
                        style: theme.textStyles.onCanvasTertiary.text.small,
                      ),
                      Text(
                        'RGB: ${color.r}, ${color.g}, ${color.b}, ${(color.a * 100).toStringAsFixed(0)}%',
                        style: theme.textStyles.onCanvasTertiary.text.small,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
