import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiSwitchListItemTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSwitchListItemAssetsTheme assets;
  final ImpaktfullUiSwitchListItemColorTheme colors;
  final ImpaktfullUiSwitchListItemDimensTheme dimens;
  final ImpaktfullUiSwitchListItemTextStyleTheme textStyles;

  const ImpaktfullUiSwitchListItemTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiSwitchListItemTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.switchListItem;

  static ImpaktfullUiSwitchListItemTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiSwitchListItemTheme(
        assets: const ImpaktfullUiSwitchListItemAssetsTheme(),
        colors: ImpaktfullUiSwitchListItemColorTheme(
          icons: colors.primary,
        ),
        dimens: const ImpaktfullUiSwitchListItemDimensTheme(),
        textStyles: const ImpaktfullUiSwitchListItemTextStyleTheme(),
      );
}

class ImpaktfullUiSwitchListItemAssetsTheme {
  const ImpaktfullUiSwitchListItemAssetsTheme();
}

class ImpaktfullUiSwitchListItemColorTheme {
  final Color icons;
  const ImpaktfullUiSwitchListItemColorTheme({
    required this.icons,
  });
}

class ImpaktfullUiSwitchListItemDimensTheme {
  const ImpaktfullUiSwitchListItemDimensTheme();
}

class ImpaktfullUiSwitchListItemTextStyleTheme {
  const ImpaktfullUiSwitchListItemTextStyleTheme();
}
