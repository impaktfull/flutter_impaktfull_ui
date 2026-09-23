import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiSkeletonTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSkeletonAssetsTheme assets;
  final ImpaktfullUiSkeletonColorTheme colors;
  final ImpaktfullUiSkeletonDimensTheme dimens;
  final ImpaktfullUiSkeletonDurationsTheme durations;
  final ImpaktfullUiSkeletonTextStyleTheme textStyles;

  const ImpaktfullUiSkeletonTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    this.durations = const ImpaktfullUiSkeletonDurationsTheme(),
    required this.textStyles,
  });

  ImpaktfullUiSkeletonTheme copyWith({
    ImpaktfullUiSkeletonAssetsTheme? assets,
    ImpaktfullUiSkeletonColorTheme? colors,
    ImpaktfullUiSkeletonDimensTheme? dimens,
    ImpaktfullUiSkeletonDurationsTheme? durations,
    ImpaktfullUiSkeletonTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiSkeletonTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiSkeletonTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.skeleton;

  static ImpaktfullUiSkeletonTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiSkeletonTheme(
        assets: const ImpaktfullUiSkeletonAssetsTheme(),
        colors: ImpaktfullUiSkeletonColorTheme(
          background: colors.card2,
          highlight: colors.card,
        ),
        dimens: ImpaktfullUiSkeletonDimensTheme(
          borderRadius: dimens.borderRadius,
        ),
        durations: const ImpaktfullUiSkeletonDurationsTheme(),
        textStyles: const ImpaktfullUiSkeletonTextStyleTheme(),
      );
}

class ImpaktfullUiSkeletonAssetsTheme {
  const ImpaktfullUiSkeletonAssetsTheme();

  ImpaktfullUiSkeletonAssetsTheme copyWith() =>
      const ImpaktfullUiSkeletonAssetsTheme();
}

class ImpaktfullUiSkeletonColorTheme {
  final Color background;

  /// The colour that sweeps over the [background] as the shimmer.
  ///
  /// Optional so a hand written theme from before it existed keeps compiling;
  /// it becomes `required` in 1.0.0.
  final Color highlight;

  const ImpaktfullUiSkeletonColorTheme({
    required this.background,
    this.highlight = const Color(0xFFFFFFFF),
  });

  ImpaktfullUiSkeletonColorTheme copyWith({
    Color? background,
    Color? highlight,
  }) =>
      ImpaktfullUiSkeletonColorTheme(
        background: background ?? this.background,
        highlight: highlight ?? this.highlight,
      );
}

class ImpaktfullUiSkeletonDimensTheme {
  final BorderRadiusGeometry borderRadius;
  const ImpaktfullUiSkeletonDimensTheme({
    required this.borderRadius,
  });

  ImpaktfullUiSkeletonDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
  }) =>
      ImpaktfullUiSkeletonDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
      );
}

class ImpaktfullUiSkeletonDurationsTheme {
  /// How long one sweep of the shimmer over the skeleton takes.
  final Duration shimmer;

  const ImpaktfullUiSkeletonDurationsTheme({
    this.shimmer = const Duration(milliseconds: 1500),
  });

  ImpaktfullUiSkeletonDurationsTheme copyWith({
    Duration? shimmer,
  }) =>
      ImpaktfullUiSkeletonDurationsTheme(
        shimmer: shimmer ?? this.shimmer,
      );
}

class ImpaktfullUiSkeletonTextStyleTheme {
  const ImpaktfullUiSkeletonTextStyleTheme();

  ImpaktfullUiSkeletonTextStyleTheme copyWith() =>
      const ImpaktfullUiSkeletonTextStyleTheme();
}
