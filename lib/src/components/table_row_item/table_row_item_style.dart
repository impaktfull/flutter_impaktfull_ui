import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiTableRowItemTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiTableRowItemColorTheme colors;
  final ImpaktfullUiTableRowItemTextStyleTheme textStyles;
  final ImpaktfullUiTableRowItemDimensTheme dimens;

  const ImpaktfullUiTableRowItemTheme({
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiTableRowItemTheme copyWith({
    ImpaktfullUiTableRowItemColorTheme? colors,
    ImpaktfullUiTableRowItemDimensTheme? dimens,
    ImpaktfullUiTableRowItemTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiTableRowItemTheme(
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiTableRowItemTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.tableRowItem;

  static ImpaktfullUiTableRowItemTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiTableRowItemTheme(
        colors: const ImpaktfullUiTableRowItemColorTheme(),
        dimens: const ImpaktfullUiTableRowItemDimensTheme(),
        textStyles: ImpaktfullUiTableRowItemTextStyleTheme(
          title: textStyles.onCanvas.text.small.medium,
          subtitle: textStyles.onCanvas.text.small,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTableRowItemTheme &&
          colors == other.colors &&
          textStyles == other.textStyles &&
          dimens == other.dimens;

  @override
  int get hashCode => Object.hash(colors, textStyles, dimens);
}

class ImpaktfullUiTableRowItemColorTheme {
  const ImpaktfullUiTableRowItemColorTheme();

  ImpaktfullUiTableRowItemColorTheme copyWith() =>
      const ImpaktfullUiTableRowItemColorTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiTableRowItemColorTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiTableRowItemTextStyleTheme {
  final TextStyle title;
  final TextStyle subtitle;

  const ImpaktfullUiTableRowItemTextStyleTheme({
    required this.title,
    required this.subtitle,
  });

  ImpaktfullUiTableRowItemTextStyleTheme copyWith({
    TextStyle? subtitle,
    TextStyle? title,
  }) =>
      ImpaktfullUiTableRowItemTextStyleTheme(
        subtitle: subtitle ?? this.subtitle,
        title: title ?? this.title,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTableRowItemTextStyleTheme &&
          title == other.title &&
          subtitle == other.subtitle;

  @override
  int get hashCode => Object.hash(title, subtitle);
}

class ImpaktfullUiTableRowItemDimensTheme {
  /// The minimum height of a row item.
  final double minHeight;

  /// The padding of a cell that is not built by a `builder`, when the cell
  /// itself has no `padding`.
  final EdgeInsetsGeometry padding;

  /// The padding of a `ImpaktfullUiTableRowItem.custom` cell without a
  /// `padding`: a custom cell only gets space at its end, so it can paint to
  /// the edge of the row.
  final EdgeInsetsGeometry customPadding;

  /// The space between the checkbox and the title of a cell.
  final double spacing;

  const ImpaktfullUiTableRowItemDimensTheme({
    this.minHeight = 48,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.customPadding = const EdgeInsetsDirectional.only(end: 8),
    this.spacing = 8,
  });

  ImpaktfullUiTableRowItemDimensTheme copyWith({
    EdgeInsetsGeometry? customPadding,
    double? minHeight,
    EdgeInsetsGeometry? padding,
    double? spacing,
  }) =>
      ImpaktfullUiTableRowItemDimensTheme(
        customPadding: customPadding ?? this.customPadding,
        minHeight: minHeight ?? this.minHeight,
        padding: padding ?? this.padding,
        spacing: spacing ?? this.spacing,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTableRowItemDimensTheme &&
          minHeight == other.minHeight &&
          padding == other.padding &&
          customPadding == other.customPadding &&
          spacing == other.spacing;

  @override
  int get hashCode => Object.hash(minHeight, padding, customPadding, spacing);
}
