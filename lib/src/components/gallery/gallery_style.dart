import 'package:flutter/widgets.dart';
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

  static ImpaktfullUiGalleryTheme of(BuildContext context) => ImpaktfullUiTheme.of(context).components.gallery;

  static ImpaktfullUiGalleryTheme defaultTheme({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiGalleryTheme(
        assets: const ImpaktfullUiGalleryAssetsTheme(),
        colors: const ImpaktfullUiGalleryColorTheme(),
        dimens: ImpaktfullUiGalleryDimensTheme(
          itemBorderRadius: dimens.borderRadius,
        ),
        textStyles: const ImpaktfullUiGalleryTextStyleTheme(),
      );
}

class ImpaktfullUiGalleryAssetsTheme {
  const ImpaktfullUiGalleryAssetsTheme();
}

class ImpaktfullUiGalleryColorTheme {
  const ImpaktfullUiGalleryColorTheme();
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
