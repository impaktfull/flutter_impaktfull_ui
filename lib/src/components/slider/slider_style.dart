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

  /// The height of the slider, the area a pointer can grab it in.
  final double height;

  /// The height of the row a `legendBuilder` is given.
  final double legendHeight;

  /// The thickness of the track. `h-1.5` (6) of shadcn/ui, 4 of Ant Design.
  final double trackHeight;

  /// The width of the border around the track and around the part of it that
  /// is filled.
  final double trackBorderWidth;

  /// The width and the height of the thumb. `size-4` (16) of shadcn/ui, 14 of
  /// Ant Design.
  final double thumbSize;

  /// The width of the border around the thumb.
  final double thumbBorderWidth;

  const ImpaktfullUiSliderDimensTheme({
    required this.trackBorderRadius,
    required this.thumbBorderRadius,
    this.height = 48,
    this.legendHeight = 24,
    this.trackHeight = 4,
    this.trackBorderWidth = 1,
    this.thumbSize = 16,
    this.thumbBorderWidth = 1,
  });

  ImpaktfullUiSliderDimensTheme copyWith({
    double? height,
    double? legendHeight,
    BorderRadiusGeometry? thumbBorderRadius,
    double? thumbBorderWidth,
    double? thumbSize,
    BorderRadiusGeometry? trackBorderRadius,
    double? trackBorderWidth,
    double? trackHeight,
  }) =>
      ImpaktfullUiSliderDimensTheme(
        height: height ?? this.height,
        legendHeight: legendHeight ?? this.legendHeight,
        thumbBorderRadius: thumbBorderRadius ?? this.thumbBorderRadius,
        thumbBorderWidth: thumbBorderWidth ?? this.thumbBorderWidth,
        thumbSize: thumbSize ?? this.thumbSize,
        trackBorderRadius: trackBorderRadius ?? this.trackBorderRadius,
        trackBorderWidth: trackBorderWidth ?? this.trackBorderWidth,
        trackHeight: trackHeight ?? this.trackHeight,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSliderDimensTheme &&
          trackBorderRadius == other.trackBorderRadius &&
          thumbBorderRadius == other.thumbBorderRadius &&
          height == other.height &&
          legendHeight == other.legendHeight &&
          trackHeight == other.trackHeight &&
          trackBorderWidth == other.trackBorderWidth &&
          thumbSize == other.thumbSize &&
          thumbBorderWidth == other.thumbBorderWidth;

  @override
  int get hashCode => Object.hash(
        trackBorderRadius,
        thumbBorderRadius,
        height,
        legendHeight,
        trackHeight,
        trackBorderWidth,
        thumbSize,
        thumbBorderWidth,
      );
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
