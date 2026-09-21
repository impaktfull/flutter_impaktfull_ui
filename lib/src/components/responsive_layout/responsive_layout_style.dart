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

  ImpaktfullUiResponsiveLayoutTheme copyWith({
    ImpaktfullUiResponsiveLayoutAssetsTheme? assets,
    ImpaktfullUiResponsiveLayoutColorTheme? colors,
    ImpaktfullUiResponsiveLayoutDimensTheme? dimens,
    ImpaktfullUiResponsiveLayoutTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiResponsiveLayoutTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

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

  ImpaktfullUiResponsiveLayoutAssetsTheme copyWith() =>
      const ImpaktfullUiResponsiveLayoutAssetsTheme();
}

class ImpaktfullUiResponsiveLayoutColorTheme {
  const ImpaktfullUiResponsiveLayoutColorTheme();

  ImpaktfullUiResponsiveLayoutColorTheme copyWith() =>
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

  ImpaktfullUiResponsiveLayoutDimensTheme copyWith({
    double? breakpointExtraLarge,
    double? breakpointLarge,
    double? breakpointMedium,
    double? breakpointSmall,
  }) =>
      ImpaktfullUiResponsiveLayoutDimensTheme(
        breakpointExtraLarge: breakpointExtraLarge ?? this.breakpointExtraLarge,
        breakpointLarge: breakpointLarge ?? this.breakpointLarge,
        breakpointMedium: breakpointMedium ?? this.breakpointMedium,
        breakpointSmall: breakpointSmall ?? this.breakpointSmall,
      );
}

class ImpaktfullUiResponsiveLayoutTextStyleTheme {
  const ImpaktfullUiResponsiveLayoutTextStyleTheme();

  ImpaktfullUiResponsiveLayoutTextStyleTheme copyWith() =>
      const ImpaktfullUiResponsiveLayoutTextStyleTheme();
}
