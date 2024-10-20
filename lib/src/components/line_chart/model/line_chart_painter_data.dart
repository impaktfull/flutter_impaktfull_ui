import 'package:flutter/widgets.dart';

class ImpaktfullUiLineChartPainterData {
  final List<Offset> points;
  final double minX;
  final double maxX;
  final double minY;
  final double maxY;
  final Color? lineColor;
  final double? strokeWidth;
  final bool isCurved;
  final bool gradientEnabled;
  final List<Color>? gradientColors;
  final List<double> gradientStops;

  const ImpaktfullUiLineChartPainterData({
    required this.points,
    required this.minX,
    required this.maxX,
    required this.minY,
    required this.maxY,
    required this.lineColor,
    required this.strokeWidth,
    required this.isCurved,
    required this.gradientEnabled,
    required this.gradientColors,
    required this.gradientStops,
  });
}
