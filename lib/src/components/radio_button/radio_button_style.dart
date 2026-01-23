import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiRadioButtonTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiRadioButtonAssetsTheme assets;
  final ImpaktfullUiRadioButtonColorTheme colors;
  final ImpaktfullUiRadioButtonDimensTheme dimens;
  final ImpaktfullUiRadioButtonTextStyleTheme textStyles;

  const ImpaktfullUiRadioButtonTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiRadioButtonTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.radioButton;

  static ImpaktfullUiRadioButtonTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiRadioButtonTheme(
        assets: const ImpaktfullUiRadioButtonAssetsTheme(),
        colors: ImpaktfullUiRadioButtonColorTheme(
          selected: colors.accent,
          unselected: colors.card,
          border: colors.border,
          centerSelectedBackground: colors.card,
          centerUnSelectedBackground: Colors.transparent,
        ),
        dimens: ImpaktfullUiRadioButtonDimensTheme(
          borderRadius: dimens.borderRadiusCircle,
        ),
        textStyles: const ImpaktfullUiRadioButtonTextStyleTheme(),
      );
}

class ImpaktfullUiRadioButtonAssetsTheme {
  const ImpaktfullUiRadioButtonAssetsTheme();
}

class ImpaktfullUiRadioButtonColorTheme {
  final Color selected;
  final Color unselected;
  final Color border;
  final Color centerSelectedBackground;
  final Color centerUnSelectedBackground;
  const ImpaktfullUiRadioButtonColorTheme({
    required this.selected,
    required this.unselected,
    required this.border,
    required this.centerSelectedBackground,
    required this.centerUnSelectedBackground,
  });
}

class ImpaktfullUiRadioButtonDimensTheme {
  final BorderRadiusGeometry borderRadius;
  const ImpaktfullUiRadioButtonDimensTheme({
    required this.borderRadius,
  });
}

class ImpaktfullUiRadioButtonTextStyleTheme {
  const ImpaktfullUiRadioButtonTextStyleTheme();
}
