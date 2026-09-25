import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiCmsHeaderTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiCmsHeaderAssetsTheme assets;
  final ImpaktfullUiCmsHeaderColorTheme colors;
  final ImpaktfullUiCmsHeaderDimensTheme dimens;
  final ImpaktfullUiCmsHeaderShadowsTheme shadows;
  final ImpaktfullUiCmsHeaderTextStyleTheme textStyles;

  const ImpaktfullUiCmsHeaderTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.shadows,
    required this.textStyles,
  });

  ImpaktfullUiCmsHeaderTheme copyWith({
    ImpaktfullUiCmsHeaderAssetsTheme? assets,
    ImpaktfullUiCmsHeaderColorTheme? colors,
    ImpaktfullUiCmsHeaderDimensTheme? dimens,
    ImpaktfullUiCmsHeaderShadowsTheme? shadows,
    ImpaktfullUiCmsHeaderTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiCmsHeaderTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        shadows: shadows ?? this.shadows,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiCmsHeaderTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.cmsHeader;

  static ImpaktfullUiCmsHeaderTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiCmsHeaderTheme(
        assets: ImpaktfullUiCmsHeaderAssetsTheme(
          back: assets.icons.arrowLeft,
          drawerMenu: assets.icons.list,
        ),
        colors: ImpaktfullUiCmsHeaderColorTheme(
          background: colors.card,
          border: colors.border,
          icons: colors.text,
        ),
        dimens: const ImpaktfullUiCmsHeaderDimensTheme(),
        shadows: ImpaktfullUiCmsHeaderShadowsTheme(
          background: shadows.extraSmall,
        ),
        textStyles: ImpaktfullUiCmsHeaderTextStyleTheme(
          title: textStyles.onCard.text.large,
          subtitle: textStyles.onCard.text.small.light,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiCmsHeaderTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          shadows == other.shadows &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, shadows, textStyles);
}

class ImpaktfullUiCmsHeaderAssetsTheme {
  final ImpaktfullUiAsset back;
  final ImpaktfullUiAsset drawerMenu;

  const ImpaktfullUiCmsHeaderAssetsTheme({
    required this.back,
    required this.drawerMenu,
  });

  ImpaktfullUiCmsHeaderAssetsTheme copyWith({
    ImpaktfullUiAsset? back,
    ImpaktfullUiAsset? drawerMenu,
  }) =>
      ImpaktfullUiCmsHeaderAssetsTheme(
        back: back ?? this.back,
        drawerMenu: drawerMenu ?? this.drawerMenu,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiCmsHeaderAssetsTheme &&
          back == other.back &&
          drawerMenu == other.drawerMenu;

  @override
  int get hashCode => Object.hash(back, drawerMenu);
}

class ImpaktfullUiCmsHeaderColorTheme {
  final Color background;
  final Color? border;
  final Color icons;

  const ImpaktfullUiCmsHeaderColorTheme({
    required this.background,
    required this.border,
    required this.icons,
  });

  ImpaktfullUiCmsHeaderColorTheme copyWith({
    Color? background,
    Color? border,
    Color? icons,
  }) =>
      ImpaktfullUiCmsHeaderColorTheme(
        background: background ?? this.background,
        border: border ?? this.border,
        icons: icons ?? this.icons,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiCmsHeaderColorTheme &&
          background == other.background &&
          border == other.border &&
          icons == other.icons;

  @override
  int get hashCode => Object.hash(background, border, icons);
}

class ImpaktfullUiCmsHeaderDimensTheme {
  /// The thickness of the border.
  final double borderWidth;

  /// The minimum height of the header.
  final double minHeight;

  /// The space between the parts of the header.
  final double spacing;

  /// The space between the title and the subtitle.
  final double titleSpacing;

  const ImpaktfullUiCmsHeaderDimensTheme({
    this.borderWidth = 1,
    this.minHeight = 64,
    this.spacing = 8,
    this.titleSpacing = 2,
  });

  ImpaktfullUiCmsHeaderDimensTheme copyWith({
    double? borderWidth,
    double? minHeight,
    double? spacing,
    double? titleSpacing,
  }) =>
      ImpaktfullUiCmsHeaderDimensTheme(
        borderWidth: borderWidth ?? this.borderWidth,
        minHeight: minHeight ?? this.minHeight,
        spacing: spacing ?? this.spacing,
        titleSpacing: titleSpacing ?? this.titleSpacing,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiCmsHeaderDimensTheme &&
          borderWidth == other.borderWidth &&
          minHeight == other.minHeight &&
          spacing == other.spacing &&
          titleSpacing == other.titleSpacing;

  @override
  int get hashCode => Object.hash(
        borderWidth,
        minHeight,
        spacing,
        titleSpacing,
      );
}

class ImpaktfullUiCmsHeaderDurationsTheme {
  const ImpaktfullUiCmsHeaderDurationsTheme();

  ImpaktfullUiCmsHeaderDurationsTheme copyWith() =>
      const ImpaktfullUiCmsHeaderDurationsTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiCmsHeaderDurationsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiCmsHeaderShadowsTheme {
  final List<BoxShadow> background;
  const ImpaktfullUiCmsHeaderShadowsTheme({
    required this.background,
  });

  ImpaktfullUiCmsHeaderShadowsTheme copyWith({
    List<BoxShadow>? background,
  }) =>
      ImpaktfullUiCmsHeaderShadowsTheme(
        background: background ?? this.background,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiCmsHeaderShadowsTheme &&
          listEquals(background, other.background);

  @override
  int get hashCode => Object.hashAll(background);
}

class ImpaktfullUiCmsHeaderTextStyleTheme {
  final TextStyle title;
  final TextStyle subtitle;

  const ImpaktfullUiCmsHeaderTextStyleTheme({
    required this.title,
    required this.subtitle,
  });

  ImpaktfullUiCmsHeaderTextStyleTheme copyWith({
    TextStyle? subtitle,
    TextStyle? title,
  }) =>
      ImpaktfullUiCmsHeaderTextStyleTheme(
        subtitle: subtitle ?? this.subtitle,
        title: title ?? this.title,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiCmsHeaderTextStyleTheme &&
          title == other.title &&
          subtitle == other.subtitle;

  @override
  int get hashCode => Object.hash(title, subtitle);
}
