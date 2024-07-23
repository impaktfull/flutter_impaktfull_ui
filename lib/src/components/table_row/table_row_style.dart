import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiTableRowTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiTableRowColorTheme colors;
  final ImpaktfullUiTableRowTextStylesTheme textStyles;
  final ImpaktfullUiTableRowDimensTheme dimens;

  const ImpaktfullUiTableRowTheme({
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiTableRowTheme of(BuildContext context) => ImpaktfullUiTheme.of(context).components.tableRow;
}

class ImpaktfullUiTableRowColorTheme {
  const ImpaktfullUiTableRowColorTheme();
}

class ImpaktfullUiTableRowTextStylesTheme {
  const ImpaktfullUiTableRowTextStylesTheme();
}

class ImpaktfullUiTableRowDimensTheme {
  const ImpaktfullUiTableRowDimensTheme();
}
