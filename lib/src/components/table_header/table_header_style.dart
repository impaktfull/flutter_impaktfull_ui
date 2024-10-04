import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiTableHeaderTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiTableHeaderColorTheme colors;
  final ImpaktfullUiTableHeaderDimensTheme dimens;

  const ImpaktfullUiTableHeaderTheme({
    required this.colors,
    required this.dimens,
  });

  static ImpaktfullUiTableHeaderTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.tableHeader;
}

class ImpaktfullUiTableHeaderColorTheme {
  final Color background;

  const ImpaktfullUiTableHeaderColorTheme({
    required this.background,
  });
}

class ImpaktfullUiTableHeaderDimensTheme {
  final BorderRadiusGeometry borderRadius;
  const ImpaktfullUiTableHeaderDimensTheme({
    required this.borderRadius,
  });
}
