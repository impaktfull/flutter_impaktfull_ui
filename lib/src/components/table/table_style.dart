import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiTableTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiTableColorTheme colors;
  final ImpaktfullUiTableDimensTheme dimens;

  const ImpaktfullUiTableTheme({
    required this.colors,
    required this.dimens,
  });
}

class ImpaktfullUiTableColorTheme {
  final Color background;
  final Color? border;

  const ImpaktfullUiTableColorTheme({
    required this.background,
    required this.border,
  });
}

class ImpaktfullUiTableDimensTheme {
  final BorderRadius borderRadius;
  const ImpaktfullUiTableDimensTheme({
    required this.borderRadius,
  });
}
