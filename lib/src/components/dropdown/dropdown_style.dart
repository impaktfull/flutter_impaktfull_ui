import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiDropdownTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiDropdownColorTheme colors;
  final ImpaktfullUiDropdownShadowTheme shadows;
  final ImpaktfullUiDropdownDimensTheme dimens;

  const ImpaktfullUiDropdownTheme({
    required this.colors,
    required this.shadows,
    required this.dimens,
  });

  static ImpaktfullUiDropdownTheme of(BuildContext context) => ImpaktfullUiTheme.of(context).components.dropdown;
}

class ImpaktfullUiDropdownColorTheme {
  final Color menuBackground;
  final Color menuBorder;

  const ImpaktfullUiDropdownColorTheme({
    required this.menuBackground,
    required this.menuBorder,
  });
}

class ImpaktfullUiDropdownShadowTheme {
  final List<BoxShadow> menuShadow;
  const ImpaktfullUiDropdownShadowTheme({
    required this.menuShadow,
  });
}

class ImpaktfullUiDropdownDimensTheme {
  final BorderRadius borderRadius;

  const ImpaktfullUiDropdownDimensTheme({
    required this.borderRadius,
  });
}
