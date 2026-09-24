import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiNumberInputTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiNumberInputAssetsTheme assets;
  final ImpaktfullUiNumberInputColorTheme colors;
  final ImpaktfullUiNumberInputDimensTheme dimens;
  final ImpaktfullUiNumberInputTextStyleTheme textStyles;

  const ImpaktfullUiNumberInputTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiNumberInputTheme copyWith({
    ImpaktfullUiNumberInputAssetsTheme? assets,
    ImpaktfullUiNumberInputColorTheme? colors,
    ImpaktfullUiNumberInputDimensTheme? dimens,
    ImpaktfullUiNumberInputTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiNumberInputTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiNumberInputTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.numberInput;

  static ImpaktfullUiNumberInputTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiNumberInputTheme(
        assets: ImpaktfullUiNumberInputAssetsTheme(
          minus: assets.icons.minus,
          plus: assets.icons.add,
        ),
        colors: const ImpaktfullUiNumberInputColorTheme(),
        dimens: const ImpaktfullUiNumberInputDimensTheme(),
        textStyles: const ImpaktfullUiNumberInputTextStyleTheme(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiNumberInputTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiNumberInputAssetsTheme {
  final ImpaktfullUiAsset minus;
  final ImpaktfullUiAsset plus;

  const ImpaktfullUiNumberInputAssetsTheme({
    required this.minus,
    required this.plus,
  });

  ImpaktfullUiNumberInputAssetsTheme copyWith({
    ImpaktfullUiAsset? minus,
    ImpaktfullUiAsset? plus,
  }) =>
      ImpaktfullUiNumberInputAssetsTheme(
        minus: minus ?? this.minus,
        plus: plus ?? this.plus,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiNumberInputAssetsTheme &&
          minus == other.minus &&
          plus == other.plus;

  @override
  int get hashCode => Object.hash(minus, plus);
}

class ImpaktfullUiNumberInputColorTheme {
  const ImpaktfullUiNumberInputColorTheme();

  ImpaktfullUiNumberInputColorTheme copyWith() =>
      const ImpaktfullUiNumberInputColorTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiNumberInputColorTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiNumberInputDimensTheme {
  /// The space between the input field and the decrement and increment
  /// buttons.
  ///
  /// It is optional, with the value the widget hardcoded before it was a token
  /// as its default. It becomes `required` in 1.0.0.
  final double spacing;

  const ImpaktfullUiNumberInputDimensTheme({
    this.spacing = 8,
  });

  ImpaktfullUiNumberInputDimensTheme copyWith({
    double? spacing,
  }) =>
      ImpaktfullUiNumberInputDimensTheme(
        spacing: spacing ?? this.spacing,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiNumberInputDimensTheme && spacing == other.spacing;

  @override
  int get hashCode => spacing.hashCode;
}

class ImpaktfullUiNumberInputTextStyleTheme {
  const ImpaktfullUiNumberInputTextStyleTheme();

  ImpaktfullUiNumberInputTextStyleTheme copyWith() =>
      const ImpaktfullUiNumberInputTextStyleTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiNumberInputTextStyleTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}
