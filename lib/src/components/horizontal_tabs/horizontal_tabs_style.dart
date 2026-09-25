import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiHorizontalTabsTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiHorizontalTabsColorTheme colors;
  final ImpaktfullUiHorizontalTabsDimensTheme dimens;

  const ImpaktfullUiHorizontalTabsTheme({
    required this.colors,
    required this.dimens,
  });

  ImpaktfullUiHorizontalTabsTheme copyWith({
    ImpaktfullUiHorizontalTabsColorTheme? colors,
    ImpaktfullUiHorizontalTabsDimensTheme? dimens,
  }) =>
      ImpaktfullUiHorizontalTabsTheme(
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
      );

  static ImpaktfullUiHorizontalTabsTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.horizontalTabs;

  static ImpaktfullUiHorizontalTabsTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      const ImpaktfullUiHorizontalTabsTheme(
        colors: ImpaktfullUiHorizontalTabsColorTheme(),
        dimens: ImpaktfullUiHorizontalTabsDimensTheme(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiHorizontalTabsTheme &&
          colors == other.colors &&
          dimens == other.dimens;

  @override
  int get hashCode => Object.hash(colors, dimens);
}

class ImpaktfullUiHorizontalTabsColorTheme {
  /// The background behind the row of tabs (shadcn/ui's muted tab list).
  /// `null` (the default) draws none: the tabs paint their own background.
  final Color? background;

  const ImpaktfullUiHorizontalTabsColorTheme({
    this.background,
  });

  ImpaktfullUiHorizontalTabsColorTheme copyWith({
    Color? background,
  }) =>
      ImpaktfullUiHorizontalTabsColorTheme(
        background: background ?? this.background,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiHorizontalTabsColorTheme &&
          background == other.background;

  @override
  int get hashCode => background.hashCode;
}

class ImpaktfullUiHorizontalTabsDimensTheme {
  /// The space inside the row, between its edge and the first and the last
  /// tab. It sits inside [ImpaktfullUiHorizontalTabsColorTheme.background],
  /// like the `p-[3px]` of a shadcn/ui `TabsList`.
  final EdgeInsets padding;

  /// The space around the row, outside its background.
  ///
  /// `EdgeInsets.zero` (the default) lets the row run from edge to edge,
  /// which is what it always did. A design system whose tabs are a track
  /// instead of a full width bar (a shadcn/ui `TabsList` is `w-fit`) keeps
  /// the track off the edge of the screen with a margin, so that the space at
  /// the sides is not painted in the colour of the track.
  final EdgeInsets margin;

  /// The height of the row of tabs.
  final double height;

  /// The space between two tabs.
  final double spacing;

  /// The radius of [ImpaktfullUiHorizontalTabsColorTheme.background].
  ///
  /// `null` (the default) draws the background with square corners, as
  /// before. A shadcn/ui `TabsList` is `rounded-lg`.
  final BorderRadiusGeometry? borderRadius;

  const ImpaktfullUiHorizontalTabsDimensTheme({
    required this.padding,
    this.margin = EdgeInsets.zero,
    this.height = 48,
    this.spacing = 8,
    this.borderRadius,
  });

  ImpaktfullUiHorizontalTabsDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    double? height,
    EdgeInsets? margin,
    EdgeInsets? padding,
    double? spacing,
  }) =>
      ImpaktfullUiHorizontalTabsDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        height: height ?? this.height,
        margin: margin ?? this.margin,
        padding: padding ?? this.padding,
        spacing: spacing ?? this.spacing,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiHorizontalTabsDimensTheme &&
          padding == other.padding &&
          margin == other.margin &&
          height == other.height &&
          spacing == other.spacing &&
          borderRadius == other.borderRadius;

  @override
  int get hashCode =>
      Object.hash(padding, margin, height, spacing, borderRadius);
}
