import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiDropdownTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiDropdownColorTheme colors;
  final ImpaktfullUiDropdownShadowTheme shadows;
  final ImpaktfullUiDropdownDimensTheme dimens;
  final ImpaktfullUiDropdownAssetsTheme assets;

  const ImpaktfullUiDropdownTheme({
    required this.colors,
    required this.shadows,
    required this.dimens,
    required this.assets,
  });

  static ImpaktfullUiDropdownTheme of(BuildContext context) => ImpaktfullUiTheme.of(context).components.dropdown;
}

class ImpaktfullUiDropdownColorTheme {
  final Color menuBackground;
  final Color menuBorder;

  const ImpaktfullUiDropdownColorTheme({
    required this.menuBackground,
    required this.menuBorder,
  });
}

class ImpaktfullUiDropdownShadowTheme {
  final List<BoxShadow> menuShadow;
  const ImpaktfullUiDropdownShadowTheme({
    required this.menuShadow,
  });
}

class ImpaktfullUiDropdownDimensTheme {
  final BorderRadiusGeometry borderRadius;

  const ImpaktfullUiDropdownDimensTheme({
    required this.borderRadius,
  });
}

class ImpaktfullUiDropdownAssetsTheme {
  final ImpaktfullUiAsset dropUp;
  final ImpaktfullUiAsset dropDown;

  const ImpaktfullUiDropdownAssetsTheme({
    required this.dropUp,
    required this.dropDown,
  });
}
