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
  final Color background;
  final Color closeIcon;
  final Color leadingHeaderIcon;

  const ImpaktfullUiModalColorTheme({
    required this.background,
    required this.closeIcon,
    required this.leadingHeaderIcon,
  });
}

class ImpaktfullUiModalTextStyleTheme {
  final TextStyle title;
  final TextStyle subtitle;
  const ImpaktfullUiModalTextStyleTheme({
    required this.title,
    required this.subtitle,
  });
}

class ImpaktfullUiModalDimensTheme {
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry closeIconButtonPadding;
  final EdgeInsetsGeometry leadingIconPadding;
  final EdgeInsetsGeometry padding;

  const ImpaktfullUiModalDimensTheme({
    required this.borderRadius,
    required this.closeIconButtonPadding,
    required this.leadingIconPadding,
    required this.padding,
  });
}
