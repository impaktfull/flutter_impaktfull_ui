import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiTabBarItemTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiTabBarItemAssetsTheme assets;
  final ImpaktfullUiTabBarItemColorTheme colors;
  final ImpaktfullUiTabBarItemDimensTheme dimens;
  final ImpaktfullUiTabBarItemDurationsTheme durations;
  final ImpaktfullUiTabBarItemTextStyleTheme textStyles;

  const ImpaktfullUiTabBarItemTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.durations,
    required this.textStyles,
  });

  static ImpaktfullUiTabBarItemTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.tabBarItem;
}

class ImpaktfullUiTabBarItemAssetsTheme {
  const ImpaktfullUiTabBarItemAssetsTheme();
}

class ImpaktfullUiTabBarItemColorTheme {
  final Color background;
  const ImpaktfullUiTabBarItemColorTheme({
    required this.background,
  });
}

class ImpaktfullUiTabBarItemDimensTheme {
  final BorderRadiusGeometry selectedMarkerBorderRadius;
  const ImpaktfullUiTabBarItemDimensTheme({
    required this.selectedMarkerBorderRadius,
  });
}

class ImpaktfullUiTabBarItemDurationsTheme {
  final Duration selected;
  const ImpaktfullUiTabBarItemDurationsTheme({
    required this.selected,
  });
}

class ImpaktfullUiTabBarItemTextStyleTheme {
  final TextStyle label;
  const ImpaktfullUiTabBarItemTextStyleTheme({
    required this.label,
  });
}
