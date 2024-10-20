import 'dart:ui';
import 'dart:math' as math;

import 'package:impaktfull_ui_2/src/components/line_chart/model/line_chart_item_data_item.dart';
import 'package:impaktfull_ui_2/src/components/line_chart/model/line_chart_item_style.dart';

class ImpaktfullUiLineChartItemData<T, E> {
  final List<ImpaktfullUiLineChartItemDataItem<T, E>> points;
  final Offset Function(T, E) offsetBuilder;
  final double? _minX;
  final double? _maxX;
  final double? _minY;
  final double? _maxY;
  final ImpaktfullUiLineChartItemStyle? style;

  double get minX =>
      _minX ??
      points.fold(0, (min, point) {
        final dx = offsetBuilder(point.x, point.y).dx;
        return math.min(min, dx);
      });
  double get maxX =>
      _maxX ??
      points.fold(0, (max, point) {
        final dx = offsetBuilder(point.x, point.y).dx;
        return math.max(max, dx);
      });
  double get minY =>
      _minY ??
      points.fold(0, (min, point) {
        final dy = offsetBuilder(point.x, point.y).dy;
        return math.min(min, dy);
      });
  double get maxY =>
      _maxY ??
      points.fold(0, (max, point) {
        final dy = offsetBuilder(point.x, point.y).dy;
        return math.max(max, dy);
      });

  ImpaktfullUiLineChartItemData({
    required this.points,
    required this.offsetBuilder,
    this.style,
    double? minX,
    double? maxX,
    double? minY,
    double? maxY,
  })  : _minX = minX,
        _maxX = maxX,
        _minY = minY,
        _maxY = maxY;
}
