import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiDividerTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiDividerColorTheme colors;
  final ImpaktfullUiDividerDimensTheme dimens;

  const ImpaktfullUiDividerTheme({
    required this.colors,
    required this.dimens,
  });

  static ImpaktfullUiDividerTheme of(BuildContext context) => ImpaktfullUiTheme.of(context).components.divider;
}

class ImpaktfullUiDividerColorTheme {
  final Color color;

  const ImpaktfullUiDividerColorTheme({
    required this.color,
  });
}

class ImpaktfullUiDividerDimensTheme {
  final EdgeInsetsGeometry margin;

  const ImpaktfullUiDividerDimensTheme({
    required this.margin,
  });
}
