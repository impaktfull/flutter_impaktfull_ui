import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiCmsHeaderTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiCmsHeaderColorTheme colors;
  final ImpaktfullUiCmsHeaderDimensTheme dimens;
  final ImpaktfullUiCmsHeaderAssetsTheme assets;

  const ImpaktfullUiCmsHeaderTheme({
    required this.colors,
    required this.dimens,
    required this.assets,
  });

  static ImpaktfullUiCmsHeaderTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.cmsHeader;
}

class ImpaktfullUiCmsHeaderColorTheme {
  final Color background;
  final Color? border;

  const ImpaktfullUiCmsHeaderColorTheme({
    required this.background,
    required this.border,
  });
}

class ImpaktfullUiCmsHeaderDimensTheme {
  const ImpaktfullUiCmsHeaderDimensTheme();
}

class ImpaktfullUiCmsHeaderAssetsTheme {
  final ImpaktfullUiAsset back;

  const ImpaktfullUiCmsHeaderAssetsTheme({
    required this.back,
  });
}
