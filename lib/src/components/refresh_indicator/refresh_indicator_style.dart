import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiRefreshIndicatorTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiRefreshIndicatorColorTheme colors;

  const ImpaktfullUiRefreshIndicatorTheme({
    required this.colors,
  });
}

class ImpaktfullUiRefreshIndicatorColorTheme {
  final Color loadingIndicator;

  const ImpaktfullUiRefreshIndicatorColorTheme({
    required this.loadingIndicator,
  });
}