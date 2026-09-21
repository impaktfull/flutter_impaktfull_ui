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

  ImpaktfullUiSwitchListItemTheme copyWith({
    ImpaktfullUiSwitchListItemAssetsTheme? assets,
    ImpaktfullUiSwitchListItemColorTheme? colors,
    ImpaktfullUiSwitchListItemDimensTheme? dimens,
    ImpaktfullUiSwitchListItemTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiSwitchListItemTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

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

  ImpaktfullUiSwitchListItemAssetsTheme copyWith() =>
      const ImpaktfullUiSwitchListItemAssetsTheme();
}

class ImpaktfullUiSwitchListItemColorTheme {
  final Color icons;
  const ImpaktfullUiSwitchListItemColorTheme({
    required this.icons,
  });

  ImpaktfullUiSwitchListItemColorTheme copyWith({
    Color? icons,
  }) =>
      ImpaktfullUiSwitchListItemColorTheme(
        icons: icons ?? this.icons,
      );
}

class ImpaktfullUiSwitchListItemDimensTheme {
  const ImpaktfullUiSwitchListItemDimensTheme();

  ImpaktfullUiSwitchListItemDimensTheme copyWith() =>
      const ImpaktfullUiSwitchListItemDimensTheme();
}

class ImpaktfullUiSwitchListItemTextStyleTheme {
  const ImpaktfullUiSwitchListItemTextStyleTheme();

  ImpaktfullUiSwitchListItemTextStyleTheme copyWith() =>
      const ImpaktfullUiSwitchListItemTextStyleTheme();
}
