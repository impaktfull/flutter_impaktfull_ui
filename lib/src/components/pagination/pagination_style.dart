import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiPaginationTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiPaginationAssetsTheme assets;
  final ImpaktfullUiPaginationColorTheme colors;
  final ImpaktfullUiPaginationDimensTheme dimens;
  final ImpaktfullUiPaginationTextStyleTheme textStyles;

  const ImpaktfullUiPaginationTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiPaginationTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.pagination;
}

class ImpaktfullUiPaginationAssetsTheme {
  final ImpaktfullUiAsset arrowLeft;
  final ImpaktfullUiAsset arrowRight;
  const ImpaktfullUiPaginationAssetsTheme({
    required this.arrowLeft,
    required this.arrowRight,
  });
}

class ImpaktfullUiPaginationColorTheme {
  const ImpaktfullUiPaginationColorTheme();
}

class ImpaktfullUiPaginationDimensTheme {
  const ImpaktfullUiPaginationDimensTheme();
}

class ImpaktfullUiPaginationTextStyleTheme {
  final TextStyle text;

  const ImpaktfullUiPaginationTextStyleTheme({
    required this.text,
  });
}
