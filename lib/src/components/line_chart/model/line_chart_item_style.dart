import 'dart:ui';

class ImpaktfullUiLineChartItemStyle {
  final Color? color;
  final bool gradientEnabled;
  final List<Color>? gradientColors;
  final List<double>? gradientStops;
  final double? strokeWidth;

  ImpaktfullUiLineChartItemStyle({
    this.color,
    this.gradientEnabled = false,
    this.gradientColors,
    this.gradientStops,
    this.strokeWidth,
  });
}
