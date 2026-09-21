import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiCheckboxListItemTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiCheckboxListItemAssetsTheme assets;
  final ImpaktfullUiCheckboxListItemColorTheme colors;
  final ImpaktfullUiCheckboxListItemDimensTheme dimens;
  final ImpaktfullUiCheckboxListItemTextStyleTheme textStyles;

  const ImpaktfullUiCheckboxListItemTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiCheckboxListItemTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.checkBoxListItem;

  static ImpaktfullUiCheckboxListItemTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiCheckboxListItemTheme(
        assets: const ImpaktfullUiCheckboxListItemAssetsTheme(),
        colors: ImpaktfullUiCheckboxListItemColorTheme(
          icons: colors.primary,
        ),
        dimens: const ImpaktfullUiCheckboxListItemDimensTheme(),
        textStyles: const ImpaktfullUiCheckboxListItemTextStyleTheme(),
      );
}

class ImpaktfullUiCheckboxListItemAssetsTheme {
  const ImpaktfullUiCheckboxListItemAssetsTheme();
}

class ImpaktfullUiCheckboxListItemColorTheme {
  final Color icons;
  const ImpaktfullUiCheckboxListItemColorTheme({
    required this.icons,
  });
}

class ImpaktfullUiCheckboxListItemDimensTheme {
  const ImpaktfullUiCheckboxListItemDimensTheme();
}

class ImpaktfullUiCheckboxListItemTextStyleTheme {
  const ImpaktfullUiCheckboxListItemTextStyleTheme();
}
