import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiBottomNavigationItemTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiBottomNavigationItemColorTheme colors;
  final ImpaktfullUiBottomNavigationItemTextStyleTheme textStyles;
  final ImpaktfullUiBottomNavigationItemDimensTheme dimens;
  final ImpaktfullUiBottomNavigationItemAssetsTheme assets;

  const ImpaktfullUiBottomNavigationItemTheme({
    required this.colors,
    required this.textStyles,
    required this.dimens,
    required this.assets,
  });

  ImpaktfullUiBottomNavigationItemTheme copyWith({
    ImpaktfullUiBottomNavigationItemAssetsTheme? assets,
    ImpaktfullUiBottomNavigationItemColorTheme? colors,
    ImpaktfullUiBottomNavigationItemDimensTheme? dimens,
    ImpaktfullUiBottomNavigationItemTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiBottomNavigationItemTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiBottomNavigationItemTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.bottomNavigationItem;

  static ImpaktfullUiBottomNavigationItemTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiBottomNavigationItemTheme(
        assets: const ImpaktfullUiBottomNavigationItemAssetsTheme(),
        colors: ImpaktfullUiBottomNavigationItemColorTheme(
          active: colors.accent,
          inactive: colors.tertiary,
          badgeActive: colors.tertiary,
          badgeInActive: colors.accent,
        ),
        dimens: const ImpaktfullUiBottomNavigationItemDimensTheme(),
        textStyles: ImpaktfullUiBottomNavigationItemTextStyleTheme(
          activeLabel: textStyles.onCardAccent.text.small.bold,
          inActiveLabel: textStyles.onCardTertiary.text.small.bold,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiBottomNavigationItemTheme &&
          colors == other.colors &&
          textStyles == other.textStyles &&
          dimens == other.dimens &&
          assets == other.assets;

  @override
  int get hashCode => Object.hash(colors, textStyles, dimens, assets);
}

class ImpaktfullUiBottomNavigationItemColorTheme {
  final Color active;
  final Color inactive;
  final Color? badgeActive;
  final Color? badgeInActive;

  const ImpaktfullUiBottomNavigationItemColorTheme({
    required this.active,
    required this.inactive,
    required this.badgeActive,
    required this.badgeInActive,
  });

  ImpaktfullUiBottomNavigationItemColorTheme copyWith({
    Color? active,
    Color? badgeActive,
    Color? badgeInActive,
    Color? inactive,
  }) =>
      ImpaktfullUiBottomNavigationItemColorTheme(
        active: active ?? this.active,
        badgeActive: badgeActive ?? this.badgeActive,
        badgeInActive: badgeInActive ?? this.badgeInActive,
        inactive: inactive ?? this.inactive,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiBottomNavigationItemColorTheme &&
          active == other.active &&
          inactive == other.inactive &&
          badgeActive == other.badgeActive &&
          badgeInActive == other.badgeInActive;

  @override
  int get hashCode => Object.hash(active, inactive, badgeActive, badgeInActive);
}

class ImpaktfullUiBottomNavigationItemTextStyleTheme {
  final TextStyle inActiveLabel;
  final TextStyle activeLabel;

  const ImpaktfullUiBottomNavigationItemTextStyleTheme({
    required this.activeLabel,
    required this.inActiveLabel,
  });

  ImpaktfullUiBottomNavigationItemTextStyleTheme copyWith({
    TextStyle? activeLabel,
    TextStyle? inActiveLabel,
  }) =>
      ImpaktfullUiBottomNavigationItemTextStyleTheme(
        activeLabel: activeLabel ?? this.activeLabel,
        inActiveLabel: inActiveLabel ?? this.inActiveLabel,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiBottomNavigationItemTextStyleTheme &&
          inActiveLabel == other.inActiveLabel &&
          activeLabel == other.activeLabel;

  @override
  int get hashCode => Object.hash(inActiveLabel, activeLabel);
}

class ImpaktfullUiBottomNavigationItemDimensTheme {
  /// The padding around the icon and the title of the item.
  final EdgeInsetsGeometry padding;

  /// The padding around the icon of an item without a title.
  final EdgeInsetsGeometry paddingWithoutTitle;

  const ImpaktfullUiBottomNavigationItemDimensTheme({
    this.padding = const EdgeInsets.symmetric(vertical: 8),
    this.paddingWithoutTitle = const EdgeInsets.symmetric(vertical: 12),
  });

  ImpaktfullUiBottomNavigationItemDimensTheme copyWith({
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? paddingWithoutTitle,
  }) =>
      ImpaktfullUiBottomNavigationItemDimensTheme(
        padding: padding ?? this.padding,
        paddingWithoutTitle: paddingWithoutTitle ?? this.paddingWithoutTitle,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiBottomNavigationItemDimensTheme &&
          padding == other.padding &&
          paddingWithoutTitle == other.paddingWithoutTitle;

  @override
  int get hashCode => Object.hash(padding, paddingWithoutTitle);
}

class ImpaktfullUiBottomNavigationItemAssetsTheme {
  const ImpaktfullUiBottomNavigationItemAssetsTheme();

  ImpaktfullUiBottomNavigationItemAssetsTheme copyWith() =>
      const ImpaktfullUiBottomNavigationItemAssetsTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiBottomNavigationItemAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}
