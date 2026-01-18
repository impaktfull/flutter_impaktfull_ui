import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiTabBarTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiTabBarAssetsTheme assets;
  final ImpaktfullUiTabBarColorTheme colors;
  final ImpaktfullUiTabBarDimensTheme dimens;
  final ImpaktfullUiTabBarTextStyleTheme textStyles;

  const ImpaktfullUiTabBarTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiTabBarTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.tabBar;

  static ImpaktfullUiTabBarTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      const ImpaktfullUiTabBarTheme(
        assets: ImpaktfullUiTabBarAssetsTheme(),
        colors: ImpaktfullUiTabBarColorTheme(),
        dimens: ImpaktfullUiTabBarDimensTheme(),
        textStyles: ImpaktfullUiTabBarTextStyleTheme(),
      );
}

class ImpaktfullUiTabBarAssetsTheme {
  const ImpaktfullUiTabBarAssetsTheme();
}

class ImpaktfullUiTabBarColorTheme {
  const ImpaktfullUiTabBarColorTheme();
}

class ImpaktfullUiTabBarDimensTheme {
  const ImpaktfullUiTabBarDimensTheme();
}

class ImpaktfullUiTabBarTextStyleTheme {
  const ImpaktfullUiTabBarTextStyleTheme();
}
