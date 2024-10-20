import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/line_chart/line_chart_style.dart';
import 'package:impaktfull_ui_2/src/components/line_chart/model/line_chart_item_data.dart';
import 'package:impaktfull_ui_2/src/components/line_chart/model/line_chart_item_style.dart';
import 'package:impaktfull_ui_2/src/components/line_chart/model/line_chart_painter_data.dart';
import 'package:impaktfull_ui_2/src/components/line_chart/painter/line_chart_painter.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'line_chart_style.dart';
export 'model/line_chart_item_data.dart';
export 'model/line_chart_item_data_item.dart';
export 'model/line_chart_item_style.dart';

part 'line_chart.describe.dart';

class ImpaktfullUiLineChart extends StatefulWidget with ComponentDescriptorMixin {
  final List<ImpaktfullUiLineChartItemData> data;
  final ImpaktfullUiLineChartTheme? theme;

  const ImpaktfullUiLineChart({
    required this.data,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiLineChart> createState() => _ImpaktfullUiLineChartState();

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUiLineChartState extends State<ImpaktfullUiLineChart> {
  late List<ImpaktfullUiLineChartPainterData> painterData;

  @override
  void initState() {
    super.initState();
    _setPainterData();
  }

  @override
  void didUpdateWidget(covariant ImpaktfullUiLineChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data != widget.data) {
      _setPainterData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiLineChartTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => ClipRect(
        child: CustomPaint(
          size: Size.infinite,
          painter: ImpaktfullUiLineChartPainter(
            data: painterData,
            defaultStrokeWidth: componentTheme.dimens.strokeWidth,
            defaultLineColor: componentTheme.colors.lineColor,
            backgroundColor: componentTheme.colors.backgroundColor,
          ),
        ),
      ),
    );
  }

  void _setPainterData() {
    painterData = widget.data
        .map((e) => ImpaktfullUiLineChartPainterData(
              points: e.points.map((point) => e.offsetBuilder(point.x, point.y)).toList(),
              minX: e.minX,
              maxX: e.maxX,
              minY: e.minY,
              maxY: e.maxY,
              hasGradient: e.style?.hasGradient ?? false,
              gradientColors: _getGradientColors(e.style),
              gradientStops: _getGradientStops(e.style),
              lineColor: e.style?.color ?? widget.theme?.colors.lineColor,
              strokeWidth: e.style?.strokeWidth,
            ))
        .toList();
  }

  List<double> _getGradientStops(ImpaktfullUiLineChartItemStyle? style) {
    final defaultStops = <double>[0, 1];
    if (style == null) return defaultStops;
    if (style.hasGradient) return style.gradientStops ?? defaultStops;
    return defaultStops;
  }

  List<Color>? _getGradientColors(ImpaktfullUiLineChartItemStyle? style) {
    if (style == null) return [];
    return style.gradientColors;
  }
}
