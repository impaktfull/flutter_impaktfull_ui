import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiSidebarNavigationTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSidebarNavigationAssetsTheme assets;
  final ImpaktfullUiSidebarNavigationColorTheme colors;
  final ImpaktfullUiSidebarNavigationDimensTheme dimens;
  final ImpaktfullUiSidebarNavigationTextStyleTheme textStyles;

  const ImpaktfullUiSidebarNavigationTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiSidebarNavigationTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.sidebarNavigation;
}

class ImpaktfullUiSidebarNavigationAssetsTheme {
  const ImpaktfullUiSidebarNavigationAssetsTheme();
}

class ImpaktfullUiSidebarNavigationColorTheme {
  final Color backgroundColor;
  final Color border;

  const ImpaktfullUiSidebarNavigationColorTheme({
    required this.backgroundColor,
    required this.border,
  });
}

class ImpaktfullUiSidebarNavigationDimensTheme {
  final EdgeInsetsGeometry padding;

  const ImpaktfullUiSidebarNavigationDimensTheme({
    required this.padding,
  });
}

class ImpaktfullUiSidebarNavigationTextStyleTheme {
  const ImpaktfullUiSidebarNavigationTextStyleTheme();
}
