import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiTableTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiTableColorTheme colors;
  final ImpaktfullUiTableDimensTheme dimens;

  const ImpaktfullUiTableTheme({
    required this.colors,
    required this.dimens,
  });

  ImpaktfullUiTableTheme copyWith({
    ImpaktfullUiTableColorTheme? colors,
    ImpaktfullUiTableDimensTheme? dimens,
  }) =>
      ImpaktfullUiTableTheme(
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
      );

  static ImpaktfullUiTableTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.table;

  static ImpaktfullUiTableTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiTableTheme(
        colors: ImpaktfullUiTableColorTheme(
          background: colors.card,
          border: colors.border,
        ),
        dimens: ImpaktfullUiTableDimensTheme(
          borderRadius: dimens.borderRadius,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTableTheme &&
          colors == other.colors &&
          dimens == other.dimens;

  @override
  int get hashCode => Object.hash(colors, dimens);
}

class ImpaktfullUiTableColorTheme {
  final Color background;
  final Color? border;

  /// The color of the divider below the header and between two rows. When
  /// null, the divider uses the `ImpaktfullUiDividerTheme` of the theme.
  final Color? divider;

  const ImpaktfullUiTableColorTheme({
    required this.background,
    required this.border,
    this.divider,
  });

  ImpaktfullUiTableColorTheme copyWith({
    Color? background,
    Color? border,
    Color? divider,
  }) =>
      ImpaktfullUiTableColorTheme(
        background: background ?? this.background,
        border: border ?? this.border,
        divider: divider ?? this.divider,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTableColorTheme &&
          background == other.background &&
          border == other.border &&
          divider == other.divider;

  @override
  int get hashCode => Object.hash(background, border, divider);
}

class ImpaktfullUiTableDimensTheme {
  final BorderRadiusGeometry borderRadius;

  /// The thickness of the border around the table, when
  /// `ImpaktfullUiTableColorTheme.border` is set.
  final double borderWidth;

  /// The width a column gets at least before the table starts to scroll
  /// horizontally.
  final double minColumnWidth;

  const ImpaktfullUiTableDimensTheme({
    required this.borderRadius,
    this.borderWidth = 1,
    this.minColumnWidth = 250,
  });

  ImpaktfullUiTableDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    double? borderWidth,
    double? minColumnWidth,
  }) =>
      ImpaktfullUiTableDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        borderWidth: borderWidth ?? this.borderWidth,
        minColumnWidth: minColumnWidth ?? this.minColumnWidth,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTableDimensTheme &&
          borderRadius == other.borderRadius &&
          borderWidth == other.borderWidth &&
          minColumnWidth == other.minColumnWidth;

  @override
  int get hashCode => Object.hash(borderRadius, borderWidth, minColumnWidth);
}
