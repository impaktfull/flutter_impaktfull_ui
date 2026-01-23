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

  static ImpaktfullUiPaginationTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiPaginationTheme(
        assets: ImpaktfullUiPaginationAssetsTheme(
          arrowLeft: assets.icons.arrowLeft,
          arrowRight: assets.icons.arrowRight,
        ),
        colors: const ImpaktfullUiPaginationColorTheme(),
        dimens: const ImpaktfullUiPaginationDimensTheme(),
        textStyles: ImpaktfullUiPaginationTextStyleTheme(
          text: textStyles.onCard.text.small,
        ),
      );
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
