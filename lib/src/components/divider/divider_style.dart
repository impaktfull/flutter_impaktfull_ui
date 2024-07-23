import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiDividerTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiDividerColorTheme colors;

  const ImpaktfullUiDividerTheme({
    required this.colors,
  });

  static ImpaktfullUiDividerTheme of(BuildContext context) => ImpaktfullUiTheme.of(context).components.divider;
}

class ImpaktfullUiDividerColorTheme {
  final Color color;

  const ImpaktfullUiDividerColorTheme({
    required this.color,
  });
}
