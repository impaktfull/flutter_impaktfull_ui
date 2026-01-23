import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiImageCropTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiImageCropAssetsTheme assets;
  final ImpaktfullUiImageCropColorTheme colors;
  final ImpaktfullUiImageCropDimensTheme dimens;
  final ImpaktfullUiImageCropTextStyleTheme textStyles;

  const ImpaktfullUiImageCropTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiImageCropTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.imageCrop;

  static ImpaktfullUiImageCropTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiImageCropTheme(
        assets: ImpaktfullUiImageCropAssetsTheme(
          delete: assets.icons.delete,
        ),
        colors: ImpaktfullUiImageCropColorTheme(
          deleteIcon: colors.card,
        ),
        dimens: const ImpaktfullUiImageCropDimensTheme(),
        textStyles: const ImpaktfullUiImageCropTextStyleTheme(),
      );
}

class ImpaktfullUiImageCropAssetsTheme {
  final ImpaktfullUiAsset delete;
  const ImpaktfullUiImageCropAssetsTheme({
    required this.delete,
  });
}

class ImpaktfullUiImageCropColorTheme {
  final Color deleteIcon;
  const ImpaktfullUiImageCropColorTheme({
    required this.deleteIcon,
  });
}

class ImpaktfullUiImageCropDimensTheme {
  const ImpaktfullUiImageCropDimensTheme();
}

class ImpaktfullUiImageCropTextStyleTheme {
  const ImpaktfullUiImageCropTextStyleTheme();
}
