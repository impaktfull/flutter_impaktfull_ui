import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/line_chart/line_chart_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/component/components_library_variant_descriptor.dart';

class LineChartLibraryVariant
    extends ComponentLibraryVariant<LineChartLibraryPrimaryInputs> {
  const LineChartLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, LineChartLibraryPrimaryInputs inputs) {
    return [
      ComponentsLibraryVariantDescriptor(
        height: 500,
        child: ImpaktfullUiLineChart(
          data: [
            ImpaktfullUiLineChartItemData(
              style: ImpaktfullUiLineChartItemStyle(
                lineColor: theme.colors.text,
                gradientEnabled: true,
              ),
              offsetBuilder: (x, y) => Offset(x, y),
              points: [
                ImpaktfullUiLineChartItemDataItem(x: 0.0, y: 3.0),
                ImpaktfullUiLineChartItemDataItem(x: 0.5, y: 2.0),
                ImpaktfullUiLineChartItemDataItem(x: 1.0, y: 5.0),
                ImpaktfullUiLineChartItemDataItem(x: 1.5, y: 3.0),
                ImpaktfullUiLineChartItemDataItem(x: 2.0, y: 4.0),
                ImpaktfullUiLineChartItemDataItem(x: 2.5, y: 3.0),
                ImpaktfullUiLineChartItemDataItem(x: 3.0, y: 4.0),
              ],
            ),
            ImpaktfullUiLineChartItemData(
              style: ImpaktfullUiLineChartItemStyle(
                lineColor: theme.colors.accent,
                isCurved: true,
                gradientEnabled: true,
                gradientColors: [
                  theme.colors.accent.withOpacity(1),
                  theme.colors.accent.withOpacity(0.0),
                ],
              ),
              offsetBuilder: (x, y) => Offset(x, y),
              points: [
                ImpaktfullUiLineChartItemDataItem(x: 0.0, y: 0.0),
                ImpaktfullUiLineChartItemDataItem(x: 0.5, y: 1.0),
                ImpaktfullUiLineChartItemDataItem(x: 1.0, y: 0.5),
                ImpaktfullUiLineChartItemDataItem(x: 1.5, y: 2.0),
                ImpaktfullUiLineChartItemDataItem(x: 2.0, y: 1.5),
                ImpaktfullUiLineChartItemDataItem(x: 2.5, y: 2.5),
                ImpaktfullUiLineChartItemDataItem(x: 3.0, y: 2.5),
              ],
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
