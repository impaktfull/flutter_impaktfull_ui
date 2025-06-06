import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiTableRowItemTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiTableRowItemColorTheme colors;
  final ImpaktfullUiTableRowItemTextStylesTheme textStyles;
  final ImpaktfullUiTableRowItemDimensTheme dimens;

  const ImpaktfullUiTableRowItemTheme({
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiTableRowItemTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.tableRowItem;
}

class ImpaktfullUiTableRowItemColorTheme {
  const ImpaktfullUiTableRowItemColorTheme();
}

class ImpaktfullUiTableRowItemTextStylesTheme {
  final TextStyle title;
  final TextStyle subtitle;

  const ImpaktfullUiTableRowItemTextStylesTheme({
    required this.title,
    required this.subtitle,
  });
}

class ImpaktfullUiTableRowItemDimensTheme {
  const ImpaktfullUiTableRowItemDimensTheme();
}
