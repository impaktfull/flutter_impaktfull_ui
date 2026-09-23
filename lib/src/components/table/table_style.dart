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
}

class ImpaktfullUiTableColorTheme {
  final Color background;
  final Color? border;

  const ImpaktfullUiTableColorTheme({
    required this.background,
    required this.border,
  });

  ImpaktfullUiTableColorTheme copyWith({
    Color? background,
    Color? border,
  }) =>
      ImpaktfullUiTableColorTheme(
        background: background ?? this.background,
        border: border ?? this.border,
      );
}

class ImpaktfullUiTableDimensTheme {
  final BorderRadiusGeometry borderRadius;

  /// The width a column gets at least before the table starts to scroll
  /// horizontally.
  final double minColumnWidth;

  const ImpaktfullUiTableDimensTheme({
    required this.borderRadius,
    this.minColumnWidth = 250,
  });

  ImpaktfullUiTableDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    double? minColumnWidth,
  }) =>
      ImpaktfullUiTableDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        minColumnWidth: minColumnWidth ?? this.minColumnWidth,
      );
}
