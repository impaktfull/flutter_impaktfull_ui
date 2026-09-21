import 'package:flutter/widgets.dart';
import 'dart:math' as math;
import 'package:impaktfull_ui/src/components/line_chart/model/line_chart_painter_data.dart';
import 'package:impaktfull_ui/src/util/extension/color_extensions.dart';

class ImpaktfullUiLineChartPainter extends CustomPainter {
  final List<ImpaktfullUiLineChartPainterData> data;
  final Color backgroundColor;
  final Color defaultLineColor;
  final double defaultStrokeWidth;

  ImpaktfullUiLineChartPainter({
    required this.data,
    required this.backgroundColor,
    required this.defaultLineColor,
    required this.defaultStrokeWidth,
  });

  // The axis always includes 0, unless the data sets its own min and max.
  double get _minX =>
      data.fold(0, (min, lineChartData) => math.min(min, lineChartData.minX));
  double get _maxX =>
      data.fold(0, (max, lineChartData) => math.max(max, lineChartData.maxX));
  double get _minY =>
      data.fold(0, (min, lineChartData) => math.min(min, lineChartData.minY));
  double get _maxY =>
      data.fold(0, (max, lineChartData) => math.max(max, lineChartData.maxY));

  double get _maxStrokeWidth => data.fold(
      0,
      (max, lineChartData) =>
          math.max(max, lineChartData.strokeWidth ?? defaultStrokeWidth));

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawRect(
      Offset.zero & size,
      Paint()..color = backgroundColor,
    );

    final adjustedSize = Size(
      size.width - _maxStrokeWidth,
      size.height - _maxStrokeWidth,
    );
    final offset = Offset(_maxStrokeWidth / 2, _maxStrokeWidth / 2);
    // Calculated once per paint instead of once per point.
    final bounds = _ImpaktfullUiLineChartBounds(
      minX: _minX,
      maxX: _maxX,
      minY: _minY,
      maxY: _maxY,
    );
    double normalizeX(double x) => bounds.normalizeX(x, adjustedSize.width);
    double normalizeY(double y) => bounds.normalizeY(y, adjustedSize.height);

    for (final lineChartData in data) {
      final points = lineChartData.points;
      paint.color = lineChartData.lineColor ?? defaultLineColor;
      paint.strokeWidth = lineChartData.strokeWidth ?? defaultStrokeWidth;
      if (points.isEmpty) continue;

      final path = Path();
      path.moveTo(
        normalizeX(points.first.dx) + offset.dx,
        normalizeY(points.first.dy) + offset.dy,
      );

      if (lineChartData.isCurved) {
        for (int i = 0; i < points.length - 1; i++) {
          final p0 = points[i];
          final p1 = points[i + 1];
          final midPoint = Offset(
            (p0.dx + p1.dx) / 2,
            (p0.dy + p1.dy) / 2,
          );
          path.quadraticBezierTo(
            normalizeX(p0.dx) + offset.dx,
            normalizeY(p0.dy) + offset.dy,
            normalizeX(midPoint.dx) + offset.dx,
            normalizeY(midPoint.dy) + offset.dy,
          );
        }
        path.quadraticBezierTo(
          normalizeX(points[points.length - 1].dx) + offset.dx,
          normalizeY(points[points.length - 1].dy) + offset.dy,
          normalizeX(points[points.length - 1].dx) + offset.dx,
          normalizeY(points[points.length - 1].dy) + offset.dy,
        );
      } else {
        for (int i = 1; i < points.length; i++) {
          path.lineTo(
            normalizeX(points[i].dx) + offset.dx,
            normalizeY(points[i].dy) + offset.dy,
          );
        }
      }

      // Draw gradient below the graph
      if (lineChartData.gradientEnabled) {
        final gradientColors = lineChartData.gradientColors ??
            [
              paint.color.withOpacityPercentage(0.33),
              paint.color.withOpacityPercentage(0),
            ];
        final gradientPath = Path.from(path);
        gradientPath.lineTo(size.width, size.height);
        gradientPath.lineTo(0, size.height);
        gradientPath.close();

        final gradientPaint = Paint()
          ..shader = LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: gradientColors,
            stops: lineChartData.gradientStops,
          ).createShader(Offset.zero & size);

        canvas.drawPath(gradientPath, gradientPaint);
      }

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant ImpaktfullUiLineChartPainter oldDelegate) =>
      oldDelegate.data != data ||
      oldDelegate.backgroundColor != backgroundColor ||
      oldDelegate.defaultLineColor != defaultLineColor ||
      oldDelegate.defaultStrokeWidth != defaultStrokeWidth;
}

class _ImpaktfullUiLineChartBounds {
  final double minX;
  final double maxX;
  final double minY;
  final double maxY;

  const _ImpaktfullUiLineChartBounds({
    required this.minX,
    required this.maxX,
    required this.minY,
    required this.maxY,
  });

  /// When every value is the same, there is no range to scale to: the line is
  /// drawn in the middle instead of dividing by zero.
  double normalizeX(double x, double width) {
    final range = maxX - minX;
    if (range == 0) return width / 2;
    return (x - minX) / range * width;
  }

  double normalizeY(double y, double height) {
    final range = maxY - minY;
    if (range == 0) return height / 2;
    return height - (y - minY) / range * height;
  }
}
