import 'package:flutter/widgets.dart';

class ImpaktfullUiLineChartPainterData {
  final List<Offset> points;
  final double minX;
  final double maxX;
  final double minY;
  final double maxY;
  final List<Color>? gradientColors;
  final Color? lineColor;
  final double? strokeWidth;

  const ImpaktfullUiLineChartPainterData({
    required this.points,
    required this.minX,
    required this.maxX,
    required this.minY,
    required this.maxY,
    required this.gradientColors,
    required this.lineColor,
    required this.strokeWidth,
  });
}
