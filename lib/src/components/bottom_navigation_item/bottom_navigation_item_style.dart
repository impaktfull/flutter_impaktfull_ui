import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiBottomNavigationItemTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiBottomNavigationItemColorTheme colors;
  final ImpaktfullUiBottomNavigationItemTextStyleTheme textStyles;
  final ImpaktfullUiBottomNavigationItemDimensTheme dimens;
  final ImpaktfullUiBottomNavigationItemAssetsTheme assets;

  const ImpaktfullUiBottomNavigationItemTheme({
    required this.colors,
    required this.textStyles,
    required this.dimens,
    required this.assets,
  });

  static ImpaktfullUiBottomNavigationItemTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.bottomNavigationItem;
}

class ImpaktfullUiBottomNavigationItemColorTheme {
  final Color active;
  final Color inactive;
  final Color? badgeActive;
  final Color? badgeInActive;

  const ImpaktfullUiBottomNavigationItemColorTheme({
    required this.active,
    required this.inactive,
    required this.badgeActive,
    required this.badgeInActive,
  });
}

class ImpaktfullUiBottomNavigationItemTextStyleTheme {
  final TextStyle inActiveLabel;
  final TextStyle activeLabel;

  const ImpaktfullUiBottomNavigationItemTextStyleTheme({
    required this.activeLabel,
    required this.inActiveLabel,
  });
}

class ImpaktfullUiBottomNavigationItemDimensTheme {
  const ImpaktfullUiBottomNavigationItemDimensTheme();
}

class ImpaktfullUiBottomNavigationItemAssetsTheme {
  const ImpaktfullUiBottomNavigationItemAssetsTheme();
}
