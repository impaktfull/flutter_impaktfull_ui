import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiGalleryTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiGalleryAssetsTheme assets;
  final ImpaktfullUiGalleryColorTheme colors;
  final ImpaktfullUiGalleryDimensTheme dimens;
  final ImpaktfullUiGalleryTextStyleTheme textStyles;

  const ImpaktfullUiGalleryTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
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
        ),
        colors: ImpaktfullUiGalleryColorTheme(
          close: colors.textOnPrimary,
          background: Colors.black54,
        ),
        dimens: ImpaktfullUiGalleryDimensTheme(
          itemBorderRadius: dimens.borderRadius,
        ),
        textStyles: const ImpaktfullUiGalleryTextStyleTheme(),
      );
}

class ImpaktfullUiGalleryAssetsTheme {
  final ImpaktfullUiAsset close;
  const ImpaktfullUiGalleryAssetsTheme({
    required this.close,
  });
}

class ImpaktfullUiGalleryColorTheme {
  final Color close;
  final Color background;

  const ImpaktfullUiGalleryColorTheme({
    required this.close,
    required this.background,
  });
}

class ImpaktfullUiGalleryDimensTheme {
  final BorderRadiusGeometry itemBorderRadius;
  const ImpaktfullUiGalleryDimensTheme({
    required this.itemBorderRadius,
  });
}

class ImpaktfullUiGalleryTextStyleTheme {
  const ImpaktfullUiGalleryTextStyleTheme();
}
