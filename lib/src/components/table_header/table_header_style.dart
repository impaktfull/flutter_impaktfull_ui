import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/border_radius_geometry_extension.dart';

class ImpaktfullUiTableHeaderTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiTableHeaderColorTheme colors;
  final ImpaktfullUiTableHeaderDimensTheme dimens;

  const ImpaktfullUiTableHeaderTheme({
    required this.colors,
    required this.dimens,
  });

  ImpaktfullUiTableHeaderTheme copyWith({
    ImpaktfullUiTableHeaderColorTheme? colors,
    ImpaktfullUiTableHeaderDimensTheme? dimens,
  }) =>
      ImpaktfullUiTableHeaderTheme(
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
      );

  static ImpaktfullUiTableHeaderTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.tableHeader;

  static ImpaktfullUiTableHeaderTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiTableHeaderTheme(
        colors: ImpaktfullUiTableHeaderColorTheme(
          background: colors.canvas,
        ),
        dimens: ImpaktfullUiTableHeaderDimensTheme(
          borderRadius: dimens.borderRadius.copyWith(
            bottomStart: Radius.zero,
            bottomEnd: Radius.zero,
          ),
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTableHeaderTheme &&
          colors == other.colors &&
          dimens == other.dimens;

  @override
  int get hashCode => Object.hash(colors, dimens);
}

class ImpaktfullUiTableHeaderColorTheme {
  final Color background;

  const ImpaktfullUiTableHeaderColorTheme({
    required this.background,
  });

  ImpaktfullUiTableHeaderColorTheme copyWith({
    Color? background,
  }) =>
      ImpaktfullUiTableHeaderColorTheme(
        background: background ?? this.background,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTableHeaderColorTheme &&
          background == other.background;

  @override
  int get hashCode => background.hashCode;
}

class ImpaktfullUiTableHeaderDimensTheme {
  final BorderRadiusGeometry borderRadius;

  /// The minimum height of the header row.
  final double minHeight;

  const ImpaktfullUiTableHeaderDimensTheme({
    required this.borderRadius,
    this.minHeight = 48,
  });

  ImpaktfullUiTableHeaderDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    double? minHeight,
  }) =>
      ImpaktfullUiTableHeaderDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        minHeight: minHeight ?? this.minHeight,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTableHeaderDimensTheme &&
          borderRadius == other.borderRadius &&
          minHeight == other.minHeight;

  @override
  int get hashCode => Object.hash(borderRadius, minHeight);
}
