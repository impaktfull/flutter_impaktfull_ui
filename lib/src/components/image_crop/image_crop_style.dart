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

  static ImpaktfullUiImageCropTheme of(BuildContext context) => ImpaktfullUiTheme.of(context).components.imageCrop;
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
