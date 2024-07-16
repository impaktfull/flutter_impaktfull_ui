import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiInputFieldTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiInputFieldColorTheme colors;
  final ImpaktfullUiInputFieldTextStylesTheme textStyles;
  final ImpaktfullUiInputFieldDimensTheme dimens;

  const ImpaktfullUiInputFieldTheme({
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });
}

class ImpaktfullUiInputFieldColorTheme {
  final Color background;
  final Color border;
  const ImpaktfullUiInputFieldColorTheme({
    required this.background,
    required this.border,
  });
}

class ImpaktfullUiInputFieldTextStylesTheme {
  final TextStyle label;
  final TextStyle text;
  final TextStyle hint;

  const ImpaktfullUiInputFieldTextStylesTheme({
    required this.label,
    required this.text,
    required this.hint,
  });
}

class ImpaktfullUiInputFieldDimensTheme {
  final BorderRadius borderRadius;
  const ImpaktfullUiInputFieldDimensTheme({
    required this.borderRadius,
  });
}
