import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiTableHeaderItemTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiTableHeaderItemColorTheme colors;
  final ImpaktfullUiTableHeaderItemTextStylesTheme textStyles;
  final ImpaktfullUiTableHeaderItemDimensTheme dimens;

  const ImpaktfullUiTableHeaderItemTheme({
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });
}

class ImpaktfullUiTableHeaderItemColorTheme {
  const ImpaktfullUiTableHeaderItemColorTheme();
}

class ImpaktfullUiTableHeaderItemTextStylesTheme {
  final TextStyle title;

  const ImpaktfullUiTableHeaderItemTextStylesTheme({
    required this.title,
  });
}

class ImpaktfullUiTableHeaderItemDimensTheme {
  const ImpaktfullUiTableHeaderItemDimensTheme();
}
