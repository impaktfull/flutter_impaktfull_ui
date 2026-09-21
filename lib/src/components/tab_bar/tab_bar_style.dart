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

  ImpaktfullUiTabBarTheme copyWith({
    ImpaktfullUiTabBarAssetsTheme? assets,
    ImpaktfullUiTabBarColorTheme? colors,
    ImpaktfullUiTabBarDimensTheme? dimens,
    ImpaktfullUiTabBarTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiTabBarTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

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

  ImpaktfullUiTabBarAssetsTheme copyWith() =>
      const ImpaktfullUiTabBarAssetsTheme();
}

class ImpaktfullUiTabBarColorTheme {
  const ImpaktfullUiTabBarColorTheme();

  ImpaktfullUiTabBarColorTheme copyWith() =>
      const ImpaktfullUiTabBarColorTheme();
}

class ImpaktfullUiTabBarDimensTheme {
  const ImpaktfullUiTabBarDimensTheme();

  ImpaktfullUiTabBarDimensTheme copyWith() =>
      const ImpaktfullUiTabBarDimensTheme();
}

class ImpaktfullUiTabBarTextStyleTheme {
  const ImpaktfullUiTabBarTextStyleTheme();

  ImpaktfullUiTabBarTextStyleTheme copyWith() =>
      const ImpaktfullUiTabBarTextStyleTheme();
}
