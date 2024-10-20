import 'dart:math';

import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/line_chart/line_chart_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/components/components_library_variant_descriptor.dart';

class LineChartLibraryVariant extends ComponentLibraryVariant<LineChartLibraryPrimaryInputs> {
  const LineChartLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, LineChartLibraryPrimaryInputs inputs) {
    return [
      ComponentsLibraryVariantDescriptor(
        height: 500,
        child: ImpaktfullUiLineChart(
          data: [
            ImpaktfullUiLineChartItemData(
              style: ImpaktfullUiLineChartItemStyle(
                color: theme.colors.accent,
                gradientEnabled: true,
                gradientColors: [
                  theme.colors.accent.withOpacity(1),
                  theme.colors.accent.withOpacity(0.0),
                ],
              ),
              offsetBuilder: (x, y) => Offset(x, y),
              points: List.generate(100, (index) {
                final x = index / 99 * 6;
                final y = 2 + (sin(x * pi / 2) + cos(x * pi / 4)) / 2;
                return ImpaktfullUiLineChartItemDataItem(
                  x: x,
                  y: y,
                );
              }),
            ),
            ImpaktfullUiLineChartItemData(
              style: ImpaktfullUiLineChartItemStyle(
                color: theme.colors.text,
                gradientEnabled: true,
              ),
              offsetBuilder: (x, y) => Offset(x, y),
              points: List.generate(100, (index) {
                final x = index / 99 * 6;
                final y = 1.5 + (1.5 * sin(x * pi / 3));
                return ImpaktfullUiLineChartItemDataItem(
                  x: x,
                  y: y,
                );
              }),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  LineChartLibraryPrimaryInputs inputs() => LineChartLibraryPrimaryInputs();
}

class LineChartLibraryPrimaryInputs extends LineChartLibraryInputs {}
