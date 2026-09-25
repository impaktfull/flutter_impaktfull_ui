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
  /// The background behind the items of the bar. `null` (the default) draws
  /// none: the items paint their own background
  /// (`ImpaktfullUiTabBarItemColorTheme.background`).
  ///
  /// A design system with a track behind its tabs (shadcn/ui's
  /// `bg-muted` list) sets it here.
  final Color? background;

  /// The colour of the line under the bar (Ant Design's `colorSplit`). `null`
  /// (the default) draws no line.
  final Color? divider;

  const ImpaktfullUiTabBarColorTheme({
    this.background,
    this.divider,
  });

  ImpaktfullUiTabBarColorTheme copyWith({
    Color? background,
    Color? divider,
  }) =>
      ImpaktfullUiTabBarColorTheme(
        background: background ?? this.background,
        divider: divider ?? this.divider,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTabBarColorTheme &&
          background == other.background &&
          divider == other.divider;

  @override
  int get hashCode => Object.hash(background, divider);
}

class ImpaktfullUiTabBarDimensTheme {
  /// The padding around the items of the bar.
  final EdgeInsetsGeometry padding;

  /// The height of the bar. `null` (the default) lets the height follow from
  /// the items.
  final double? height;

  /// The space between two items of the bar.
  final double spacing;

  /// The height of the line under the bar, drawn when
  /// [ImpaktfullUiTabBarColorTheme.divider] is set.
  final double dividerHeight;

  /// The border radius of the background and of the line under the bar, used
  /// when [ImpaktfullUiTabBarColorTheme.background] is set.
  final BorderRadiusGeometry? borderRadius;

  /// Whether every tab takes the same part of the width of the bar.
  ///
  /// True (the default) is what the bar always did, and what a shadcn/ui
  /// `TabsTrigger` does with its `flex-1`. False sizes a tab to its title and
  /// puts [spacing] between two of them, which is how the tabs of Ant Design
  /// are laid out.
  final bool expandItems;

  const ImpaktfullUiTabBarDimensTheme({
    this.padding = EdgeInsets.zero,
    this.height,
    this.spacing = 0,
    this.dividerHeight = 1,
    this.expandItems = true,
    this.borderRadius,
  });

  ImpaktfullUiTabBarDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    double? dividerHeight,
    bool? expandItems,
    double? height,
    EdgeInsetsGeometry? padding,
    double? spacing,
  }) =>
      ImpaktfullUiTabBarDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        expandItems: expandItems ?? this.expandItems,
        dividerHeight: dividerHeight ?? this.dividerHeight,
        height: height ?? this.height,
        padding: padding ?? this.padding,
        spacing: spacing ?? this.spacing,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTabBarDimensTheme &&
          expandItems == other.expandItems &&
          padding == other.padding &&
          height == other.height &&
          spacing == other.spacing &&
          dividerHeight == other.dividerHeight &&
          borderRadius == other.borderRadius;

  @override
  int get hashCode => Object.hash(
        padding,
        height,
        spacing,
        dividerHeight,
        borderRadius,
        expandItems,
      );
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
