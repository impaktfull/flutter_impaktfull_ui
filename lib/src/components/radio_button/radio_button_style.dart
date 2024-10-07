import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

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

  static ImpaktfullUiRadioButtonTheme of(BuildContext context) => ImpaktfullUiTheme.of(context).components.radioButton;
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
