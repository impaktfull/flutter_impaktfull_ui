import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiLoadingIndicatorTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiLoadingIndicatorColorTheme colors;
  final ImpaktfullUiLoadingIndicatorAssetTheme assets;

  const ImpaktfullUiLoadingIndicatorTheme({
    required this.colors,
    required this.assets,
  });
}

class ImpaktfullUiLoadingIndicatorColorTheme {
  final Color color;
  const ImpaktfullUiLoadingIndicatorColorTheme({
    required this.color,
  });
}

class ImpaktfullUiLoadingIndicatorAssetTheme {
  final String? lottie;
  const ImpaktfullUiLoadingIndicatorAssetTheme({
    required this.lottie,
  });
}
