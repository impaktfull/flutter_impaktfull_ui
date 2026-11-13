import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiSectionTitleTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSectionTitleAssetsTheme assets;
  final ImpaktfullUiSectionTitleColorTheme colors;
  final ImpaktfullUiSectionTitleDimensTheme dimens;
  final ImpaktfullUiSectionTitleTextStyleTheme textStyles;

  const ImpaktfullUiSectionTitleTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiSectionTitleTheme copyWith({
    ImpaktfullUiSectionTitleAssetsTheme? assets,
    ImpaktfullUiSectionTitleColorTheme? colors,
    ImpaktfullUiSectionTitleDimensTheme? dimens,
    ImpaktfullUiSectionTitleTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiSectionTitleTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiSectionTitleTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.sectionTitle;

  static ImpaktfullUiSectionTitleTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiSectionTitleTheme(
        assets: const ImpaktfullUiSectionTitleAssetsTheme(),
        colors: ImpaktfullUiSectionTitleColorTheme(icons: colors.text),
        dimens: const ImpaktfullUiSectionTitleDimensTheme(
          margin: EdgeInsetsDirectional.only(start: 16, end: 16, top: 16),
          marginWithIconButtonActions: EdgeInsetsDirectional.only(
            start: 16,
            end: 4,
          ),
          overlineSpacing: 4,
          subtitleSpacing: 4,
        ),
        textStyles: ImpaktfullUiSectionTitleTextStyleTheme(
          overline: textStyles.onCardAccent.text.extraSmall.semiBold,
          subtitle: textStyles.onCardTertiary.text.small,
          title: textStyles.onCard.text.small.medium,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSectionTitleTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiSectionTitleAssetsTheme {
  const ImpaktfullUiSectionTitleAssetsTheme();

  ImpaktfullUiSectionTitleAssetsTheme copyWith() =>
      const ImpaktfullUiSectionTitleAssetsTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiSectionTitleAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiSectionTitleColorTheme {
  final Color icons;
  const ImpaktfullUiSectionTitleColorTheme({required this.icons});

  ImpaktfullUiSectionTitleColorTheme copyWith({Color? icons}) =>
      ImpaktfullUiSectionTitleColorTheme(icons: icons ?? this.icons);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSectionTitleColorTheme && icons == other.icons;

  @override
  int get hashCode => icons.hashCode;
}

class ImpaktfullUiSectionTitleDimensTheme {
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry marginWithIconButtonActions;

  /// The space between the overline and the title.
  final double overlineSpacing;

  /// The space between the title and the actions.
  final double spacing;

  /// The space between the title and the subtitle.
  final double subtitleSpacing;

  const ImpaktfullUiSectionTitleDimensTheme({
    required this.margin,
    required this.marginWithIconButtonActions,
    this.overlineSpacing = 4,
    this.spacing = 8,
    this.subtitleSpacing = 4,
  });

  ImpaktfullUiSectionTitleDimensTheme copyWith({
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? marginWithIconButtonActions,
    double? overlineSpacing,
    double? spacing,
    double? subtitleSpacing,
  }) =>
      ImpaktfullUiSectionTitleDimensTheme(
        margin: margin ?? this.margin,
        marginWithIconButtonActions:
            marginWithIconButtonActions ?? this.marginWithIconButtonActions,
        overlineSpacing: overlineSpacing ?? this.overlineSpacing,
        spacing: spacing ?? this.spacing,
        subtitleSpacing: subtitleSpacing ?? this.subtitleSpacing,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSectionTitleDimensTheme &&
          margin == other.margin &&
          marginWithIconButtonActions == other.marginWithIconButtonActions &&
          overlineSpacing == other.overlineSpacing &&
          spacing == other.spacing &&
          subtitleSpacing == other.subtitleSpacing;

  @override
  int get hashCode => Object.hash(
        margin,
        marginWithIconButtonActions,
        overlineSpacing,
        spacing,
        subtitleSpacing,
      );
}

class ImpaktfullUiSectionTitleTextStyleTheme {
  /// The small line above the title (also called an eyebrow).
  ///
  /// `null` uses [title].
  final TextStyle? overline;

  /// The secondary line under the title.
  ///
  /// `null` uses [title].
  final TextStyle? subtitle;

  final TextStyle title;

  const ImpaktfullUiSectionTitleTextStyleTheme({
    this.overline,
    this.subtitle,
    required this.title,
  });

  ImpaktfullUiSectionTitleTextStyleTheme copyWith({
    TextStyle? overline,
    TextStyle? subtitle,
    TextStyle? title,
  }) =>
      ImpaktfullUiSectionTitleTextStyleTheme(
        overline: overline ?? this.overline,
        subtitle: subtitle ?? this.subtitle,
        title: title ?? this.title,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSectionTitleTextStyleTheme &&
          overline == other.overline &&
          subtitle == other.subtitle &&
          title == other.title;

  @override
  int get hashCode => Object.hash(overline, subtitle, title);
}
