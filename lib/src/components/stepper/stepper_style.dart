import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiStepperTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiStepperAssetsTheme assets;
  final ImpaktfullUiStepperColorTheme colors;
  final ImpaktfullUiStepperDimensTheme dimens;
  final ImpaktfullUiStepperTextStyleTheme textStyles;

  const ImpaktfullUiStepperTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiStepperTheme copyWith({
    ImpaktfullUiStepperAssetsTheme? assets,
    ImpaktfullUiStepperColorTheme? colors,
    ImpaktfullUiStepperDimensTheme? dimens,
    ImpaktfullUiStepperTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiStepperTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiStepperTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.stepper;

  static ImpaktfullUiStepperTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiStepperTheme(
        assets: const ImpaktfullUiStepperAssetsTheme(),
        colors: ImpaktfullUiStepperColorTheme(
          activeStep: colors.accent,
          inactiveStep: colors.border,
          assetBorder: colors.border,
          assetBackground: colors.card,
          assetColor: colors.text,
          assetBorderCompleted: colors.accent,
          assetBackgroundCompleted: colors.accent,
          assetColorCompleted: colors.textOnAccent,
        ),
        dimens: ImpaktfullUiStepperDimensTheme(
          spacing: 8,
          height: 8,
          borderRadius: dimens.borderRadius,
        ),
        textStyles: ImpaktfullUiStepperTextStyleTheme(
          title: textStyles.onCard.text.small.medium,
          subtitle: textStyles.onCard.text.small.light,
        ),
      );
}

class ImpaktfullUiStepperAssetsTheme {
  const ImpaktfullUiStepperAssetsTheme();

  ImpaktfullUiStepperAssetsTheme copyWith() =>
      const ImpaktfullUiStepperAssetsTheme();
}

class ImpaktfullUiStepperColorTheme {
  final Color activeStep;
  final Color inactiveStep;
  final Color assetBorder;
  final Color assetBackground;
  final Color assetColor;
  final Color assetBorderCompleted;
  final Color assetBackgroundCompleted;
  final Color assetColorCompleted;

  const ImpaktfullUiStepperColorTheme({
    required this.activeStep,
    required this.inactiveStep,
    required this.assetBorder,
    required this.assetColor,
    required this.assetBackground,
    required this.assetBorderCompleted,
    required this.assetBackgroundCompleted,
    required this.assetColorCompleted,
  });

  ImpaktfullUiStepperColorTheme copyWith({
    Color? activeStep,
    Color? assetBackground,
    Color? assetBackgroundCompleted,
    Color? assetBorder,
    Color? assetBorderCompleted,
    Color? assetColor,
    Color? assetColorCompleted,
    Color? inactiveStep,
  }) =>
      ImpaktfullUiStepperColorTheme(
        activeStep: activeStep ?? this.activeStep,
        assetBackground: assetBackground ?? this.assetBackground,
        assetBackgroundCompleted:
            assetBackgroundCompleted ?? this.assetBackgroundCompleted,
        assetBorder: assetBorder ?? this.assetBorder,
        assetBorderCompleted: assetBorderCompleted ?? this.assetBorderCompleted,
        assetColor: assetColor ?? this.assetColor,
        assetColorCompleted: assetColorCompleted ?? this.assetColorCompleted,
        inactiveStep: inactiveStep ?? this.inactiveStep,
      );
}

class ImpaktfullUiStepperDimensTheme {
  final double spacing;
  final double height;
  final BorderRadiusGeometry borderRadius;
  const ImpaktfullUiStepperDimensTheme({
    required this.spacing,
    required this.height,
    required this.borderRadius,
  });

  ImpaktfullUiStepperDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    double? height,
    double? spacing,
  }) =>
      ImpaktfullUiStepperDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        height: height ?? this.height,
        spacing: spacing ?? this.spacing,
      );
}

class ImpaktfullUiStepperTextStyleTheme {
  final TextStyle title;
  final TextStyle subtitle;
  const ImpaktfullUiStepperTextStyleTheme({
    required this.title,
    required this.subtitle,
  });

  ImpaktfullUiStepperTextStyleTheme copyWith({
    TextStyle? subtitle,
    TextStyle? title,
  }) =>
      ImpaktfullUiStepperTextStyleTheme(
        subtitle: subtitle ?? this.subtitle,
        title: title ?? this.title,
      );
}
