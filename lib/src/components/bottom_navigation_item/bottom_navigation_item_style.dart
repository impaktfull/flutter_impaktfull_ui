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
}

class ImpaktfullUiBottomNavigationItemDimensTheme {
  const ImpaktfullUiBottomNavigationItemDimensTheme();

  ImpaktfullUiBottomNavigationItemDimensTheme copyWith() =>
      const ImpaktfullUiBottomNavigationItemDimensTheme();
}

class ImpaktfullUiBottomNavigationItemAssetsTheme {
  const ImpaktfullUiBottomNavigationItemAssetsTheme();

  ImpaktfullUiBottomNavigationItemAssetsTheme copyWith() =>
      const ImpaktfullUiBottomNavigationItemAssetsTheme();
}
