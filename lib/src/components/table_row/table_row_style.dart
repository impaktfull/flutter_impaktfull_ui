import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiTableRowTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiTableRowColorTheme colors;
  final ImpaktfullUiTableRowTextStyleTheme textStyles;
  final ImpaktfullUiTableRowDimensTheme dimens;

  const ImpaktfullUiTableRowTheme({
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiTableRowTheme copyWith({
    ImpaktfullUiTableRowColorTheme? colors,
    ImpaktfullUiTableRowDimensTheme? dimens,
    ImpaktfullUiTableRowTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiTableRowTheme(
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiTableRowTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.tableRow;

  static ImpaktfullUiTableRowTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      const ImpaktfullUiTableRowTheme(
        colors: ImpaktfullUiTableRowColorTheme(),
        dimens: ImpaktfullUiTableRowDimensTheme(),
        textStyles: ImpaktfullUiTableRowTextStyleTheme(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTableRowTheme &&
          colors == other.colors &&
          textStyles == other.textStyles &&
          dimens == other.dimens;

  @override
  int get hashCode => Object.hash(colors, textStyles, dimens);
}

class ImpaktfullUiTableRowColorTheme {
  /// The background of a row. When null, the row is transparent and the
  /// background of the table shows through, like before this token existed.
  final Color? background;

  /// The background of every second row of a table (the rows with an odd
  /// index). When null, every row uses [background]. A row outside of a
  /// table never uses it: it has no index.
  final Color? backgroundAlternate;

  /// The background of a row while a pointer hovers over it. When null, the
  /// row keeps its background and only the overlay of the touch feedback is
  /// shown.
  final Color? backgroundHover;

  /// The background of a row with `isSelected` set. When null, a selected row
  /// keeps its background.
  final Color? backgroundSelected;

  /// The color of the border below a row. When null, the row draws no border:
  /// an `ImpaktfullUiTable` puts an `ImpaktfullUiDivider` between its rows.
  final Color? border;

  const ImpaktfullUiTableRowColorTheme({
    this.background,
    this.backgroundAlternate,
    this.backgroundHover,
    this.backgroundSelected,
    this.border,
  });

  ImpaktfullUiTableRowColorTheme copyWith({
    Color? background,
    Color? backgroundAlternate,
    Color? backgroundHover,
    Color? backgroundSelected,
    Color? border,
  }) =>
      ImpaktfullUiTableRowColorTheme(
        background: background ?? this.background,
        backgroundAlternate: backgroundAlternate ?? this.backgroundAlternate,
        backgroundHover: backgroundHover ?? this.backgroundHover,
        backgroundSelected: backgroundSelected ?? this.backgroundSelected,
        border: border ?? this.border,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTableRowColorTheme &&
          background == other.background &&
          backgroundAlternate == other.backgroundAlternate &&
          backgroundHover == other.backgroundHover &&
          backgroundSelected == other.backgroundSelected &&
          border == other.border;

  @override
  int get hashCode => Object.hash(
        background,
        backgroundAlternate,
        backgroundHover,
        backgroundSelected,
        border,
      );
}

class ImpaktfullUiTableRowTextStyleTheme {
  const ImpaktfullUiTableRowTextStyleTheme();

  ImpaktfullUiTableRowTextStyleTheme copyWith() =>
      const ImpaktfullUiTableRowTextStyleTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiTableRowTextStyleTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiTableRowDimensTheme {
  /// The minimum height of a row.
  final double minHeight;

  /// The thickness of the border below a row, when
  /// `ImpaktfullUiTableRowColorTheme.border` is set.
  final double borderWidth;

  const ImpaktfullUiTableRowDimensTheme({
    this.minHeight = 48,
    this.borderWidth = 1,
  });

  ImpaktfullUiTableRowDimensTheme copyWith({
    double? borderWidth,
    double? minHeight,
  }) =>
      ImpaktfullUiTableRowDimensTheme(
        borderWidth: borderWidth ?? this.borderWidth,
        minHeight: minHeight ?? this.minHeight,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTableRowDimensTheme &&
          minHeight == other.minHeight &&
          borderWidth == other.borderWidth;

  @override
  int get hashCode => Object.hash(minHeight, borderWidth);
}
