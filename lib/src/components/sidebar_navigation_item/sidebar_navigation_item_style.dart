import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiSidebarNavigationItemTheme
    extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSidebarNavigationItemAssetsTheme assets;
  final ImpaktfullUiSidebarNavigationItemColorTheme colors;
  final ImpaktfullUiSidebarNavigationItemDimensTheme dimens;
  final ImpaktfullUiSidebarNavigationItemDurationTheme durations;
  final ImpaktfullUiSidebarNavigationItemTextStyleTheme textStyles;

  const ImpaktfullUiSidebarNavigationItemTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.durations,
    required this.textStyles,
  });

  static ImpaktfullUiSidebarNavigationItemTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.sidebarNavigationItem;
}

class ImpaktfullUiSidebarNavigationItemAssetsTheme {
  final ImpaktfullUiAsset chevronDown;
  const ImpaktfullUiSidebarNavigationItemAssetsTheme({
    required this.chevronDown,
  });
}

class ImpaktfullUiSidebarNavigationItemColorTheme {
  final Color background;
  final Color icons;

  const ImpaktfullUiSidebarNavigationItemColorTheme({
    required this.background,
    required this.icons,
  });
}

class ImpaktfullUiSidebarNavigationItemDimensTheme {
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry paddingWithSubItems;

  const ImpaktfullUiSidebarNavigationItemDimensTheme({
    required this.borderRadius,
    required this.padding,
    required this.paddingWithSubItems,
  });
}

class ImpaktfullUiSidebarNavigationItemTextStyleTheme {
  final TextStyle title;

  const ImpaktfullUiSidebarNavigationItemTextStyleTheme({
    required this.title,
  });
}

class ImpaktfullUiSidebarNavigationItemDurationTheme {
  final Duration dropdownRotation;

  const ImpaktfullUiSidebarNavigationItemDurationTheme({
    required this.dropdownRotation,
  });
}
