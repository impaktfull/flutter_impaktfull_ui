import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiTableHeaderItemTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiTableHeaderItemColorTheme colors;
  final ImpaktfullUiTableHeaderItemTextStyleTheme textStyles;
  final ImpaktfullUiTableHeaderItemDimensTheme dimens;

  const ImpaktfullUiTableHeaderItemTheme({
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiTableHeaderItemTheme copyWith({
    ImpaktfullUiTableHeaderItemColorTheme? colors,
    ImpaktfullUiTableHeaderItemDimensTheme? dimens,
    ImpaktfullUiTableHeaderItemTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiTableHeaderItemTheme(
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiTableHeaderItemTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.tableHeaderItem;

  static ImpaktfullUiTableHeaderItemTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiTableHeaderItemTheme(
        colors: const ImpaktfullUiTableHeaderItemColorTheme(),
        dimens: const ImpaktfullUiTableHeaderItemDimensTheme(),
        textStyles: ImpaktfullUiTableHeaderItemTextStyleTheme(
          title: textStyles.onCanvas.text.extraSmall.medium,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTableHeaderItemTheme &&
          colors == other.colors &&
          textStyles == other.textStyles &&
          dimens == other.dimens;

  @override
  int get hashCode => Object.hash(colors, textStyles, dimens);
}

class ImpaktfullUiTableHeaderItemColorTheme {
  /// The color of the caret that shows the sort direction. When null, the
  /// color of the `IconTheme` around the table is used, like before this
  /// token existed.
  final Color? sortIcon;

  const ImpaktfullUiTableHeaderItemColorTheme({
    this.sortIcon,
  });

  ImpaktfullUiTableHeaderItemColorTheme copyWith({
    Color? sortIcon,
  }) =>
      ImpaktfullUiTableHeaderItemColorTheme(
        sortIcon: sortIcon ?? this.sortIcon,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTableHeaderItemColorTheme &&
          sortIcon == other.sortIcon;

  @override
  int get hashCode => sortIcon.hashCode;
}

class ImpaktfullUiTableHeaderItemTextStyleTheme {
  final TextStyle title;

  const ImpaktfullUiTableHeaderItemTextStyleTheme({
    required this.title,
  });

  ImpaktfullUiTableHeaderItemTextStyleTheme copyWith({
    TextStyle? title,
  }) =>
      ImpaktfullUiTableHeaderItemTextStyleTheme(
        title: title ?? this.title,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTableHeaderItemTextStyleTheme &&
          title == other.title;

  @override
  int get hashCode => title.hashCode;
}

class ImpaktfullUiTableHeaderItemDimensTheme {
  /// The minimum height of a header item.
  final double minHeight;

  /// The padding of a header cell, when the cell itself has no `padding`.
  final EdgeInsetsGeometry padding;

  /// The size of the caret that shows the sort direction.
  final double sortIconSize;

  /// The space between the title and the caret that shows the sort direction.
  final double sortIconSpacing;

  /// The space between the checkbox and the title of a header cell.
  final double spacing;

  const ImpaktfullUiTableHeaderItemDimensTheme({
    this.minHeight = 48,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.sortIconSize = 16,
    this.sortIconSpacing = 8,
    this.spacing = 8,
  });

  ImpaktfullUiTableHeaderItemDimensTheme copyWith({
    double? minHeight,
    EdgeInsetsGeometry? padding,
    double? sortIconSize,
    double? sortIconSpacing,
    double? spacing,
  }) =>
      ImpaktfullUiTableHeaderItemDimensTheme(
        minHeight: minHeight ?? this.minHeight,
        padding: padding ?? this.padding,
        sortIconSize: sortIconSize ?? this.sortIconSize,
        sortIconSpacing: sortIconSpacing ?? this.sortIconSpacing,
        spacing: spacing ?? this.spacing,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTableHeaderItemDimensTheme &&
          minHeight == other.minHeight &&
          padding == other.padding &&
          sortIconSize == other.sortIconSize &&
          sortIconSpacing == other.sortIconSpacing &&
          spacing == other.spacing;

  @override
  int get hashCode => Object.hash(
        minHeight,
        padding,
        sortIconSize,
        sortIconSpacing,
        spacing,
      );
}
