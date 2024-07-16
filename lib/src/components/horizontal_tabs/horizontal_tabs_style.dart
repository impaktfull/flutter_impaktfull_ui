import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiHorizontalTabsTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiHorizontalTabsColorTheme colors;
  final ImpaktfullUiHorizontalTabsDimensTheme dimens;

  const ImpaktfullUiHorizontalTabsTheme({
    required this.colors,
    required this.dimens,
  });
}

class ImpaktfullUiHorizontalTabsColorTheme {
  const ImpaktfullUiHorizontalTabsColorTheme();
}

class ImpaktfullUiHorizontalTabsDimensTheme {
  final EdgeInsets padding;
  const ImpaktfullUiHorizontalTabsDimensTheme({
    required this.padding,
  });
}
