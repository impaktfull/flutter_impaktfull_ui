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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTabBarTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiTabBarAssetsTheme {
  const ImpaktfullUiTabBarAssetsTheme();

  ImpaktfullUiTabBarAssetsTheme copyWith() =>
      const ImpaktfullUiTabBarAssetsTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiTabBarAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiTabBarColorTheme {
  const ImpaktfullUiTabBarColorTheme();

  ImpaktfullUiTabBarColorTheme copyWith() =>
      const ImpaktfullUiTabBarColorTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiTabBarColorTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiTabBarDimensTheme {
  const ImpaktfullUiTabBarDimensTheme();

  ImpaktfullUiTabBarDimensTheme copyWith() =>
      const ImpaktfullUiTabBarDimensTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiTabBarDimensTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiTabBarTextStyleTheme {
  const ImpaktfullUiTabBarTextStyleTheme();

  ImpaktfullUiTabBarTextStyleTheme copyWith() =>
      const ImpaktfullUiTabBarTextStyleTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiTabBarTextStyleTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}
