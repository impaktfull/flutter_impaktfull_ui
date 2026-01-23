import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiCheckboxTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiCheckboxColorTheme colors;
  final ImpaktfullUiCheckboxDimensTheme dimens;
  final ImpaktfullUiCheckboxDurationsTheme durations;
  final ImpaktfullUiCheckboxAssetsTheme assets;

  const ImpaktfullUiCheckboxTheme({
    required this.colors,
    required this.dimens,
    required this.durations,
    required this.assets,
  });

  static ImpaktfullUiCheckboxTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.checkbox;

  static ImpaktfullUiCheckboxTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiCheckboxTheme(
        assets: ImpaktfullUiCheckboxAssetsTheme(
          check: assets.icons.check,
          indermediate: assets.icons.minus,
        ),
        colors: ImpaktfullUiCheckboxColorTheme(
          borderColor: colors.border,
          activeColor: colors.accent,
          inactiveColor: colors.card,
          checkMarkColor: colors.textOnAccent,
          backgroundColor: colors.card,
        ),
        dimens: ImpaktfullUiCheckboxDimensTheme(
          borderRadius: dimens.borderRadiusSmall,
        ),
        durations: ImpaktfullUiCheckboxDurationsTheme(
          selected: durations.short,
        ),
      );

  ImpaktfullUiCheckboxTheme copyWith({
    ImpaktfullUiCheckboxColorTheme? colors,
    ImpaktfullUiCheckboxDimensTheme? dimens,
    ImpaktfullUiCheckboxDurationsTheme? durations,
    ImpaktfullUiCheckboxAssetsTheme? assets,
  }) =>
      ImpaktfullUiCheckboxTheme(
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        assets: assets ?? this.assets,
      );
}

class ImpaktfullUiCheckboxAssetsTheme {
  final ImpaktfullUiAsset check;
  final ImpaktfullUiAsset indermediate;

  const ImpaktfullUiCheckboxAssetsTheme({
    required this.check,
    required this.indermediate,
  });

  ImpaktfullUiCheckboxAssetsTheme copyWith({
    ImpaktfullUiAsset? check,
    ImpaktfullUiAsset? indermediate,
  }) =>
      ImpaktfullUiCheckboxAssetsTheme(
        check: check ?? this.check,
        indermediate: indermediate ?? this.indermediate,
      );
}

class ImpaktfullUiCheckboxColorTheme {
  final Color borderColor;
  final Color activeColor;
  final Color inactiveColor;
  final Color checkMarkColor;
  final Color backgroundColor;

  const ImpaktfullUiCheckboxColorTheme({
    required this.borderColor,
    required this.activeColor,
    required this.inactiveColor,
    required this.checkMarkColor,
    required this.backgroundColor,
  });

  ImpaktfullUiCheckboxColorTheme copyWith({
    Color? borderColor,
    Color? activeColor,
    Color? inactiveColor,
    Color? checkMarkColor,
    Color? backgroundColor,
  }) =>
      ImpaktfullUiCheckboxColorTheme(
        borderColor: borderColor ?? this.borderColor,
        activeColor: activeColor ?? this.activeColor,
        inactiveColor: inactiveColor ?? this.inactiveColor,
        checkMarkColor: checkMarkColor ?? this.checkMarkColor,
        backgroundColor: backgroundColor ?? this.backgroundColor,
      );
}

class ImpaktfullUiCheckboxDimensTheme {
  final BorderRadiusGeometry borderRadius;

  const ImpaktfullUiCheckboxDimensTheme({
    required this.borderRadius,
  });

  ImpaktfullUiCheckboxDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
  }) =>
      ImpaktfullUiCheckboxDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
      );
}

class ImpaktfullUiCheckboxDurationsTheme {
  final Duration selected;
  const ImpaktfullUiCheckboxDurationsTheme({
    required this.selected,
  });
}
