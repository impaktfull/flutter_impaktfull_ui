import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

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
  final ImpaktfullUiAsset chevronUp;
  const ImpaktfullUiSidebarNavigationItemAssetsTheme({
    required this.chevronUp,
  });
}

class ImpaktfullUiSidebarNavigationItemColorTheme {
  final Color background;
  final Color icon;

  const ImpaktfullUiSidebarNavigationItemColorTheme({
    required this.background,
    required this.icon,
  });
}

class ImpaktfullUiSidebarNavigationItemDimensTheme {
  final BorderRadius borderRadius;

  const ImpaktfullUiSidebarNavigationItemDimensTheme({
    required this.borderRadius,
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
