import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiSwitchTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSwitchColorTheme colors;
  final ImpaktfullUiSwitchTextStyleTheme textStyles;
  final ImpaktfullUiSwitchDimensTheme dimens;
  final ImpaktfullUiSwitchAssetsTheme assets;

  const ImpaktfullUiSwitchTheme({
    required this.colors,
    required this.textStyles,
    required this.dimens,
    required this.assets,
  });

  static ImpaktfullUiSwitchTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.switchTheme;
}

class ImpaktfullUiSwitchColorTheme {
  final Color inactiveBackgroundColor;
  final Color activeBackgroundColor;
  final Color active;
  final Color inactive;
  final Color border;

  const ImpaktfullUiSwitchColorTheme({
    required this.inactiveBackgroundColor,
    required this.activeBackgroundColor,
    required this.active,
    required this.inactive,
    required this.border,
  });
}

class ImpaktfullUiSwitchTextStyleTheme {
  const ImpaktfullUiSwitchTextStyleTheme();
}

class ImpaktfullUiSwitchDimensTheme {
  final BorderRadiusGeometry? borderRadius;
  final BorderRadiusGeometry? thumbBorderRadius;
  final double? borderWidth;
  const ImpaktfullUiSwitchDimensTheme({
    this.borderRadius,
    this.thumbBorderRadius,
    this.borderWidth,
  });
}

class ImpaktfullUiSwitchAssetsTheme {
  final ImpaktfullUiAsset active;
  final ImpaktfullUiAsset inactive;

  const ImpaktfullUiSwitchAssetsTheme({
    required this.active,
    required this.inactive,
  });
}
