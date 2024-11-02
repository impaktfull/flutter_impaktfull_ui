import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiLoadingIndicatorTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiLoadingIndicatorColorTheme colors;
  final ImpaktfullUiLoadingIndicatorAssetTheme assets;

  const ImpaktfullUiLoadingIndicatorTheme({
    required this.colors,
    required this.assets,
  });

  static ImpaktfullUiLoadingIndicatorTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.loadingIndicator;
}

class ImpaktfullUiLoadingIndicatorColorTheme {
  final Color color;
  const ImpaktfullUiLoadingIndicatorColorTheme({
    required this.color,
  });
}

class ImpaktfullUiLoadingIndicatorAssetTheme {
  final ImpaktfullUiAsset? lottie;
  const ImpaktfullUiLoadingIndicatorAssetTheme({
    required this.lottie,
  });
}
