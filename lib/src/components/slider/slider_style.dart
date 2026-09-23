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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSliderTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiSliderAssetsTheme {
  const ImpaktfullUiSliderAssetsTheme();

  ImpaktfullUiSliderAssetsTheme copyWith() =>
      const ImpaktfullUiSliderAssetsTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiSliderAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSliderColorTheme &&
          track == other.track &&
          activeTrack == other.activeTrack &&
          trackBorder == other.trackBorder &&
          thumb == other.thumb &&
          thumbBorder == other.thumbBorder;

  @override
  int get hashCode =>
      Object.hash(track, activeTrack, trackBorder, thumb, thumbBorder);
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSliderDimensTheme &&
          trackBorderRadius == other.trackBorderRadius &&
          thumbBorderRadius == other.thumbBorderRadius;

  @override
  int get hashCode => Object.hash(trackBorderRadius, thumbBorderRadius);
}

class ImpaktfullUiSliderTextStyleTheme {
  const ImpaktfullUiSliderTextStyleTheme();

  ImpaktfullUiSliderTextStyleTheme copyWith() =>
      const ImpaktfullUiSliderTextStyleTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiSliderTextStyleTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}
