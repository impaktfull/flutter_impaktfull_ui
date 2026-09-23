import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiSnackyConfiguratorTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSnackyConfiguratorColorTheme colors;
  final ImpaktfullUiSnackyConfiguratorTextStyleTheme textStyles;
  final ImpaktfullUiSnackyConfiguratorDimensTheme dimens;
  final ImpaktfullUiSnackyConfiguratorAssetsTheme assets;

  const ImpaktfullUiSnackyConfiguratorTheme({
    required this.colors,
    required this.dimens,
    required this.textStyles,
    required this.assets,
  });

  ImpaktfullUiSnackyConfiguratorTheme copyWith({
    ImpaktfullUiSnackyConfiguratorAssetsTheme? assets,
    ImpaktfullUiSnackyConfiguratorColorTheme? colors,
    ImpaktfullUiSnackyConfiguratorDimensTheme? dimens,
    ImpaktfullUiSnackyConfiguratorTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiSnackyConfiguratorTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

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
        textStyles: const ImpaktfullUiSnackyConfiguratorTextStyleTheme(),
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSnackyConfiguratorTheme &&
          colors == other.colors &&
          textStyles == other.textStyles &&
          dimens == other.dimens &&
          assets == other.assets;

  @override
  int get hashCode => Object.hash(colors, textStyles, dimens, assets);
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

  ImpaktfullUiSnackyConfiguratorColorTheme copyWith({
    Color? background,
    Color? border,
    Color? brand,
    Color? error,
    Color? info,
    Color? success,
    Color? warning,
  }) =>
      ImpaktfullUiSnackyConfiguratorColorTheme(
        background: background ?? this.background,
        border: border ?? this.border,
        brand: brand ?? this.brand,
        error: error ?? this.error,
        info: info ?? this.info,
        success: success ?? this.success,
        warning: warning ?? this.warning,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSnackyConfiguratorColorTheme &&
          background == other.background &&
          border == other.border &&
          brand == other.brand &&
          error == other.error &&
          info == other.info &&
          warning == other.warning &&
          success == other.success;

  @override
  int get hashCode =>
      Object.hash(background, border, brand, error, info, warning, success);
}

class ImpaktfullUiSnackyConfiguratorTextStyleTheme {
  const ImpaktfullUiSnackyConfiguratorTextStyleTheme();

  ImpaktfullUiSnackyConfiguratorTextStyleTheme copyWith() =>
      const ImpaktfullUiSnackyConfiguratorTextStyleTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiSnackyConfiguratorTextStyleTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiSnackyConfiguratorDimensTheme {
  final BorderRadiusGeometry borderRadius;

  const ImpaktfullUiSnackyConfiguratorDimensTheme({
    required this.borderRadius,
  });

  ImpaktfullUiSnackyConfiguratorDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
  }) =>
      ImpaktfullUiSnackyConfiguratorDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSnackyConfiguratorDimensTheme &&
          borderRadius == other.borderRadius;

  @override
  int get hashCode => borderRadius.hashCode;
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

  ImpaktfullUiSnackyConfiguratorAssetsTheme copyWith({
    ImpaktfullUiAsset? branded,
    ImpaktfullUiAsset? chevronRight,
    ImpaktfullUiAsset? close,
    ImpaktfullUiAsset? error,
    ImpaktfullUiAsset? info,
    ImpaktfullUiAsset? success,
    ImpaktfullUiAsset? warning,
  }) =>
      ImpaktfullUiSnackyConfiguratorAssetsTheme(
        branded: branded ?? this.branded,
        chevronRight: chevronRight ?? this.chevronRight,
        close: close ?? this.close,
        error: error ?? this.error,
        info: info ?? this.info,
        success: success ?? this.success,
        warning: warning ?? this.warning,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSnackyConfiguratorAssetsTheme &&
          close == other.close &&
          chevronRight == other.chevronRight &&
          success == other.success &&
          error == other.error &&
          warning == other.warning &&
          info == other.info &&
          branded == other.branded;

  @override
  int get hashCode =>
      Object.hash(close, chevronRight, success, error, warning, info, branded);
}
