import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_data_display_golden_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  // Revenue per month.
  const revenue = <double>[12.0, 18, 15, 22, 30, 26, 34, 41, 38, 45, 50, 48];
  const costs = <double>[10.0, 12, 14, 13, 18, 20, 21, 25, 24, 28, 30, 29];

  ImpaktfullUiLineChartItemData<int, double> data(
    List<double> values, {
    ImpaktfullUiLineChartItemStyle? style,
    double? minY,
    double? maxY,
  }) =>
      ImpaktfullUiLineChartItemData<int, double>(
        points: [
          for (final (index, value) in values.indexed)
            ImpaktfullUiLineChartItemDataItem(x: index, y: value),
        ],
        offsetBuilder: (x, y) => Offset(x.toDouble(), y),
        style: style,
        minY: minY,
        maxY: maxY,
      );

  Widget chart(List<ImpaktfullUiLineChartItemData<int, double>> data) =>
      goldenBox(
        child: ImpaktfullUiLineChart<int, double>(
          width: 300,
          height: 150,
          data: data,
        ),
      );

  runComponentTest(
    fileName: 'impaktfull_ui_line_chart',
    columns: 2,
    goldenTests: () => [
      GoldenTest(
        description: 'single line',
        child: chart([data(revenue)]),
      ),
      GoldenTest(
        description: 'curved',
        child: chart([
          data(revenue, style: ImpaktfullUiLineChartItemStyle(isCurved: true)),
        ]),
      ),
      GoldenTest(
        description: 'gradient',
        child: chart([
          data(
            revenue,
            style: ImpaktfullUiLineChartItemStyle(
              isCurved: true,
              gradientEnabled: true,
              lineColor: Colors.purple,
              gradientColors: [
                Colors.purple.withValues(alpha: 0.5),
                Colors.purple.withValues(alpha: 0),
              ],
            ),
          ),
        ]),
      ),
      GoldenTest(
        description: 'multiple lines with a stroke width and color',
        child: chart([
          data(
            revenue,
            style: ImpaktfullUiLineChartItemStyle(
              lineColor: Colors.green,
              strokeWidth: 4,
            ),
          ),
          data(
            costs,
            style: ImpaktfullUiLineChartItemStyle(lineColor: Colors.red),
          ),
        ]),
      ),
      GoldenTest(
        description: 'negative values',
        child: chart([
          data(const <double>[-10, 5, -3, 12, -8, 4]),
        ]),
      ),
      GoldenTest(
        description: 'explicit min and max',
        child: chart([
          data(revenue, minY: 0, maxY: 100),
        ]),
      ),
      GoldenTest(
        description: 'flat line',
        child: chart([
          data(const <double>[5, 5, 5, 5]),
        ]),
      ),
      GoldenTest(
        description: 'empty',
        child: chart([
          data(const <double>[]),
        ]),
      ),
    ],
  );
}
