import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

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
}

class ImpaktfullUiLoadingErrorDataAssetsTheme {
  const ImpaktfullUiLoadingErrorDataAssetsTheme();
}

class ImpaktfullUiLoadingErrorDataColorTheme {
  const ImpaktfullUiLoadingErrorDataColorTheme();
}

class ImpaktfullUiLoadingErrorDataDimensTheme {
  const ImpaktfullUiLoadingErrorDataDimensTheme();
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
