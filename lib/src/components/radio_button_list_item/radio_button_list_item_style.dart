import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiRadioButtonListItemTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiRadioButtonListItemAssetsTheme assets;
  final ImpaktfullUiRadioButtonListItemColorTheme colors;
  final ImpaktfullUiRadioButtonListItemDimensTheme dimens;
  final ImpaktfullUiRadioButtonListItemTextStyleTheme textStyles;

  const ImpaktfullUiRadioButtonListItemTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiRadioButtonListItemTheme copyWith({
    ImpaktfullUiRadioButtonListItemAssetsTheme? assets,
    ImpaktfullUiRadioButtonListItemColorTheme? colors,
    ImpaktfullUiRadioButtonListItemDimensTheme? dimens,
    ImpaktfullUiRadioButtonListItemTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiRadioButtonListItemTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiRadioButtonListItemTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.radioButtonListItem;

  static ImpaktfullUiRadioButtonListItemTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiRadioButtonListItemTheme(
        assets: const ImpaktfullUiRadioButtonListItemAssetsTheme(),
        colors: ImpaktfullUiRadioButtonListItemColorTheme(
          icons: colors.primary,
        ),
        dimens: ImpaktfullUiRadioButtonListItemDimensTheme(
          borderRadius: dimens.borderRadiusCircle,
        ),
        textStyles: const ImpaktfullUiRadioButtonListItemTextStyleTheme(),
      );
}

class ImpaktfullUiRadioButtonListItemAssetsTheme {
  const ImpaktfullUiRadioButtonListItemAssetsTheme();

  ImpaktfullUiRadioButtonListItemAssetsTheme copyWith() =>
      const ImpaktfullUiRadioButtonListItemAssetsTheme();
}

class ImpaktfullUiRadioButtonListItemColorTheme {
  final Color icons;
  const ImpaktfullUiRadioButtonListItemColorTheme({
    required this.icons,
  });

  ImpaktfullUiRadioButtonListItemColorTheme copyWith({
    Color? icons,
  }) =>
      ImpaktfullUiRadioButtonListItemColorTheme(
        icons: icons ?? this.icons,
      );
}

class ImpaktfullUiRadioButtonListItemDimensTheme {
  final BorderRadiusGeometry borderRadius;
  const ImpaktfullUiRadioButtonListItemDimensTheme({
    required this.borderRadius,
  });

  ImpaktfullUiRadioButtonListItemDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
  }) =>
      ImpaktfullUiRadioButtonListItemDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
      );
}

class ImpaktfullUiRadioButtonListItemTextStyleTheme {
  const ImpaktfullUiRadioButtonListItemTextStyleTheme();

  ImpaktfullUiRadioButtonListItemTextStyleTheme copyWith() =>
      const ImpaktfullUiRadioButtonListItemTextStyleTheme();
}
