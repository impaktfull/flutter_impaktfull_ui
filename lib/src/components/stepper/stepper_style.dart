import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

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
}

class ImpaktfullUiStepperAssetsTheme {
  const ImpaktfullUiStepperAssetsTheme();
}

class ImpaktfullUiStepperColorTheme {
  final Color activeStep;
  final Color inactiveStep;

  const ImpaktfullUiStepperColorTheme({
    required this.activeStep,
    required this.inactiveStep,
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
