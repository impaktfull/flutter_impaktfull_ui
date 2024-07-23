import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiCheckboxTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiCheckboxColorTheme colors;
  final ImpaktfullUiCheckboxDimensTheme dimens;

  const ImpaktfullUiCheckboxTheme({
    required this.colors,
    required this.dimens,
  });

  static ImpaktfullUiCheckboxTheme of(BuildContext context) => ImpaktfullUiTheme.of(context).components.checkbox;
}

class ImpaktfullUiCheckboxColorTheme {
  final Color activeColor;
  final Color inactiveColor;
  final Color checkMarkColor;
  final Color backgroundColor;

  const ImpaktfullUiCheckboxColorTheme({
    required this.activeColor,
    required this.inactiveColor,
    required this.checkMarkColor,
    required this.backgroundColor,
  });
}

class ImpaktfullUiCheckboxDimensTheme {
  final BorderRadius borderRadius;

  const ImpaktfullUiCheckboxDimensTheme({
    required this.borderRadius,
  });
}
