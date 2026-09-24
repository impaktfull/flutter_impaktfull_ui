import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiTabBarItemTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiTabBarItemAssetsTheme assets;
  final ImpaktfullUiTabBarItemColorTheme colors;
  final ImpaktfullUiTabBarItemDimensTheme dimens;
  final ImpaktfullUiTabBarItemDurationsTheme durations;
  final ImpaktfullUiTabBarItemTextStyleTheme textStyles;

  const ImpaktfullUiTabBarItemTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.durations,
    required this.textStyles,
  });

  ImpaktfullUiTabBarItemTheme copyWith({
    ImpaktfullUiTabBarItemAssetsTheme? assets,
    ImpaktfullUiTabBarItemColorTheme? colors,
    ImpaktfullUiTabBarItemDimensTheme? dimens,
    ImpaktfullUiTabBarItemDurationsTheme? durations,
    ImpaktfullUiTabBarItemTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiTabBarItemTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiTabBarItemTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.tabBarItem;

  static ImpaktfullUiTabBarItemTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiTabBarItemTheme(
        assets: const ImpaktfullUiTabBarItemAssetsTheme(),
        colors: ImpaktfullUiTabBarItemColorTheme(
          background: colors.card,
        ),
        dimens: ImpaktfullUiTabBarItemDimensTheme(
          selectedMarkerBorderRadius: dimens.borderRadius,
        ),
        durations: ImpaktfullUiTabBarItemDurationsTheme(
          selected: durations.short,
        ),
        textStyles: ImpaktfullUiTabBarItemTextStyleTheme(
          label: textStyles.onCard.text.small.medium,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTabBarItemTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          durations == other.durations &&
          textStyles == other.textStyles;

  @override
  int get hashCode =>
      Object.hash(assets, colors, dimens, durations, textStyles);
}

class ImpaktfullUiTabBarItemAssetsTheme {
  const ImpaktfullUiTabBarItemAssetsTheme();

  ImpaktfullUiTabBarItemAssetsTheme copyWith() =>
      const ImpaktfullUiTabBarItemAssetsTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiTabBarItemAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiTabBarItemColorTheme {
  final Color background;

  /// The background of the selected item. `null` (the default) keeps
  /// [background], like before this token existed.
  ///
  /// shadcn/ui's selected tab is a card on a muted track, which is this
  /// token plus `ImpaktfullUiTabBarColorTheme.background`.
  final Color? selectedBackground;

  /// The colour of the marker under the selected item (Ant Design's
  /// `inkBarColor`). `null` (the default) uses the colour of the text style of
  /// the item, like before this token existed.
  final Color? selectedMarker;

  const ImpaktfullUiTabBarItemColorTheme({
    required this.background,
    this.selectedBackground,
    this.selectedMarker,
  });

  ImpaktfullUiTabBarItemColorTheme copyWith({
    Color? background,
    Color? selectedBackground,
    Color? selectedMarker,
  }) =>
      ImpaktfullUiTabBarItemColorTheme(
        background: background ?? this.background,
        selectedBackground: selectedBackground ?? this.selectedBackground,
        selectedMarker: selectedMarker ?? this.selectedMarker,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTabBarItemColorTheme &&
          background == other.background &&
          selectedBackground == other.selectedBackground &&
          selectedMarker == other.selectedMarker;

  @override
  int get hashCode =>
      Object.hash(background, selectedBackground, selectedMarker);
}

class ImpaktfullUiTabBarItemDimensTheme {
  final BorderRadiusGeometry selectedMarkerBorderRadius;

  /// The padding around the title of the item.
  final EdgeInsetsGeometry padding;

  /// The space between the title and the marker of the selected item.
  final double spacing;

  /// The height of the marker of the selected item (Ant Design's ink bar is
  /// 2 high).
  final double selectedMarkerHeight;

  /// The width of the marker of the selected item. `null` stretches it over
  /// the full width of the item, like an ink bar: the item then needs a
  /// bounded width, which `ImpaktfullUiTabBar` gives it.
  final double? selectedMarkerWidth;

  /// The border radius of the item, used when its background differs from the
  /// background of the bar. `null` (the default) draws square corners.
  final BorderRadiusGeometry? borderRadius;

  const ImpaktfullUiTabBarItemDimensTheme({
    required this.selectedMarkerBorderRadius,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.spacing = 4,
    this.selectedMarkerHeight = 4,
    this.selectedMarkerWidth = 4,
    this.borderRadius,
  });

  ImpaktfullUiTabBarItemDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? selectedMarkerBorderRadius,
    double? selectedMarkerHeight,
    double? selectedMarkerWidth,
    double? spacing,
  }) =>
      ImpaktfullUiTabBarItemDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        padding: padding ?? this.padding,
        selectedMarkerBorderRadius:
            selectedMarkerBorderRadius ?? this.selectedMarkerBorderRadius,
        selectedMarkerHeight: selectedMarkerHeight ?? this.selectedMarkerHeight,
        selectedMarkerWidth: selectedMarkerWidth ?? this.selectedMarkerWidth,
        spacing: spacing ?? this.spacing,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTabBarItemDimensTheme &&
          selectedMarkerBorderRadius == other.selectedMarkerBorderRadius &&
          padding == other.padding &&
          spacing == other.spacing &&
          selectedMarkerHeight == other.selectedMarkerHeight &&
          selectedMarkerWidth == other.selectedMarkerWidth &&
          borderRadius == other.borderRadius;

  @override
  int get hashCode => Object.hash(selectedMarkerBorderRadius, padding, spacing,
      selectedMarkerHeight, selectedMarkerWidth, borderRadius);
}

class ImpaktfullUiTabBarItemDurationsTheme {
  final Duration selected;
  const ImpaktfullUiTabBarItemDurationsTheme({
    required this.selected,
  });

  ImpaktfullUiTabBarItemDurationsTheme copyWith({
    Duration? selected,
  }) =>
      ImpaktfullUiTabBarItemDurationsTheme(
        selected: selected ?? this.selected,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTabBarItemDurationsTheme &&
          selected == other.selected;

  @override
  int get hashCode => selected.hashCode;
}

class ImpaktfullUiTabBarItemTextStyleTheme {
  final TextStyle label;

  /// The text style of the title of the selected item. `null` (the default)
  /// uses [label] for every item, like before this token existed.
  ///
  /// Both shadcn/ui and Ant Design give the selected tab another colour
  /// (`itemSelectedColor`).
  final TextStyle? selectedLabel;

  const ImpaktfullUiTabBarItemTextStyleTheme({
    required this.label,
    this.selectedLabel,
  });

  ImpaktfullUiTabBarItemTextStyleTheme copyWith({
    TextStyle? label,
    TextStyle? selectedLabel,
  }) =>
      ImpaktfullUiTabBarItemTextStyleTheme(
        label: label ?? this.label,
        selectedLabel: selectedLabel ?? this.selectedLabel,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTabBarItemTextStyleTheme &&
          label == other.label &&
          selectedLabel == other.selectedLabel;

  @override
  int get hashCode => Object.hash(label, selectedLabel);
}
