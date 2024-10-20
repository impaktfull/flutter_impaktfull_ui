import 'dart:ui';

class ImpaktfullUiLineChartItemStyle {
  final Color? color;
  final bool hasGradient;
  final List<Color>? gradientColors;
  final List<double>? gradientStops;
  final double? strokeWidth;

  ImpaktfullUiLineChartItemStyle({
    this.color,
    this.hasGradient = false,
    this.gradientColors,
    this.gradientStops,
    this.strokeWidth,
  });
}
