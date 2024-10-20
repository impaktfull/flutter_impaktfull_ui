import 'package:flutter/widgets.dart';

class TextSizeUtil {
  const TextSizeUtil._();
  static double getTextWidth({
    required BuildContext context,
    required String text,
    required TextStyle style,
    int maxLines = 1,
  }) {
    final direction = Directionality.of(context);
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: direction,
      maxLines: maxLines,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: double.infinity,
    );
    return textPainter.size.width;
  }
}
