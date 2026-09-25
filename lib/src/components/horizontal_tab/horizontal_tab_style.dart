import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/color_extensions.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiHorizontalTabTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiHorizontalTabColorTheme colors;
  final ImpaktfullUiHorizontalTabTextStyleTheme textStyles;
  final ImpaktfullUiHorizontalTabDimensTheme dimens;

  const ImpaktfullUiHorizontalTabTheme({
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiHorizontalTabTheme copyWith({
    ImpaktfullUiHorizontalTabColorTheme? colors,
    ImpaktfullUiHorizontalTabDimensTheme? dimens,
    ImpaktfullUiHorizontalTabTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiHorizontalTabTheme(
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiHorizontalTabTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.horizontalTab;

  static ImpaktfullUiHorizontalTabTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiHorizontalTabTheme(
        colors: ImpaktfullUiHorizontalTabColorTheme(
          backgroundUnSelectedTab: colors.card,
          backgroundSelectedTab: colors.accent.withOpacityPercentage(0.33),
        ),
        dimens: ImpaktfullUiHorizontalTabDimensTheme(
          borderRadius: dimens.borderRadius,
        ),
        textStyles: ImpaktfullUiHorizontalTabTextStyleTheme(
          selected: textStyles.onCardAccent.text.small.semiBold,
          unselected: textStyles.onCard.text.small.semiBold,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiHorizontalTabTheme &&
          colors == other.colors &&
          textStyles == other.textStyles &&
          dimens == other.dimens;

  @override
  int get hashCode => Object.hash(colors, textStyles, dimens);
}

class ImpaktfullUiHorizontalTabColorTheme {
  final Color backgroundUnSelectedTab;
  final Color backgroundSelectedTab;

  /// The background of a tab while the pointer is over it.
  ///
  /// `null` (the default) leaves it to the overlay of
  /// `ImpaktfullUiTouchFeedbackTheme`, which is what the tab always did.
  /// `Colors.transparent` shows none at all: a tab of Ant Design only changes
  /// the colour of its title on hover ([ImpaktfullUiHorizontalTabTextStyleTheme.hovered]).
  final Color? backgroundHoveredTab;

  /// The bar under the selected tab (the "ink bar" of Ant Design).
  ///
  /// `null` (the default) draws none: the tab is marked by its background and
  /// its text style, which is what it always did and what a shadcn/ui
  /// `TabsTrigger` does. Ant Design draws a `colorPrimary` bar under the
  /// active tab and keeps its background transparent.
  final Color? selectedMarker;

  const ImpaktfullUiHorizontalTabColorTheme({
    required this.backgroundUnSelectedTab,
    required this.backgroundSelectedTab,
    this.backgroundHoveredTab,
    this.selectedMarker,
  });

  ImpaktfullUiHorizontalTabColorTheme copyWith({
    Color? backgroundHoveredTab,
    Color? backgroundSelectedTab,
    Color? backgroundUnSelectedTab,
    Color? selectedMarker,
  }) =>
      ImpaktfullUiHorizontalTabColorTheme(
        backgroundHoveredTab: backgroundHoveredTab ?? this.backgroundHoveredTab,
        backgroundSelectedTab:
            backgroundSelectedTab ?? this.backgroundSelectedTab,
        backgroundUnSelectedTab:
            backgroundUnSelectedTab ?? this.backgroundUnSelectedTab,
        selectedMarker: selectedMarker ?? this.selectedMarker,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiHorizontalTabColorTheme &&
          backgroundUnSelectedTab == other.backgroundUnSelectedTab &&
          backgroundSelectedTab == other.backgroundSelectedTab &&
          backgroundHoveredTab == other.backgroundHoveredTab &&
          selectedMarker == other.selectedMarker;

  @override
  int get hashCode => Object.hash(
        backgroundUnSelectedTab,
        backgroundSelectedTab,
        backgroundHoveredTab,
        selectedMarker,
      );
}

class ImpaktfullUiHorizontalTabTextStyleTheme {
  final TextStyle selected;
  final TextStyle unselected;

  /// The title of a tab that is not selected while the pointer is over it.
  ///
  /// `null` (the default) keeps [unselected], which is what the tab always
  /// did. A tab of Ant Design turns its title `colorPrimaryHover` and changes
  /// nothing else, so a theme that sets this one usually sets
  /// [ImpaktfullUiHorizontalTabColorTheme.backgroundHoveredTab] to
  /// `Colors.transparent` with it. The selected tab keeps [selected]: its
  /// colour already says that it is the one.
  final TextStyle? hovered;

  const ImpaktfullUiHorizontalTabTextStyleTheme({
    required this.selected,
    required this.unselected,
    this.hovered,
  });

  ImpaktfullUiHorizontalTabTextStyleTheme copyWith({
    TextStyle? hovered,
    TextStyle? selected,
    TextStyle? unselected,
  }) =>
      ImpaktfullUiHorizontalTabTextStyleTheme(
        hovered: hovered ?? this.hovered,
        selected: selected ?? this.selected,
        unselected: unselected ?? this.unselected,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiHorizontalTabTextStyleTheme &&
          selected == other.selected &&
          unselected == other.unselected &&
          hovered == other.hovered;

  @override
  int get hashCode => Object.hash(selected, unselected, hovered);
}

class ImpaktfullUiHorizontalTabDimensTheme {
  final BorderRadiusGeometry borderRadius;

  /// The padding around the title of the tab.
  final EdgeInsetsGeometry padding;

  /// The space between the title of the tab and its badge.
  final double badgeSpacing;

  /// The height of the bar under the selected tab, drawn when
  /// [ImpaktfullUiHorizontalTabColorTheme.selectedMarker] is set. Ant Design
  /// draws it 2 high.
  final double selectedMarkerHeight;

  /// The width of that bar. `null` (the default) runs it under the whole tab,
  /// like the ink bar of Ant Design.
  final double? selectedMarkerWidth;

  /// The radius of that bar. `null` (the default) draws it square.
  final BorderRadiusGeometry? selectedMarkerBorderRadius;

  const ImpaktfullUiHorizontalTabDimensTheme({
    required this.borderRadius,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.badgeSpacing = 8,
    this.selectedMarkerHeight = 2,
    this.selectedMarkerWidth,
    this.selectedMarkerBorderRadius,
  });

  ImpaktfullUiHorizontalTabDimensTheme copyWith({
    double? badgeSpacing,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? selectedMarkerBorderRadius,
    double? selectedMarkerHeight,
    double? selectedMarkerWidth,
  }) =>
      ImpaktfullUiHorizontalTabDimensTheme(
        badgeSpacing: badgeSpacing ?? this.badgeSpacing,
        borderRadius: borderRadius ?? this.borderRadius,
        padding: padding ?? this.padding,
        selectedMarkerBorderRadius:
            selectedMarkerBorderRadius ?? this.selectedMarkerBorderRadius,
        selectedMarkerHeight: selectedMarkerHeight ?? this.selectedMarkerHeight,
        selectedMarkerWidth: selectedMarkerWidth ?? this.selectedMarkerWidth,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiHorizontalTabDimensTheme &&
          borderRadius == other.borderRadius &&
          padding == other.padding &&
          badgeSpacing == other.badgeSpacing &&
          selectedMarkerHeight == other.selectedMarkerHeight &&
          selectedMarkerWidth == other.selectedMarkerWidth &&
          selectedMarkerBorderRadius == other.selectedMarkerBorderRadius;

  @override
  int get hashCode => Object.hash(
        borderRadius,
        padding,
        badgeSpacing,
        selectedMarkerHeight,
        selectedMarkerWidth,
        selectedMarkerBorderRadius,
      );
}
