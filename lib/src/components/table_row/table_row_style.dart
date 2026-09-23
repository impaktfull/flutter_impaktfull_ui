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
  const ImpaktfullUiTableRowColorTheme();

  ImpaktfullUiTableRowColorTheme copyWith() =>
      const ImpaktfullUiTableRowColorTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiTableRowColorTheme;

  @override
  int get hashCode => runtimeType.hashCode;
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

  const ImpaktfullUiTableRowDimensTheme({
    this.minHeight = 48,
  });

  ImpaktfullUiTableRowDimensTheme copyWith({
    double? minHeight,
  }) =>
      ImpaktfullUiTableRowDimensTheme(
        minHeight: minHeight ?? this.minHeight,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTableRowDimensTheme && minHeight == other.minHeight;

  @override
  int get hashCode => minHeight.hashCode;
}
