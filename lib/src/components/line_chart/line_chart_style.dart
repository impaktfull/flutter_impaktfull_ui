import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiLineChartTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiLineChartAssetsTheme assets;
  final ImpaktfullUiLineChartColorTheme colors;
  final ImpaktfullUiLineChartDimensTheme dimens;
  final ImpaktfullUiLineChartTextStyleTheme textStyles;

  const ImpaktfullUiLineChartTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiLineChartTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.lineChart;
}

class ImpaktfullUiLineChartAssetsTheme {
  const ImpaktfullUiLineChartAssetsTheme();
}

class ImpaktfullUiLineChartColorTheme {
  final Color lineColor;
  final Color backgroundColor;

  const ImpaktfullUiLineChartColorTheme({
    required this.lineColor,
    required this.backgroundColor,
  });
}

class ImpaktfullUiLineChartDimensTheme {
  final double strokeWidth;
  const ImpaktfullUiLineChartDimensTheme({
    required this.strokeWidth,
  });
}

class ImpaktfullUiLineChartTextStyleTheme {
  const ImpaktfullUiLineChartTextStyleTheme();
}
