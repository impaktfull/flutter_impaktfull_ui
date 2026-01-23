import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

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

  static ImpaktfullUiSnackyConfiguratorTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
    required ImpaktfullUiAsset brandedIcon,
  }) =>
      ImpaktfullUiSnackyConfiguratorTheme(
        colors: ImpaktfullUiSnackyConfiguratorColorTheme(
          background: colors.card,
          border: colors.border,
          brand: colors.accent,
          error: colors.error,
          info: colors.info,
          warning: colors.warning,
          success: colors.success,
        ),
        dimens: ImpaktfullUiSnackyConfiguratorDimensTheme(
          borderRadius: dimens.borderRadius,
        ),
        textStyles: const ImpaktfullUiSnackyConfiguratorTextStylesTheme(),
        assets: ImpaktfullUiSnackyConfiguratorAssetsTheme(
          close: assets.icons.close,
          chevronRight: assets.icons.chevronRight,
          success: assets.icons.success,
          error: assets.icons.error,
          warning: assets.icons.warning,
          info: assets.icons.info,
          branded: brandedIcon,
        ),
      );
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
