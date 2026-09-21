import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiCarouselTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiCarouselAssetsTheme assets;
  final ImpaktfullUiCarouselColorTheme colors;
  final ImpaktfullUiCarouselDimensTheme dimens;
  final ImpaktfullUiCarouselTextStyleTheme textStyles;

  const ImpaktfullUiCarouselTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

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
        textStyles: const ImpaktfullUiCarouselTextStyleTheme(),
      );
}

class ImpaktfullUiCarouselAssetsTheme {
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
}

class ImpaktfullUiCarouselTextStyleTheme {
  const ImpaktfullUiCarouselTextStyleTheme();
}
