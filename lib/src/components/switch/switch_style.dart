import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiSwitchTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSwitchColorTheme colors;
  final ImpaktfullUiSwitchTextStyleTheme textStyles;
  final ImpaktfullUiSwitchDimensTheme dimens;
  final ImpaktfullUiSwitchDurationsTheme durations;
  final ImpaktfullUiSwitchAssetsTheme assets;

  const ImpaktfullUiSwitchTheme({
    required this.colors,
    required this.textStyles,
    required this.dimens,
    required this.durations,
    required this.assets,
  });

  static ImpaktfullUiSwitchTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.switchTheme;

  static ImpaktfullUiSwitchTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiSwitchTheme(
        colors: ImpaktfullUiSwitchColorTheme(
          inactiveBackground: colors.border,
          activeBackground: colors.accent,
          active: colors.card,
          inactive: colors.card,
          border: colors.border,
          accessibleInactiveIcon: colors.text,
          accessibleActiveIcon: colors.accent,
        ),
        textStyles: const ImpaktfullUiSwitchTextStyleTheme(),
        dimens: ImpaktfullUiSwitchDimensTheme(
          verticalPadding: 4,
          horizontalPadding: 20,
          borderRadius: dimens.borderRadius,
          thumbBorderRadius: dimens.borderRadiusExtraSmall,
          borderWidth: 0,
        ),
        durations: ImpaktfullUiSwitchDurationsTheme(
          selected: durations.short,
        ),
        assets: ImpaktfullUiSwitchAssetsTheme(
          active: assets.icons.check,
          inactive: assets.icons.close,
        ),
      );
}

class ImpaktfullUiSwitchColorTheme {
  final Color inactiveBackground;
  final Color activeBackground;
  final Color active;
  final Color inactive;
  final Color border;
  final Color accessibleInactiveIcon;
  final Color accessibleActiveIcon;

  const ImpaktfullUiSwitchColorTheme({
    required this.inactiveBackground,
    required this.activeBackground,
    required this.active,
    required this.inactive,
    required this.border,
    required this.accessibleInactiveIcon,
    required this.accessibleActiveIcon,
  });
}

class ImpaktfullUiSwitchTextStyleTheme {
  const ImpaktfullUiSwitchTextStyleTheme();
}

class ImpaktfullUiSwitchDimensTheme {
  final BorderRadiusGeometry? borderRadius;
  final BorderRadiusGeometry? thumbBorderRadius;
  final double? borderWidth;
  final double verticalPadding;
  final double horizontalPadding;

  const ImpaktfullUiSwitchDimensTheme({
    required this.verticalPadding,
    required this.horizontalPadding,
    this.borderRadius,
    this.thumbBorderRadius,
    this.borderWidth,
  });
}

class ImpaktfullUiSwitchDurationsTheme {
  final Duration selected;
  const ImpaktfullUiSwitchDurationsTheme({
    required this.selected,
  });
}

class ImpaktfullUiSwitchAssetsTheme {
  final ImpaktfullUiAsset active;
  final ImpaktfullUiAsset inactive;

  const ImpaktfullUiSwitchAssetsTheme({
    required this.active,
    required this.inactive,
  });
}
