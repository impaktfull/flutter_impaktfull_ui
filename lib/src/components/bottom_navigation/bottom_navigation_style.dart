import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiBottomNavigationTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiBottomNavigationAssetsTheme assets;
  final ImpaktfullUiBottomNavigationColorTheme colors;
  final ImpaktfullUiBottomNavigationDimensTheme dimens;
  final ImpaktfullUiBottomNavigationTextStyleTheme textStyles;
  final ImpaktfullUiBottomNavigationShadowsTheme shadows;

  const ImpaktfullUiBottomNavigationTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
    required this.shadows,
  });

  ImpaktfullUiBottomNavigationTheme copyWith({
    ImpaktfullUiBottomNavigationAssetsTheme? assets,
    ImpaktfullUiBottomNavigationColorTheme? colors,
    ImpaktfullUiBottomNavigationDimensTheme? dimens,
    ImpaktfullUiBottomNavigationShadowsTheme? shadows,
    ImpaktfullUiBottomNavigationTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiBottomNavigationTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        shadows: shadows ?? this.shadows,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiBottomNavigationTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.bottomNavigation;

  static ImpaktfullUiBottomNavigationTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiBottomNavigationTheme(
        assets: const ImpaktfullUiBottomNavigationAssetsTheme(),
        colors: ImpaktfullUiBottomNavigationColorTheme(
          background: colors.card,
        ),
        dimens: const ImpaktfullUiBottomNavigationDimensTheme(),
        textStyles: const ImpaktfullUiBottomNavigationTextStyleTheme(),
        shadows: ImpaktfullUiBottomNavigationShadowsTheme(
          background: shadows.medium,
        ),
      );
}

class ImpaktfullUiBottomNavigationAssetsTheme {
  const ImpaktfullUiBottomNavigationAssetsTheme();

  ImpaktfullUiBottomNavigationAssetsTheme copyWith() =>
      const ImpaktfullUiBottomNavigationAssetsTheme();
}

class ImpaktfullUiBottomNavigationColorTheme {
  final Color background;

  const ImpaktfullUiBottomNavigationColorTheme({
    required this.background,
  });

  ImpaktfullUiBottomNavigationColorTheme copyWith({
    Color? background,
  }) =>
      ImpaktfullUiBottomNavigationColorTheme(
        background: background ?? this.background,
      );
}

class ImpaktfullUiBottomNavigationDimensTheme {
  const ImpaktfullUiBottomNavigationDimensTheme();

  ImpaktfullUiBottomNavigationDimensTheme copyWith() =>
      const ImpaktfullUiBottomNavigationDimensTheme();
}

class ImpaktfullUiBottomNavigationTextStyleTheme {
  const ImpaktfullUiBottomNavigationTextStyleTheme();

  ImpaktfullUiBottomNavigationTextStyleTheme copyWith() =>
      const ImpaktfullUiBottomNavigationTextStyleTheme();
}

class ImpaktfullUiBottomNavigationShadowsTheme {
  final List<BoxShadow>? background;

  const ImpaktfullUiBottomNavigationShadowsTheme({
    required this.background,
  });

  ImpaktfullUiBottomNavigationShadowsTheme copyWith({
    List<BoxShadow>? background,
  }) =>
      ImpaktfullUiBottomNavigationShadowsTheme(
        background: background ?? this.background,
      );
}
