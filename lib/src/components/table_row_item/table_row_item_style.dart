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

  const ImpaktfullUiTableRowItemDimensTheme({
    this.minHeight = 48,
  });

  ImpaktfullUiTableRowItemDimensTheme copyWith({
    double? minHeight,
  }) =>
      ImpaktfullUiTableRowItemDimensTheme(
        minHeight: minHeight ?? this.minHeight,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTableRowItemDimensTheme &&
          minHeight == other.minHeight;

  @override
  int get hashCode => minHeight.hashCode;
}
