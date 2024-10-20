import 'package:flutter/widgets.dart';
import 'dart:math' as math;
import 'package:impaktfull_ui_2/src/components/line_chart/model/line_chart_painter_data.dart';

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

    for (final lineChartData in data) {
      final points = lineChartData.points;
      paint.color = lineChartData.lineColor ?? defaultLineColor;
      paint.strokeWidth = lineChartData.strokeWidth ?? defaultStrokeWidth;
      if (points.isEmpty) continue;

      final path = Path();
      path.moveTo(
        _normalizeX(points.first.dx, adjustedSize.width) + offset.dx,
        _normalizeY(points.first.dy, adjustedSize.height) + offset.dy,
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
            _normalizeX(p0.dx, adjustedSize.width) + offset.dx,
            _normalizeY(p0.dy, adjustedSize.height) + offset.dy,
            _normalizeX(midPoint.dx, adjustedSize.width) + offset.dx,
            _normalizeY(midPoint.dy, adjustedSize.height) + offset.dy,
          );
        }
        path.quadraticBezierTo(
          _normalizeX(points[points.length - 1].dx, adjustedSize.width) +
              offset.dx,
          _normalizeY(points[points.length - 1].dy, adjustedSize.height) +
              offset.dy,
          _normalizeX(points[points.length - 1].dx, adjustedSize.width) +
              offset.dx,
          _normalizeY(points[points.length - 1].dy, adjustedSize.height) +
              offset.dy,
        );
      } else {
        for (int i = 1; i < points.length; i++) {
          path.lineTo(
            _normalizeX(points[i].dx, adjustedSize.width) + offset.dx,
            _normalizeY(points[i].dy, adjustedSize.height) + offset.dy,
          );
        }
      }

      // Draw gradient below the graph
      if (lineChartData.gradientEnabled) {
        final gradientColors = lineChartData.gradientColors ??
            [
              paint.color.withOpacity(0.33),
              paint.color.withOpacity(0),
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

  double _normalizeX(double x, double width) =>
      (x - _minX) / (_maxX - _minX) * width;
  double _normalizeY(double y, double height) =>
      height - (y - _minY) / (_maxY - _minY) * height;

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
