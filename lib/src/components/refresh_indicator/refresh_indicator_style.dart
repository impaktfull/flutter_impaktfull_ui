import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiRefreshIndicatorTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiRefreshIndicatorColorTheme colors;

  const ImpaktfullUiRefreshIndicatorTheme({
    required this.colors,
  });

  static ImpaktfullUiRefreshIndicatorTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.refreshIndicator;
}

class ImpaktfullUiRefreshIndicatorColorTheme {
  final Color loadingIndicator;

  const ImpaktfullUiRefreshIndicatorColorTheme({
    required this.loadingIndicator,
  });
}
