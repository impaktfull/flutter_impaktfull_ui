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
}

class ImpaktfullUiNumberInputColorTheme {
  const ImpaktfullUiNumberInputColorTheme();

  ImpaktfullUiNumberInputColorTheme copyWith() =>
      const ImpaktfullUiNumberInputColorTheme();
}

class ImpaktfullUiNumberInputDimensTheme {
  const ImpaktfullUiNumberInputDimensTheme();

  ImpaktfullUiNumberInputDimensTheme copyWith() =>
      const ImpaktfullUiNumberInputDimensTheme();
}

class ImpaktfullUiNumberInputTextStyleTheme {
  const ImpaktfullUiNumberInputTextStyleTheme();

  ImpaktfullUiNumberInputTextStyleTheme copyWith() =>
      const ImpaktfullUiNumberInputTextStyleTheme();
}
