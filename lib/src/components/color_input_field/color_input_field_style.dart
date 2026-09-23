import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiColorInputFieldTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiColorInputFieldAssetsTheme assets;
  final ImpaktfullUiColorInputFieldColorTheme colors;
  final ImpaktfullUiColorInputFieldDimensTheme dimens;
  final ImpaktfullUiColorInputFieldTextStyleTheme textStyles;

  const ImpaktfullUiColorInputFieldTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiColorInputFieldTheme copyWith({
    ImpaktfullUiColorInputFieldAssetsTheme? assets,
    ImpaktfullUiColorInputFieldColorTheme? colors,
    ImpaktfullUiColorInputFieldDimensTheme? dimens,
    ImpaktfullUiColorInputFieldTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiColorInputFieldTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiColorInputFieldTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.colorInputField;

  static ImpaktfullUiColorInputFieldTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiColorInputFieldTheme(
        assets: const ImpaktfullUiColorInputFieldAssetsTheme(),
        colors: ImpaktfullUiColorInputFieldColorTheme(
          border: colors.border,
        ),
        dimens: ImpaktfullUiColorInputFieldDimensTheme(
          borderRadius: dimens.borderRadius,
        ),
        textStyles: const ImpaktfullUiColorInputFieldTextStyleTheme(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiColorInputFieldTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiColorInputFieldAssetsTheme {
  const ImpaktfullUiColorInputFieldAssetsTheme();

  ImpaktfullUiColorInputFieldAssetsTheme copyWith() =>
      const ImpaktfullUiColorInputFieldAssetsTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiColorInputFieldAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiColorInputFieldColorTheme {
  final Color border;

  const ImpaktfullUiColorInputFieldColorTheme({
    required this.border,
  });

  ImpaktfullUiColorInputFieldColorTheme copyWith({
    Color? border,
  }) =>
      ImpaktfullUiColorInputFieldColorTheme(
        border: border ?? this.border,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiColorInputFieldColorTheme && border == other.border;

  @override
  int get hashCode => border.hashCode;
}

class ImpaktfullUiColorInputFieldDimensTheme {
  final BorderRadiusGeometry borderRadius;

  const ImpaktfullUiColorInputFieldDimensTheme({
    required this.borderRadius,
  });

  ImpaktfullUiColorInputFieldDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
  }) =>
      ImpaktfullUiColorInputFieldDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiColorInputFieldDimensTheme &&
          borderRadius == other.borderRadius;

  @override
  int get hashCode => borderRadius.hashCode;
}

class ImpaktfullUiColorInputFieldTextStyleTheme {
  const ImpaktfullUiColorInputFieldTextStyleTheme();

  ImpaktfullUiColorInputFieldTextStyleTheme copyWith() =>
      const ImpaktfullUiColorInputFieldTextStyleTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiColorInputFieldTextStyleTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}
