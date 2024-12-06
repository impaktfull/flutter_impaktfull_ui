import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';
import 'package:impaktfull_ui_2/src/util/extension/text_style_extension.dart';

class ImpaktfullUiLoadingErrorDataTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiLoadingErrorDataAssetsTheme assets;
  final ImpaktfullUiLoadingErrorDataColorTheme colors;
  final ImpaktfullUiLoadingErrorDataDimensTheme dimens;
  final ImpaktfullUiLoadingErrorDataTextStyleTheme textStyles;

  const ImpaktfullUiLoadingErrorDataTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiLoadingErrorDataTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.loadingErrorData;

  static ImpaktfullUiLoadingErrorDataTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) {
    return ImpaktfullUiLoadingErrorDataTheme(
      assets: const ImpaktfullUiLoadingErrorDataAssetsTheme(),
      colors: const ImpaktfullUiLoadingErrorDataColorTheme(),
      dimens: const ImpaktfullUiLoadingErrorDataDimensTheme(
        loadingWidth: 48,
        loadingHeight: 48,
      ),
      textStyles: ImpaktfullUiLoadingErrorDataTextStyleTheme(
        noDataTitle: textStyles.onCanvas.display.small.semiBold,
        noDataMessage: textStyles.onCanvas.text.small.light,
        errorTitle: textStyles.onCanvas.display.small.semiBold,
        errorMessage: textStyles.onCanvas.text.small.light,
      ),
    );
  }
}

class ImpaktfullUiLoadingErrorDataAssetsTheme {
  const ImpaktfullUiLoadingErrorDataAssetsTheme();
}

class ImpaktfullUiLoadingErrorDataColorTheme {
  const ImpaktfullUiLoadingErrorDataColorTheme();
}

class ImpaktfullUiLoadingErrorDataDimensTheme {
  final double? loadingWidth;
  final double? loadingHeight;

  const ImpaktfullUiLoadingErrorDataDimensTheme({
    required this.loadingWidth,
    required this.loadingHeight,
  });
}

class ImpaktfullUiLoadingErrorDataTextStyleTheme {
  final TextStyle noDataTitle;
  final TextStyle noDataMessage;
  final TextStyle errorTitle;
  final TextStyle errorMessage;
  const ImpaktfullUiLoadingErrorDataTextStyleTheme({
    required this.noDataTitle,
    required this.noDataMessage,
    required this.errorTitle,
    required this.errorMessage,
  });
}
