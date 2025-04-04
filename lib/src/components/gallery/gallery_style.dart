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

  static ImpaktfullUiGalleryTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.gallery;

  static ImpaktfullUiGalleryTheme defaultTheme({
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
}

class ImpaktfullUiGalleryDimensTheme {
  final BorderRadiusGeometry itemBorderRadius;
  const ImpaktfullUiGalleryDimensTheme({
    required this.itemBorderRadius,
  });
}

class ImpaktfullUiGalleryDurationsTheme {
  final Duration pageTransition;
  const ImpaktfullUiGalleryDurationsTheme({
    required this.pageTransition,
  });
}

class ImpaktfullUiGalleryTextStyleTheme {
  final TextStyle itemTitle;
  final TextStyle itemDescription;

  const ImpaktfullUiGalleryTextStyleTheme({
    required this.itemTitle,
    required this.itemDescription,
  });
}
