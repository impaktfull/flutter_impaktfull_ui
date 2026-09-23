import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiConfettiTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiConfettiAssetsTheme assets;
  final ImpaktfullUiConfettiColorTheme colors;
  final ImpaktfullUiConfettiDimensTheme dimens;
  final ImpaktfullUiConfettiDurationsTheme durations;
  final ImpaktfullUiConfettiTextStyleTheme textStyles;

  const ImpaktfullUiConfettiTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    this.durations = const ImpaktfullUiConfettiDurationsTheme(),
    required this.textStyles,
  });

  ImpaktfullUiConfettiTheme copyWith({
    ImpaktfullUiConfettiAssetsTheme? assets,
    ImpaktfullUiConfettiColorTheme? colors,
    ImpaktfullUiConfettiDimensTheme? dimens,
    ImpaktfullUiConfettiDurationsTheme? durations,
    ImpaktfullUiConfettiTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiConfettiTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        textStyles: textStyles ?? this.textStyles,
      );

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
        durations: const ImpaktfullUiConfettiDurationsTheme(),
        textStyles: const ImpaktfullUiConfettiTextStyleTheme(),
      );
}

class ImpaktfullUiConfettiAssetsTheme {
  final ImpaktfullUiAsset leaf;

  const ImpaktfullUiConfettiAssetsTheme({
    required this.leaf,
  });

  ImpaktfullUiConfettiAssetsTheme copyWith({
    ImpaktfullUiAsset? leaf,
  }) =>
      ImpaktfullUiConfettiAssetsTheme(
        leaf: leaf ?? this.leaf,
      );
}

class ImpaktfullUiConfettiColorTheme {
  final Color particleColor;

  const ImpaktfullUiConfettiColorTheme({
    required this.particleColor,
  });

  ImpaktfullUiConfettiColorTheme copyWith({
    Color? particleColor,
  }) =>
      ImpaktfullUiConfettiColorTheme(
        particleColor: particleColor ?? this.particleColor,
      );
}

class ImpaktfullUiConfettiDimensTheme {
  const ImpaktfullUiConfettiDimensTheme();

  ImpaktfullUiConfettiDimensTheme copyWith() =>
      const ImpaktfullUiConfettiDimensTheme();
}

class ImpaktfullUiConfettiDurationsTheme {
  /// How long the confetti waits after a resize before it lays the particles
  /// out again.
  final Duration resizeDebounce;

  const ImpaktfullUiConfettiDurationsTheme({
    this.resizeDebounce = const Duration(milliseconds: 100),
  });

  ImpaktfullUiConfettiDurationsTheme copyWith({
    Duration? resizeDebounce,
  }) =>
      ImpaktfullUiConfettiDurationsTheme(
        resizeDebounce: resizeDebounce ?? this.resizeDebounce,
      );
}

class ImpaktfullUiConfettiTextStyleTheme {
  const ImpaktfullUiConfettiTextStyleTheme();

  ImpaktfullUiConfettiTextStyleTheme copyWith() =>
      const ImpaktfullUiConfettiTextStyleTheme();
}
