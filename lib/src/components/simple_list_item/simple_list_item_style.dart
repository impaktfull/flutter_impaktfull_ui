import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiSimpleListItemTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSimpleListItemAssetsTheme assets;
  final ImpaktfullUiSimpleListItemColorTheme colors;
  final ImpaktfullUiSimpleListItemDimensTheme dimens;
  final ImpaktfullUiSimpleListItemTextStyleTheme textStyles;

  const ImpaktfullUiSimpleListItemTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiSimpleListItemTheme copyWith({
    ImpaktfullUiSimpleListItemAssetsTheme? assets,
    ImpaktfullUiSimpleListItemColorTheme? colors,
    ImpaktfullUiSimpleListItemDimensTheme? dimens,
    ImpaktfullUiSimpleListItemTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiSimpleListItemTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiSimpleListItemTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.simpleListItem;

  static ImpaktfullUiSimpleListItemTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiSimpleListItemTheme(
        assets: const ImpaktfullUiSimpleListItemAssetsTheme(),
        colors: ImpaktfullUiSimpleListItemColorTheme(
          background: colors.card,
        ),
        dimens: const ImpaktfullUiSimpleListItemDimensTheme(
          padding: EdgeInsets.all(16),
          borderRadius: BorderRadius.zero,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8,
        ),
        textStyles: ImpaktfullUiSimpleListItemTextStyleTheme(
          title: textStyles.onCard.text.small.medium,
          titleDanger: textStyles.onCardDestructive.text.small.medium,
          subtitle: textStyles.onCard.text.small.light,
          subtitleDanger: textStyles.onCardDestructive.text.small.light,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSimpleListItemTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiSimpleListItemAssetsTheme {
  const ImpaktfullUiSimpleListItemAssetsTheme();

  ImpaktfullUiSimpleListItemAssetsTheme copyWith() =>
      const ImpaktfullUiSimpleListItemAssetsTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiSimpleListItemAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiSimpleListItemColorTheme {
  final Color background;

  const ImpaktfullUiSimpleListItemColorTheme({
    required this.background,
  });

  ImpaktfullUiSimpleListItemColorTheme copyWith({
    Color? background,
  }) =>
      ImpaktfullUiSimpleListItemColorTheme(
        background: background ?? this.background,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSimpleListItemColorTheme &&
          background == other.background;

  @override
  int get hashCode => background.hashCode;
}

class ImpaktfullUiSimpleListItemDimensTheme {
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry borderRadius;
  final CrossAxisAlignment crossAxisAlignment;
  final double spacing;

  /// The space between the title and the subtitle.
  final double titleSpacing;

  const ImpaktfullUiSimpleListItemDimensTheme({
    required this.padding,
    required this.borderRadius,
    required this.crossAxisAlignment,
    required this.spacing,
    this.titleSpacing = 2,
  });

  ImpaktfullUiSimpleListItemDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    CrossAxisAlignment? crossAxisAlignment,
    EdgeInsetsGeometry? padding,
    double? spacing,
    double? titleSpacing,
  }) =>
      ImpaktfullUiSimpleListItemDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
        padding: padding ?? this.padding,
        spacing: spacing ?? this.spacing,
        titleSpacing: titleSpacing ?? this.titleSpacing,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSimpleListItemDimensTheme &&
          padding == other.padding &&
          borderRadius == other.borderRadius &&
          crossAxisAlignment == other.crossAxisAlignment &&
          spacing == other.spacing &&
          titleSpacing == other.titleSpacing;

  @override
  int get hashCode => Object.hash(
      padding, borderRadius, crossAxisAlignment, spacing, titleSpacing);
}

class ImpaktfullUiSimpleListItemTextStyleTheme {
  final TextStyle title;
  final TextStyle titleDanger;
  final TextStyle subtitle;
  final TextStyle subtitleDanger;

  const ImpaktfullUiSimpleListItemTextStyleTheme({
    required this.title,
    required this.titleDanger,
    required this.subtitle,
    required this.subtitleDanger,
  });

  ImpaktfullUiSimpleListItemTextStyleTheme copyWith({
    TextStyle? subtitle,
    TextStyle? subtitleDanger,
    TextStyle? title,
    TextStyle? titleDanger,
  }) =>
      ImpaktfullUiSimpleListItemTextStyleTheme(
        subtitle: subtitle ?? this.subtitle,
        subtitleDanger: subtitleDanger ?? this.subtitleDanger,
        title: title ?? this.title,
        titleDanger: titleDanger ?? this.titleDanger,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSimpleListItemTextStyleTheme &&
          title == other.title &&
          titleDanger == other.titleDanger &&
          subtitle == other.subtitle &&
          subtitleDanger == other.subtitleDanger;

  @override
  int get hashCode => Object.hash(title, titleDanger, subtitle, subtitleDanger);
}
