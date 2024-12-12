import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiConfettiTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiConfettiAssetsTheme assets;
  final ImpaktfullUiConfettiColorTheme colors;
  final ImpaktfullUiConfettiDimensTheme dimens;
  final ImpaktfullUiConfettiTextStyleTheme textStyles;

  const ImpaktfullUiConfettiTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiConfettiTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.confetti;

  static ImpaktfullUiConfettiTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiConfettiTheme(
        assets: ImpaktfullUiConfettiAssetsTheme(
          leaf: assets.icons.leaf,
        ),
        colors: ImpaktfullUiConfettiColorTheme(
          particleColor: colors.accent,
        ),
        dimens: const ImpaktfullUiConfettiDimensTheme(),
        textStyles: const ImpaktfullUiConfettiTextStyleTheme(),
      );
}

class ImpaktfullUiConfettiAssetsTheme {
  final ImpaktfullUiAsset leaf;

  const ImpaktfullUiConfettiAssetsTheme({
    required this.leaf,
  });
}

class ImpaktfullUiConfettiColorTheme {
  final Color particleColor;

  const ImpaktfullUiConfettiColorTheme({
    required this.particleColor,
  });
}

class ImpaktfullUiConfettiDimensTheme {
  const ImpaktfullUiConfettiDimensTheme();
}

class ImpaktfullUiConfettiTextStyleTheme {
  const ImpaktfullUiConfettiTextStyleTheme();
}
