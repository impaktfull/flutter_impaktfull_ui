import 'dart:ui';

class ImpaktfullUiLineChartItemStyle {
  final Color? lineColor;
  final double? strokeWidth;
  final bool isCurved;
  final bool gradientEnabled;
  final List<Color>? gradientColors;
  final List<double>? gradientStops;

  ImpaktfullUiLineChartItemStyle({
    this.lineColor,
    this.isCurved = false,
    this.strokeWidth,
    this.gradientEnabled = false,
    this.gradientColors,
    this.gradientStops,
  });
}
