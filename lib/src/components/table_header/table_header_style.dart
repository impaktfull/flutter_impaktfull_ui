import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiTableHeaderTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiTableHeaderColorTheme colors;
  final ImpaktfullUiTableHeaderDimensTheme dimens;

  const ImpaktfullUiTableHeaderTheme({
    required this.colors,
    required this.dimens,
  });
}

class ImpaktfullUiTableHeaderColorTheme {
  final Color background;

  const ImpaktfullUiTableHeaderColorTheme({
    required this.background,
  });
}

class ImpaktfullUiTableHeaderDimensTheme {
  final BorderRadius borderRadius;
  const ImpaktfullUiTableHeaderDimensTheme({
    required this.borderRadius,
  });
}
