import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/line_chart/line_chart_style.dart';
import 'package:impaktfull_ui/src/components/line_chart/model/line_chart_item_data.dart';
import 'package:impaktfull_ui/src/components/line_chart/model/line_chart_item_style.dart';
import 'package:impaktfull_ui/src/components/line_chart/model/line_chart_painter_data.dart';
import 'package:impaktfull_ui/src/components/line_chart/painter/line_chart_painter.dart';
import 'package:impaktfull_ui/src/util/accessibility/accessibility.localizations.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'line_chart_style.dart';
export 'model/line_chart_item_data.dart';
export 'model/line_chart_item_data_item.dart';
export 'model/line_chart_item_style.dart';

class ImpaktfullUiLineChart<T, E> extends StatefulWidget {
  final double? width;
  final double? height;
  final List<ImpaktfullUiLineChartItemData<T, E>> data;
  final ImpaktfullUiLineChartTheme? theme;

  /// What screen readers announce for the chart, e.g. `Revenue of the last 6
  /// months, rising from 10k to 25k`. A chart is only an image for screen
  /// readers: describe what it shows. Defaults to a summary with the amount
  /// of lines and points
  /// (`ImpaktfullUiAccessibilityLocalizations.lineChartSummary`).
  final String? semanticLabel;

  const ImpaktfullUiLineChart({
    required this.data,
    this.width,
    this.height,
    this.theme,
    this.semanticLabel,
    super.key,
  });

  @override
  State<ImpaktfullUiLineChart<T, E>> createState() =>
      _ImpaktfullUiLineChartState();
}

class _ImpaktfullUiLineChartState<T, E>
    extends State<ImpaktfullUiLineChart<T, E>> {
  late List<ImpaktfullUiLineChartPainterData> painterData;

  @override
  void initState() {
    super.initState();
    _setPainterData();
  }

  @override
  void didUpdateWidget(covariant ImpaktfullUiLineChart<T, E> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data != widget.data) {
      _setPainterData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => Semantics(
        container: true,
        image: true,
        label: widget.semanticLabel ??
            ImpaktfullUiAccessibilityLocalizations.of(context).lineChartSummary(
              widget.data.length,
              widget.data.fold(0, (sum, line) => sum + line.points.length),
            ),
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: ClipRect(
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
        ),
      ),
    );
  }

  void _setPainterData() {
    painterData = widget.data
        .map((e) => ImpaktfullUiLineChartPainterData(
              points: e.points
                  .map((point) => e.offsetBuilder(point.x, point.y))
                  .toList(),
              minX: e.minX,
              maxX: e.maxX,
              minY: e.minY,
              maxY: e.maxY,
              // Without a color the painter uses the line color of the theme.
              lineColor: e.style?.lineColor,
              strokeWidth: e.style?.strokeWidth,
              isCurved: e.style?.isCurved ?? false,
              gradientEnabled: e.style?.gradientEnabled ?? false,
              gradientColors: _getGradientColors(e.style),
              gradientStops: _getGradientStops(e.style),
            ))
        .toList();
  }

  /// Null spreads the gradient colors evenly, for any amount of colors.
  List<double>? _getGradientStops(ImpaktfullUiLineChartItemStyle? style) {
    if (style == null || !style.gradientEnabled) return null;
    return style.gradientStops;
  }

  List<Color>? _getGradientColors(ImpaktfullUiLineChartItemStyle? style) {
    if (style == null) return [];
    return style.gradientColors;
  }
}
