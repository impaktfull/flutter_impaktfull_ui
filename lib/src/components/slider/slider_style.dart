import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiSliderTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSliderAssetsTheme assets;
  final ImpaktfullUiSliderColorTheme colors;
  final ImpaktfullUiSliderDimensTheme dimens;
  final ImpaktfullUiSliderTextStyleTheme textStyles;

  const ImpaktfullUiSliderTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiSliderTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.slider;

  static ImpaktfullUiSliderTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiSliderTheme(
        assets: const ImpaktfullUiSliderAssetsTheme(),
        colors: ImpaktfullUiSliderColorTheme(
          thumb: colors.accent,
          thumbBorder: colors.border,
          track: colors.card,
          trackBorder: colors.border,
          activeTrack: colors.accent,
        ),
        dimens: ImpaktfullUiSliderDimensTheme(
          trackBorderRadius: dimens.borderRadiusSmall,
          thumbBorderRadius: dimens.borderRadiusExtraSmall,
        ),
        textStyles: const ImpaktfullUiSliderTextStyleTheme(),
      );
}

class ImpaktfullUiSliderAssetsTheme {
  const ImpaktfullUiSliderAssetsTheme();
}

class ImpaktfullUiSliderColorTheme {
  final Color track;
  final Color activeTrack;
  final Color trackBorder;
  final Color thumb;
  final Color thumbBorder;

  const ImpaktfullUiSliderColorTheme({
    required this.track,
    required this.activeTrack,
    required this.trackBorder,
    required this.thumb,
    required this.thumbBorder,
  });
}

class ImpaktfullUiSliderDimensTheme {
  final BorderRadiusGeometry trackBorderRadius;
  final BorderRadiusGeometry thumbBorderRadius;

  const ImpaktfullUiSliderDimensTheme({
    required this.trackBorderRadius,
    required this.thumbBorderRadius,
  });
}

class ImpaktfullUiSliderTextStyleTheme {
  const ImpaktfullUiSliderTextStyleTheme();
}
