import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/color_extensions.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiGalleryTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiGalleryAssetsTheme assets;
  final ImpaktfullUiGalleryColorTheme colors;
  final ImpaktfullUiGalleryDimensTheme dimens;
  final ImpaktfullUiGalleryDurationsTheme durations;
  final ImpaktfullUiGalleryTextStyleTheme textStyles;

  const ImpaktfullUiGalleryTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.durations,
    required this.textStyles,
  });

  ImpaktfullUiGalleryTheme copyWith({
    ImpaktfullUiGalleryAssetsTheme? assets,
    ImpaktfullUiGalleryColorTheme? colors,
    ImpaktfullUiGalleryDimensTheme? dimens,
    ImpaktfullUiGalleryDurationsTheme? durations,
    ImpaktfullUiGalleryTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiGalleryTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiGalleryTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.gallery;

  static ImpaktfullUiGalleryTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiGalleryTheme(
        assets: ImpaktfullUiGalleryAssetsTheme(
          close: assets.icons.close,
          arrowRight: assets.icons.arrowRight,
          arrowLeft: assets.icons.arrowLeft,
        ),
        colors: ImpaktfullUiGalleryColorTheme(
          icons: colors.textOnPrimary,
          background: Colors.black54,
          iconButtonBackground: Colors.white.withOpacityPercentage(0.05),
        ),
        dimens: ImpaktfullUiGalleryDimensTheme(
          itemBorderRadius: dimens.borderRadius,
        ),
        durations: ImpaktfullUiGalleryDurationsTheme(
          pageTransition: durations.short,
        ),
        textStyles: ImpaktfullUiGalleryTextStyleTheme(
          itemTitle: textStyles.onAccent.display.extraSmall,
          itemDescription: textStyles.onAccent.text.small.withOpacity(0.5),
        ),
      );
}

class ImpaktfullUiGalleryAssetsTheme {
  final ImpaktfullUiAsset close;
  final ImpaktfullUiAsset arrowRight;
  final ImpaktfullUiAsset arrowLeft;
  const ImpaktfullUiGalleryAssetsTheme({
    required this.close,
    required this.arrowRight,
    required this.arrowLeft,
  });

  ImpaktfullUiGalleryAssetsTheme copyWith({
    ImpaktfullUiAsset? arrowLeft,
    ImpaktfullUiAsset? arrowRight,
    ImpaktfullUiAsset? close,
  }) =>
      ImpaktfullUiGalleryAssetsTheme(
        arrowLeft: arrowLeft ?? this.arrowLeft,
        arrowRight: arrowRight ?? this.arrowRight,
        close: close ?? this.close,
      );
}

class ImpaktfullUiGalleryColorTheme {
  final Color icons;
  final Color background;
  final Color? iconButtonBackground;

  const ImpaktfullUiGalleryColorTheme({
    required this.icons,
    required this.background,
    required this.iconButtonBackground,
  });

  ImpaktfullUiGalleryColorTheme copyWith({
    Color? background,
    Color? iconButtonBackground,
    Color? icons,
  }) =>
      ImpaktfullUiGalleryColorTheme(
        background: background ?? this.background,
        iconButtonBackground: iconButtonBackground ?? this.iconButtonBackground,
        icons: icons ?? this.icons,
      );
}

class ImpaktfullUiGalleryDimensTheme {
  final BorderRadiusGeometry itemBorderRadius;
  const ImpaktfullUiGalleryDimensTheme({
    required this.itemBorderRadius,
  });

  ImpaktfullUiGalleryDimensTheme copyWith({
    BorderRadiusGeometry? itemBorderRadius,
  }) =>
      ImpaktfullUiGalleryDimensTheme(
        itemBorderRadius: itemBorderRadius ?? this.itemBorderRadius,
      );
}

class ImpaktfullUiGalleryDurationsTheme {
  final Duration pageTransition;

  /// How long a double tap takes to zoom the image in or out.
  final Duration zoom;

  const ImpaktfullUiGalleryDurationsTheme({
    required this.pageTransition,
    this.zoom = const Duration(milliseconds: 300),
  });

  ImpaktfullUiGalleryDurationsTheme copyWith({
    Duration? pageTransition,
    Duration? zoom,
  }) =>
      ImpaktfullUiGalleryDurationsTheme(
        pageTransition: pageTransition ?? this.pageTransition,
        zoom: zoom ?? this.zoom,
      );
}

class ImpaktfullUiGalleryTextStyleTheme {
  final TextStyle itemTitle;
  final TextStyle itemDescription;

  const ImpaktfullUiGalleryTextStyleTheme({
    required this.itemTitle,
    required this.itemDescription,
  });

  ImpaktfullUiGalleryTextStyleTheme copyWith({
    TextStyle? itemDescription,
    TextStyle? itemTitle,
  }) =>
      ImpaktfullUiGalleryTextStyleTheme(
        itemDescription: itemDescription ?? this.itemDescription,
        itemTitle: itemTitle ?? this.itemTitle,
      );
}
