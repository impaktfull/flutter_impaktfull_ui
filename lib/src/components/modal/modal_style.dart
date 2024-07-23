import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiModalTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiModalColorTheme colors;
  final ImpaktfullUiModalTextStyleTheme textStyles;
  final ImpaktfullUiModalDimensTheme dimens;

  const ImpaktfullUiModalTheme({
    required this.colors,
    required this.textStyles,
    required this.dimens,
  });

  static ImpaktfullUiModalTheme of(BuildContext context) => ImpaktfullUiTheme.of(context).components.modal;
}

class ImpaktfullUiModalColorTheme {
  const ImpaktfullUiModalColorTheme();
}

class ImpaktfullUiModalTextStyleTheme {
  const ImpaktfullUiModalTextStyleTheme();
}

class ImpaktfullUiModalDimensTheme {
  const ImpaktfullUiModalDimensTheme();
}
