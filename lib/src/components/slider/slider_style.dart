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

  ImpaktfullUiSliderTheme copyWith({
    ImpaktfullUiSliderAssetsTheme? assets,
    ImpaktfullUiSliderColorTheme? colors,
    ImpaktfullUiSliderDimensTheme? dimens,
    ImpaktfullUiSliderTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiSliderTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

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

  ImpaktfullUiSliderAssetsTheme copyWith() =>
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

  ImpaktfullUiSliderColorTheme copyWith({
    Color? activeTrack,
    Color? thumb,
    Color? thumbBorder,
    Color? track,
    Color? trackBorder,
  }) =>
      ImpaktfullUiSliderColorTheme(
        activeTrack: activeTrack ?? this.activeTrack,
        thumb: thumb ?? this.thumb,
        thumbBorder: thumbBorder ?? this.thumbBorder,
        track: track ?? this.track,
        trackBorder: trackBorder ?? this.trackBorder,
      );
}

class ImpaktfullUiSliderDimensTheme {
  final BorderRadiusGeometry trackBorderRadius;
  final BorderRadiusGeometry thumbBorderRadius;

  const ImpaktfullUiSliderDimensTheme({
    required this.trackBorderRadius,
    required this.thumbBorderRadius,
  });

  ImpaktfullUiSliderDimensTheme copyWith({
    BorderRadiusGeometry? thumbBorderRadius,
    BorderRadiusGeometry? trackBorderRadius,
  }) =>
      ImpaktfullUiSliderDimensTheme(
        thumbBorderRadius: thumbBorderRadius ?? this.thumbBorderRadius,
        trackBorderRadius: trackBorderRadius ?? this.trackBorderRadius,
      );
}

class ImpaktfullUiSliderTextStyleTheme {
  const ImpaktfullUiSliderTextStyleTheme();

  ImpaktfullUiSliderTextStyleTheme copyWith() =>
      const ImpaktfullUiSliderTextStyleTheme();
}
