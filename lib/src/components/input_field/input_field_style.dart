import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiInputFieldTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiInputFieldColorTheme colors;
  final ImpaktfullUiInputFieldTextStylesTheme textStyles;
  final ImpaktfullUiInputFieldDimensTheme dimens;

  const ImpaktfullUiInputFieldTheme({
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiInputFieldTheme of(BuildContext context) => ImpaktfullUiTheme.of(context).components.inputField;
}

class ImpaktfullUiInputFieldColorTheme {
  final Color background;
  final Color border;
  final Color cursor;
  final Color selection;
  final Color selectionHandle;

  const ImpaktfullUiInputFieldColorTheme({
    required this.background,
    required this.border,
    required this.cursor,
    required this.selection,
    required this.selectionHandle,
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
  final BorderRadiusGeometry borderRadius;
  const ImpaktfullUiInputFieldDimensTheme({
    required this.borderRadius,
  });
}
