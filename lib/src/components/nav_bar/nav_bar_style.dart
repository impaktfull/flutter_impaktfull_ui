import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiNavBarTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiNavBarAssetsTheme assets;
  final ImpaktfullUiNavBarColorTheme colors;
  final ImpaktfullUiNavBarDimensTheme dimens;
  final ImpaktfullUiNavBarShadowsTheme shadows;
  final ImpaktfullUiNavBarTextStyleTheme textStyles;

  const ImpaktfullUiNavBarTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.shadows,
    required this.textStyles,
  });

  static ImpaktfullUiNavBarTheme of(BuildContext context) => ImpaktfullUiTheme.of(context).components.navBar;
}

class ImpaktfullUiNavBarAssetsTheme {
  final ImpaktfullUiAsset back;
  final ImpaktfullUiAsset drawerMenu;
  final ImpaktfullUiAsset close;
  const ImpaktfullUiNavBarAssetsTheme({
    required this.back,
    required this.drawerMenu,
    required this.close,
  });
}

class ImpaktfullUiNavBarColorTheme {
  final Color background;
  final Color icons;
  final Color? border;
  const ImpaktfullUiNavBarColorTheme({
    required this.background,
    required this.icons,
    required this.border,
  });
}

class ImpaktfullUiNavBarDimensTheme {
  const ImpaktfullUiNavBarDimensTheme();
}

class ImpaktfullUiNavBarShadowsTheme {
  final List<BoxShadow> shadow;
  const ImpaktfullUiNavBarShadowsTheme({
    required this.shadow,
  });
}

class ImpaktfullUiNavBarTextStyleTheme {
  final TextStyle title;
  final TextStyle subtitle;
  const ImpaktfullUiNavBarTextStyleTheme({
    required this.title,
    required this.subtitle,
  });
}
