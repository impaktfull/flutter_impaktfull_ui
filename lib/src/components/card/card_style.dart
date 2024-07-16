import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiCardTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiCardColorTheme colors;
  final ImpaktfullUiCardDimensTheme dimens;

  const ImpaktfullUiCardTheme({
    required this.colors,
    required this.dimens,
  });
}

class ImpaktfullUiCardColorTheme {
  final Color background;
  final Color? border;
  final Color? shadow;

  const ImpaktfullUiCardColorTheme({
    required this.background,
    required this.border,
    required this.shadow,
  });
}

class ImpaktfullUiCardDimensTheme {
  final BorderRadius borderRadius;
  final EdgeInsets padding;

  const ImpaktfullUiCardDimensTheme({
    required this.borderRadius,
    required this.padding,
  });
}
