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

  const ImpaktfullUiHorizontalTabColorTheme({
    required this.backgroundUnSelectedTab,
    required this.backgroundSelectedTab,
  });

  ImpaktfullUiHorizontalTabColorTheme copyWith({
    Color? backgroundSelectedTab,
    Color? backgroundUnSelectedTab,
  }) =>
      ImpaktfullUiHorizontalTabColorTheme(
        backgroundSelectedTab:
            backgroundSelectedTab ?? this.backgroundSelectedTab,
        backgroundUnSelectedTab:
            backgroundUnSelectedTab ?? this.backgroundUnSelectedTab,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiHorizontalTabColorTheme &&
          backgroundUnSelectedTab == other.backgroundUnSelectedTab &&
          backgroundSelectedTab == other.backgroundSelectedTab;

  @override
  int get hashCode =>
      Object.hash(backgroundUnSelectedTab, backgroundSelectedTab);
}

class ImpaktfullUiHorizontalTabTextStyleTheme {
  final TextStyle selected;
  final TextStyle unselected;

  const ImpaktfullUiHorizontalTabTextStyleTheme({
    required this.selected,
    required this.unselected,
  });

  ImpaktfullUiHorizontalTabTextStyleTheme copyWith({
    TextStyle? selected,
    TextStyle? unselected,
  }) =>
      ImpaktfullUiHorizontalTabTextStyleTheme(
        selected: selected ?? this.selected,
        unselected: unselected ?? this.unselected,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiHorizontalTabTextStyleTheme &&
          selected == other.selected &&
          unselected == other.unselected;

  @override
  int get hashCode => Object.hash(selected, unselected);
}

class ImpaktfullUiHorizontalTabDimensTheme {
  final BorderRadiusGeometry borderRadius;

  /// The padding around the title of the tab.
  final EdgeInsetsGeometry padding;

  /// The space between the title of the tab and its badge.
  final double badgeSpacing;

  const ImpaktfullUiHorizontalTabDimensTheme({
    required this.borderRadius,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.badgeSpacing = 8,
  });

  ImpaktfullUiHorizontalTabDimensTheme copyWith({
    double? badgeSpacing,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
  }) =>
      ImpaktfullUiHorizontalTabDimensTheme(
        badgeSpacing: badgeSpacing ?? this.badgeSpacing,
        borderRadius: borderRadius ?? this.borderRadius,
        padding: padding ?? this.padding,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiHorizontalTabDimensTheme &&
          borderRadius == other.borderRadius &&
          padding == other.padding &&
          badgeSpacing == other.badgeSpacing;

  @override
  int get hashCode => Object.hash(borderRadius, padding, badgeSpacing);
}
