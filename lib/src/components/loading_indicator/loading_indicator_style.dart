import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiLoadingIndicatorTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiLoadingIndicatorColorTheme colors;
  final ImpaktfullUiLoadingIndicatorDimensTheme dimens;
  final ImpaktfullUiLoadingIndicatorAssetsTheme assets;

  const ImpaktfullUiLoadingIndicatorTheme({
    required this.colors,
    required this.assets,
    required this.dimens,
  });

  ImpaktfullUiLoadingIndicatorTheme copyWith({
    ImpaktfullUiLoadingIndicatorAssetsTheme? assets,
    ImpaktfullUiLoadingIndicatorColorTheme? colors,
    ImpaktfullUiLoadingIndicatorDimensTheme? dimens,
  }) =>
      ImpaktfullUiLoadingIndicatorTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
      );

  static ImpaktfullUiLoadingIndicatorTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.loadingIndicator;

  static ImpaktfullUiLoadingIndicatorTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) {
    return ImpaktfullUiLoadingIndicatorTheme(
      colors: ImpaktfullUiLoadingIndicatorColorTheme(
        color: colors.accent,
      ),
      assets: ImpaktfullUiLoadingIndicatorAssetsTheme(
        lottie: assets.lotties.loading,
      ),
      dimens: ImpaktfullUiLoadingIndicatorDimensTheme(
        strokeWidth: 4,
      ),
    );
  }
}

class ImpaktfullUiLoadingIndicatorColorTheme {
  final Color color;
  const ImpaktfullUiLoadingIndicatorColorTheme({
    required this.color,
  });

  ImpaktfullUiLoadingIndicatorColorTheme copyWith({
    Color? color,
  }) =>
      ImpaktfullUiLoadingIndicatorColorTheme(
        color: color ?? this.color,
      );
}

class ImpaktfullUiLoadingIndicatorDimensTheme {
  final double strokeWidth;

  const ImpaktfullUiLoadingIndicatorDimensTheme({
    required this.strokeWidth,
  });

  ImpaktfullUiLoadingIndicatorDimensTheme copyWith({
    double? strokeWidth,
  }) =>
      ImpaktfullUiLoadingIndicatorDimensTheme(
        strokeWidth: strokeWidth ?? this.strokeWidth,
      );
}

class ImpaktfullUiLoadingIndicatorAssetsTheme {
  final ImpaktfullUiAsset? lottie;
  const ImpaktfullUiLoadingIndicatorAssetsTheme({
    required this.lottie,
  });

  ImpaktfullUiLoadingIndicatorAssetsTheme copyWith({
    ImpaktfullUiAsset? lottie,
  }) =>
      ImpaktfullUiLoadingIndicatorAssetsTheme(
        lottie: lottie ?? this.lottie,
      );
}
