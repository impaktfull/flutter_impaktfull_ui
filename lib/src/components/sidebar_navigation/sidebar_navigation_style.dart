import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiSidebarNavigationTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSidebarNavigationAssetsTheme assets;
  final ImpaktfullUiSidebarNavigationColorTheme colors;
  final ImpaktfullUiSidebarNavigationDimensTheme dimens;
  final ImpaktfullUiSidebarNavigationTextStyleTheme textStyles;

  const ImpaktfullUiSidebarNavigationTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiSidebarNavigationTheme copyWith({
    ImpaktfullUiSidebarNavigationAssetsTheme? assets,
    ImpaktfullUiSidebarNavigationColorTheme? colors,
    ImpaktfullUiSidebarNavigationDimensTheme? dimens,
    ImpaktfullUiSidebarNavigationTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiSidebarNavigationTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiSidebarNavigationTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.sidebarNavigation;

  static ImpaktfullUiSidebarNavigationTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiSidebarNavigationTheme(
        assets: const ImpaktfullUiSidebarNavigationAssetsTheme(),
        colors: ImpaktfullUiSidebarNavigationColorTheme(
          backgroundColor: colors.card,
          border: colors.border,
        ),
        dimens: const ImpaktfullUiSidebarNavigationDimensTheme(
          padding: EdgeInsetsDirectional.all(16),
        ),
        textStyles: const ImpaktfullUiSidebarNavigationTextStyleTheme(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSidebarNavigationTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiSidebarNavigationAssetsTheme {
  const ImpaktfullUiSidebarNavigationAssetsTheme();

  ImpaktfullUiSidebarNavigationAssetsTheme copyWith() =>
      const ImpaktfullUiSidebarNavigationAssetsTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiSidebarNavigationAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiSidebarNavigationColorTheme {
  final Color backgroundColor;
  final Color border;

  const ImpaktfullUiSidebarNavigationColorTheme({
    required this.backgroundColor,
    required this.border,
  });

  ImpaktfullUiSidebarNavigationColorTheme copyWith({
    Color? backgroundColor,
    Color? border,
  }) =>
      ImpaktfullUiSidebarNavigationColorTheme(
        backgroundColor: backgroundColor ?? this.backgroundColor,
        border: border ?? this.border,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSidebarNavigationColorTheme &&
          backgroundColor == other.backgroundColor &&
          border == other.border;

  @override
  int get hashCode => Object.hash(backgroundColor, border);
}

class ImpaktfullUiSidebarNavigationDimensTheme {
  final EdgeInsetsGeometry padding;

  /// The width of the secondary column with `secondaryItems`.
  final double secondaryWidth;

  /// The maximum size of the asset (the logo) in the header.
  final BoxConstraints assetConstraints;

  const ImpaktfullUiSidebarNavigationDimensTheme({
    required this.padding,
    this.secondaryWidth = 300,
    this.assetConstraints = const BoxConstraints(maxWidth: 150, maxHeight: 40),
  });

  ImpaktfullUiSidebarNavigationDimensTheme copyWith({
    BoxConstraints? assetConstraints,
    EdgeInsetsGeometry? padding,
    double? secondaryWidth,
  }) =>
      ImpaktfullUiSidebarNavigationDimensTheme(
        assetConstraints: assetConstraints ?? this.assetConstraints,
        padding: padding ?? this.padding,
        secondaryWidth: secondaryWidth ?? this.secondaryWidth,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSidebarNavigationDimensTheme &&
          padding == other.padding &&
          secondaryWidth == other.secondaryWidth &&
          assetConstraints == other.assetConstraints;

  @override
  int get hashCode => Object.hash(padding, secondaryWidth, assetConstraints);
}

class ImpaktfullUiSidebarNavigationTextStyleTheme {
  const ImpaktfullUiSidebarNavigationTextStyleTheme();

  ImpaktfullUiSidebarNavigationTextStyleTheme copyWith() =>
      const ImpaktfullUiSidebarNavigationTextStyleTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiSidebarNavigationTextStyleTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}
