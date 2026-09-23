import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiDividerTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiDividerColorTheme colors;
  final ImpaktfullUiDividerDimensTheme dimens;

  const ImpaktfullUiDividerTheme({
    required this.colors,
    required this.dimens,
  });

  ImpaktfullUiDividerTheme copyWith({
    ImpaktfullUiDividerColorTheme? colors,
    ImpaktfullUiDividerDimensTheme? dimens,
  }) =>
      ImpaktfullUiDividerTheme(
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
      );

  static ImpaktfullUiDividerTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.divider;

  static ImpaktfullUiDividerTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiDividerTheme(
        colors: ImpaktfullUiDividerColorTheme(
          color: colors.border,
        ),
        dimens: const ImpaktfullUiDividerDimensTheme(
          margin: EdgeInsets.zero,
          thickness: 1,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiDividerTheme &&
          colors == other.colors &&
          dimens == other.dimens;

  @override
  int get hashCode => Object.hash(colors, dimens);
}

class ImpaktfullUiDividerColorTheme {
  final Color color;

  const ImpaktfullUiDividerColorTheme({
    required this.color,
  });

  ImpaktfullUiDividerColorTheme copyWith({
    Color? color,
  }) =>
      ImpaktfullUiDividerColorTheme(
        color: color ?? this.color,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiDividerColorTheme && color == other.color;

  @override
  int get hashCode => color.hashCode;
}

class ImpaktfullUiDividerDimensTheme {
  final EdgeInsetsGeometry margin;
  final double thickness;

  const ImpaktfullUiDividerDimensTheme({
    required this.margin,
    required this.thickness,
  });

  ImpaktfullUiDividerDimensTheme copyWith({
    EdgeInsetsGeometry? margin,
    double? thickness,
  }) =>
      ImpaktfullUiDividerDimensTheme(
        margin: margin ?? this.margin,
        thickness: thickness ?? this.thickness,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiDividerDimensTheme &&
          margin == other.margin &&
          thickness == other.thickness;

  @override
  int get hashCode => Object.hash(margin, thickness);
}
