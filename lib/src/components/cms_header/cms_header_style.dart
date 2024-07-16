import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiCmsHeaderTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiCmsHeaderColorTheme colors;
  final ImpaktfullUiCmsHeaderDimensTheme dimens;

  const ImpaktfullUiCmsHeaderTheme({
    required this.colors,
    required this.dimens,
  });
}

class ImpaktfullUiCmsHeaderColorTheme {
  final Color background;
  final Color? border;

  const ImpaktfullUiCmsHeaderColorTheme({
    required this.background,
    required this.border,
  });
}

class ImpaktfullUiCmsHeaderDimensTheme {
  const ImpaktfullUiCmsHeaderDimensTheme();
}
