import 'package:flutter/foundation.dart';
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiBottomNavigationTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles &&
          shadows == other.shadows;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles, shadows);
}

class ImpaktfullUiBottomNavigationAssetsTheme {
  const ImpaktfullUiBottomNavigationAssetsTheme();

  ImpaktfullUiBottomNavigationAssetsTheme copyWith() =>
      const ImpaktfullUiBottomNavigationAssetsTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiBottomNavigationAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiBottomNavigationColorTheme &&
          background == other.background;

  @override
  int get hashCode => background.hashCode;
}

class ImpaktfullUiBottomNavigationDimensTheme {
  const ImpaktfullUiBottomNavigationDimensTheme();

  ImpaktfullUiBottomNavigationDimensTheme copyWith() =>
      const ImpaktfullUiBottomNavigationDimensTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiBottomNavigationDimensTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiBottomNavigationTextStyleTheme {
  const ImpaktfullUiBottomNavigationTextStyleTheme();

  ImpaktfullUiBottomNavigationTextStyleTheme copyWith() =>
      const ImpaktfullUiBottomNavigationTextStyleTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiBottomNavigationTextStyleTheme;

  @override
  int get hashCode => runtimeType.hashCode;
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiBottomNavigationShadowsTheme &&
          listEquals(background, other.background);

  @override
  int get hashCode => Object.hashAll(background ?? const []);
}
