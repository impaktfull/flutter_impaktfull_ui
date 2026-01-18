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
          inactiveStep: colors.card,
          assetBorder: colors.border,
          assetBackground: colors.card,
          assetColor: colors.text,
          assetBorderCompleted: colors.success,
          assetBackgroundCompleted: colors.success,
          assetColorCompleted: colors.textOnAccent,
        ),
        dimens: ImpaktfullUiStepperDimensTheme(
          spacing: 8,
          height: 4,
          borderRadius: dimens.borderRadiusExtraSmall,
        ),
        textStyles: ImpaktfullUiStepperTextStyleTheme(
          title: textStyles.onCard.text.small.medium,
          subtitle: textStyles.onCard.text.small.light,
        ),
      );
}

class ImpaktfullUiStepperAssetsTheme {
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
}

class ImpaktfullUiStepperTextStyleTheme {
  final TextStyle title;
  final TextStyle subtitle;
  const ImpaktfullUiStepperTextStyleTheme({
    required this.title,
    required this.subtitle,
  });
}
