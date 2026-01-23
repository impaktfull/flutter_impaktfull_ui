import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiResponsiveLayoutTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiResponsiveLayoutAssetsTheme assets;
  final ImpaktfullUiResponsiveLayoutColorTheme colors;
  final ImpaktfullUiResponsiveLayoutDimensTheme dimens;
  final ImpaktfullUiResponsiveLayoutTextStyleTheme textStyles;

  const ImpaktfullUiResponsiveLayoutTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiResponsiveLayoutTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.responsiveLayout;

  static ImpaktfullUiResponsiveLayoutTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      const ImpaktfullUiResponsiveLayoutTheme(
        assets: ImpaktfullUiResponsiveLayoutAssetsTheme(),
        colors: ImpaktfullUiResponsiveLayoutColorTheme(),
        dimens: ImpaktfullUiResponsiveLayoutDimensTheme(
          breakpointSmall: 600,
          breakpointMedium: 1024,
          breakpointLarge: 1440,
          breakpointExtraLarge: 1920,
        ),
        textStyles: ImpaktfullUiResponsiveLayoutTextStyleTheme(),
      );
}

class ImpaktfullUiResponsiveLayoutAssetsTheme {
  const ImpaktfullUiResponsiveLayoutAssetsTheme();
}

class ImpaktfullUiResponsiveLayoutColorTheme {
  const ImpaktfullUiResponsiveLayoutColorTheme();
}

class ImpaktfullUiResponsiveLayoutDimensTheme {
  final double breakpointSmall;
  final double breakpointMedium;
  final double breakpointLarge;
  final double breakpointExtraLarge;
  const ImpaktfullUiResponsiveLayoutDimensTheme({
    required this.breakpointSmall,
    required this.breakpointMedium,
    required this.breakpointLarge,
    required this.breakpointExtraLarge,
  });
}

class ImpaktfullUiResponsiveLayoutTextStyleTheme {
  const ImpaktfullUiResponsiveLayoutTextStyleTheme();
}
