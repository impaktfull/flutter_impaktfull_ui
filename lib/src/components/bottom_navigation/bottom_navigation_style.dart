import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

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
}

class ImpaktfullUiBottomNavigationColorTheme {
  final Color background;

  const ImpaktfullUiBottomNavigationColorTheme({
    required this.background,
  });
}

class ImpaktfullUiBottomNavigationDimensTheme {
  const ImpaktfullUiBottomNavigationDimensTheme();
}

class ImpaktfullUiBottomNavigationTextStyleTheme {
  const ImpaktfullUiBottomNavigationTextStyleTheme();
}

class ImpaktfullUiBottomNavigationShadowsTheme {
  final List<BoxShadow>? background;

  const ImpaktfullUiBottomNavigationShadowsTheme({
    required this.background,
  });
}
