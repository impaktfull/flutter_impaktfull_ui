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

  /// The width and the height of the swatch that shows (and opens) the color.
  final double swatchSize;

  /// The width of the border of the swatch.
  final double borderWidth;

  /// The space between the swatch and the hex input field.
  final double spacing;

  // Every parameter below `borderRadius` is optional, with the value the widget
  // hardcoded before it was a token as its default. They become `required` in
  // 1.0.0.
  const ImpaktfullUiColorInputFieldDimensTheme({
    required this.borderRadius,
    this.swatchSize = 40,
    this.borderWidth = 1,
    this.spacing = 8,
  });

  ImpaktfullUiColorInputFieldDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    double? borderWidth,
    double? spacing,
    double? swatchSize,
  }) =>
      ImpaktfullUiColorInputFieldDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        borderWidth: borderWidth ?? this.borderWidth,
        spacing: spacing ?? this.spacing,
        swatchSize: swatchSize ?? this.swatchSize,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiColorInputFieldDimensTheme &&
          borderRadius == other.borderRadius &&
          swatchSize == other.swatchSize &&
          borderWidth == other.borderWidth &&
          spacing == other.spacing;

  @override
  int get hashCode =>
      Object.hash(borderRadius, swatchSize, borderWidth, spacing);
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
