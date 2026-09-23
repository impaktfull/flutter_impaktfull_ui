import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiCarouselTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiCarouselAssetsTheme assets;
  final ImpaktfullUiCarouselColorTheme colors;
  final ImpaktfullUiCarouselDimensTheme dimens;
  final ImpaktfullUiCarouselDurationsTheme durations;
  final ImpaktfullUiCarouselTextStyleTheme textStyles;

  const ImpaktfullUiCarouselTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    this.durations = const ImpaktfullUiCarouselDurationsTheme(),
    required this.textStyles,
  });

  ImpaktfullUiCarouselTheme copyWith({
    ImpaktfullUiCarouselAssetsTheme? assets,
    ImpaktfullUiCarouselColorTheme? colors,
    ImpaktfullUiCarouselDimensTheme? dimens,
    ImpaktfullUiCarouselDurationsTheme? durations,
    ImpaktfullUiCarouselTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiCarouselTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiCarouselTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.carousel;

  static ImpaktfullUiCarouselTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiCarouselTheme(
        assets: const ImpaktfullUiCarouselAssetsTheme(),
        colors: ImpaktfullUiCarouselColorTheme(
          indicatorBorder: colors.border,
          activeIndicator: colors.accent,
          inactiveIndicator: colors.card,
        ),
        dimens: ImpaktfullUiCarouselDimensTheme(
          indicatorBorderRadius: dimens.borderRadiusCircle,
          indicatorPadding: EdgeInsets.zero,
          indicatorSize: 8,
          indicatorSpacing: const EdgeInsets.symmetric(horizontal: 4),
        ),
        durations: const ImpaktfullUiCarouselDurationsTheme(),
        textStyles: const ImpaktfullUiCarouselTextStyleTheme(),
      );
}

class ImpaktfullUiCarouselAssetsTheme {
  const ImpaktfullUiCarouselAssetsTheme();

  ImpaktfullUiCarouselAssetsTheme copyWith() =>
      const ImpaktfullUiCarouselAssetsTheme();
}

class ImpaktfullUiCarouselColorTheme {
  final Color activeIndicator;
  final Color inactiveIndicator;
  final Color indicatorBorder;

  const ImpaktfullUiCarouselColorTheme({
    required this.activeIndicator,
    required this.inactiveIndicator,
    required this.indicatorBorder,
  });

  ImpaktfullUiCarouselColorTheme copyWith({
    Color? activeIndicator,
    Color? inactiveIndicator,
    Color? indicatorBorder,
  }) =>
      ImpaktfullUiCarouselColorTheme(
        activeIndicator: activeIndicator ?? this.activeIndicator,
        inactiveIndicator: inactiveIndicator ?? this.inactiveIndicator,
        indicatorBorder: indicatorBorder ?? this.indicatorBorder,
      );
}

class ImpaktfullUiCarouselDimensTheme {
  final BorderRadiusGeometry indicatorBorderRadius;
  final EdgeInsetsGeometry indicatorPadding;
  final double indicatorSize;
  final EdgeInsetsGeometry indicatorSpacing;

  const ImpaktfullUiCarouselDimensTheme({
    required this.indicatorBorderRadius,
    required this.indicatorPadding,
    required this.indicatorSize,
    required this.indicatorSpacing,
  });

  ImpaktfullUiCarouselDimensTheme copyWith({
    BorderRadiusGeometry? indicatorBorderRadius,
    EdgeInsetsGeometry? indicatorPadding,
    double? indicatorSize,
    EdgeInsetsGeometry? indicatorSpacing,
  }) =>
      ImpaktfullUiCarouselDimensTheme(
        indicatorBorderRadius:
            indicatorBorderRadius ?? this.indicatorBorderRadius,
        indicatorPadding: indicatorPadding ?? this.indicatorPadding,
        indicatorSize: indicatorSize ?? this.indicatorSize,
        indicatorSpacing: indicatorSpacing ?? this.indicatorSpacing,
      );
}

class ImpaktfullUiCarouselDurationsTheme {
  /// How long the carousel takes to slide to another item.
  final Duration pageTransition;

  const ImpaktfullUiCarouselDurationsTheme({
    this.pageTransition = const Duration(milliseconds: 300),
  });

  ImpaktfullUiCarouselDurationsTheme copyWith({
    Duration? pageTransition,
  }) =>
      ImpaktfullUiCarouselDurationsTheme(
        pageTransition: pageTransition ?? this.pageTransition,
      );
}

class ImpaktfullUiCarouselTextStyleTheme {
  const ImpaktfullUiCarouselTextStyleTheme();

  ImpaktfullUiCarouselTextStyleTheme copyWith() =>
      const ImpaktfullUiCarouselTextStyleTheme();
}
