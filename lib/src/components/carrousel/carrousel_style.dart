import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiCarrouselTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiCarrouselAssetsTheme assets;
  final ImpaktfullUiCarrouselColorTheme colors;
  final ImpaktfullUiCarrouselDimensTheme dimens;
  final ImpaktfullUiCarrouselTextStyleTheme textStyles;

  const ImpaktfullUiCarrouselTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiCarrouselTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.carrousel;
}

class ImpaktfullUiCarrouselAssetsTheme {
  const ImpaktfullUiCarrouselAssetsTheme();
}

class ImpaktfullUiCarrouselColorTheme {
  final Color activeIndicator;
  final Color inactiveIndicator;
  final Color indicatorBorder;

  const ImpaktfullUiCarrouselColorTheme({
    required this.activeIndicator,
    required this.inactiveIndicator,
    required this.indicatorBorder,
  });
}

class ImpaktfullUiCarrouselDimensTheme {
  final BorderRadiusGeometry indicatorBorderRadius;
  final EdgeInsetsGeometry indicatorPadding;
  final double indicatorSize;
  final EdgeInsetsGeometry indicatorSpacing;

  const ImpaktfullUiCarrouselDimensTheme({
    required this.indicatorBorderRadius,
    required this.indicatorPadding,
    required this.indicatorSize,
    required this.indicatorSpacing,
  });
}

class ImpaktfullUiCarrouselTextStyleTheme {
  const ImpaktfullUiCarrouselTextStyleTheme();
}
