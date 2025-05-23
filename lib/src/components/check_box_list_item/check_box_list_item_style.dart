import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiCheckBoxListItemTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiCheckBoxListItemAssetsTheme assets;
  final ImpaktfullUiCheckBoxListItemColorTheme colors;
  final ImpaktfullUiCheckBoxListItemDimensTheme dimens;
  final ImpaktfullUiCheckBoxListItemTextStyleTheme textStyles;

  const ImpaktfullUiCheckBoxListItemTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiCheckBoxListItemTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.checkBoxListItem;

  static ImpaktfullUiCheckBoxListItemTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiCheckBoxListItemTheme(
        assets: const ImpaktfullUiCheckBoxListItemAssetsTheme(),
        colors: ImpaktfullUiCheckBoxListItemColorTheme(
          icons: colors.primary,
        ),
        dimens: const ImpaktfullUiCheckBoxListItemDimensTheme(),
        textStyles: const ImpaktfullUiCheckBoxListItemTextStyleTheme(),
      );
}

class ImpaktfullUiCheckBoxListItemAssetsTheme {
  const ImpaktfullUiCheckBoxListItemAssetsTheme();
}

class ImpaktfullUiCheckBoxListItemColorTheme {
  final Color icons;
  const ImpaktfullUiCheckBoxListItemColorTheme({
    required this.icons,
  });
}

class ImpaktfullUiCheckBoxListItemDimensTheme {
  const ImpaktfullUiCheckBoxListItemDimensTheme();
}

class ImpaktfullUiCheckBoxListItemTextStyleTheme {
  const ImpaktfullUiCheckBoxListItemTextStyleTheme();
}
