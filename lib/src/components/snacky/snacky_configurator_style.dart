import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiSnackyConfiguratorTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSnackyConfiguratorColorTheme colors;
  final ImpaktfullUiSnackyConfiguratorTextStylesTheme textStyles;
  final ImpaktfullUiSnackyConfiguratorDimensTheme dimens;
  final ImpaktfullUiSnackyConfiguratorAssetsTheme assets;

  const ImpaktfullUiSnackyConfiguratorTheme({
    required this.colors,
    required this.dimens,
    required this.textStyles,
    required this.assets,
  });

  static ImpaktfullUiSnackyConfiguratorTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.snackyConfigurator;
}

class ImpaktfullUiSnackyConfiguratorColorTheme {
  final Color background;
  final Color? border;
  final Color brand;
  final Color error;
  final Color info;
  final Color warning;
  final Color success;

  const ImpaktfullUiSnackyConfiguratorColorTheme({
    required this.background,
    required this.border,
    required this.brand,
    required this.error,
    required this.info,
    required this.warning,
    required this.success,
  });
}

class ImpaktfullUiSnackyConfiguratorTextStylesTheme {
  const ImpaktfullUiSnackyConfiguratorTextStylesTheme();
}

class ImpaktfullUiSnackyConfiguratorDimensTheme {
  final BorderRadiusGeometry borderRadius;

  const ImpaktfullUiSnackyConfiguratorDimensTheme({
    required this.borderRadius,
  });
}

class ImpaktfullUiSnackyConfiguratorAssetsTheme {
  final ImpaktfullUiAsset? close;
  final ImpaktfullUiAsset? chevronRight;
  final ImpaktfullUiAsset? success;
  final ImpaktfullUiAsset? error;
  final ImpaktfullUiAsset? warning;
  final ImpaktfullUiAsset? info;
  final ImpaktfullUiAsset? branded;

  const ImpaktfullUiSnackyConfiguratorAssetsTheme({
    required this.close,
    required this.chevronRight,
    required this.success,
    required this.error,
    required this.warning,
    required this.info,
    required this.branded,
  });
}
