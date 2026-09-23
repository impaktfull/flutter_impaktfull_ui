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

  ImpaktfullUiLineChartTheme copyWith({
    ImpaktfullUiLineChartAssetsTheme? assets,
    ImpaktfullUiLineChartColorTheme? colors,
    ImpaktfullUiLineChartDimensTheme? dimens,
    ImpaktfullUiLineChartTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiLineChartTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiLineChartTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiLineChartAssetsTheme {
  const ImpaktfullUiLineChartAssetsTheme();

  ImpaktfullUiLineChartAssetsTheme copyWith() =>
      const ImpaktfullUiLineChartAssetsTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiLineChartAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiLineChartColorTheme {
  final Color lineColor;
  final Color backgroundColor;

  const ImpaktfullUiLineChartColorTheme({
    required this.lineColor,
    required this.backgroundColor,
  });

  ImpaktfullUiLineChartColorTheme copyWith({
    Color? backgroundColor,
    Color? lineColor,
  }) =>
      ImpaktfullUiLineChartColorTheme(
        backgroundColor: backgroundColor ?? this.backgroundColor,
        lineColor: lineColor ?? this.lineColor,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiLineChartColorTheme &&
          lineColor == other.lineColor &&
          backgroundColor == other.backgroundColor;

  @override
  int get hashCode => Object.hash(lineColor, backgroundColor);
}

class ImpaktfullUiLineChartDimensTheme {
  final double strokeWidth;
  const ImpaktfullUiLineChartDimensTheme({
    required this.strokeWidth,
  });

  ImpaktfullUiLineChartDimensTheme copyWith({
    double? strokeWidth,
  }) =>
      ImpaktfullUiLineChartDimensTheme(
        strokeWidth: strokeWidth ?? this.strokeWidth,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiLineChartDimensTheme &&
          strokeWidth == other.strokeWidth;

  @override
  int get hashCode => strokeWidth.hashCode;
}

class ImpaktfullUiLineChartTextStyleTheme {
  const ImpaktfullUiLineChartTextStyleTheme();

  ImpaktfullUiLineChartTextStyleTheme copyWith() =>
      const ImpaktfullUiLineChartTextStyleTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiLineChartTextStyleTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}
