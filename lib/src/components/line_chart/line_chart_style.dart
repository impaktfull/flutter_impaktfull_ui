import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

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

  static ImpaktfullUiLineChartTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiLineChartTheme(
        assets: const ImpaktfullUiLineChartAssetsTheme(),
        colors: ImpaktfullUiLineChartColorTheme(
          lineColor: colors.accent,
          backgroundColor: Colors.transparent,
        ),
        dimens: const ImpaktfullUiLineChartDimensTheme(
          strokeWidth: 2,
        ),
        textStyles: const ImpaktfullUiLineChartTextStyleTheme(),
      );
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
