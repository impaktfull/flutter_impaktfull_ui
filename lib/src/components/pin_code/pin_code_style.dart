import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiPinCodeTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiPinCodeAssetsTheme assets;
  final ImpaktfullUiPinCodeColorTheme colors;
  final ImpaktfullUiPinCodeDimensTheme dimens;
  final ImpaktfullUiPinCodeDurationsTheme durations;
  final ImpaktfullUiPinCodeTextStyleTheme textStyles;

  const ImpaktfullUiPinCodeTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.durations,
    required this.textStyles,
  });

  ImpaktfullUiPinCodeTheme copyWith({
    ImpaktfullUiPinCodeAssetsTheme? assets,
    ImpaktfullUiPinCodeColorTheme? colors,
    ImpaktfullUiPinCodeDimensTheme? dimens,
    ImpaktfullUiPinCodeDurationsTheme? durations,
    ImpaktfullUiPinCodeTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiPinCodeTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiPinCodeTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.pinCode;

  static ImpaktfullUiPinCodeTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiPinCodeTheme(
        assets: ImpaktfullUiPinCodeAssetsTheme(
          backspace: assets.icons.backspace,
          check: assets.icons.check,
        ),
        colors: ImpaktfullUiPinCodeColorTheme(
          valueBackgroundSelected: colors.accent,
          valueBackground: colors.card,
          valueBorder: colors.border,
        ),
        dimens: ImpaktfullUiPinCodeDimensTheme(
          valueBorderRadius: dimens.borderRadius,
        ),
        durations: ImpaktfullUiPinCodeDurationsTheme(
          submitOpacity: durations.short,
        ),
        textStyles: const ImpaktfullUiPinCodeTextStyleTheme(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiPinCodeTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          durations == other.durations &&
          textStyles == other.textStyles;

  @override
  int get hashCode =>
      Object.hash(assets, colors, dimens, durations, textStyles);
}

class ImpaktfullUiPinCodeAssetsTheme {
  final ImpaktfullUiAsset backspace;
  final ImpaktfullUiAsset check;

  const ImpaktfullUiPinCodeAssetsTheme({
    required this.backspace,
    required this.check,
  });

  ImpaktfullUiPinCodeAssetsTheme copyWith({
    ImpaktfullUiAsset? backspace,
    ImpaktfullUiAsset? check,
  }) =>
      ImpaktfullUiPinCodeAssetsTheme(
        backspace: backspace ?? this.backspace,
        check: check ?? this.check,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiPinCodeAssetsTheme &&
          backspace == other.backspace &&
          check == other.check;

  @override
  int get hashCode => Object.hash(backspace, check);
}

class ImpaktfullUiPinCodeColorTheme {
  final Color valueBackground;
  final Color valueBackgroundSelected;
  final Color valueBorder;

  const ImpaktfullUiPinCodeColorTheme({
    required this.valueBackground,
    required this.valueBackgroundSelected,
    required this.valueBorder,
  });

  ImpaktfullUiPinCodeColorTheme copyWith({
    Color? valueBackground,
    Color? valueBackgroundSelected,
    Color? valueBorder,
  }) =>
      ImpaktfullUiPinCodeColorTheme(
        valueBackground: valueBackground ?? this.valueBackground,
        valueBackgroundSelected:
            valueBackgroundSelected ?? this.valueBackgroundSelected,
        valueBorder: valueBorder ?? this.valueBorder,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiPinCodeColorTheme &&
          valueBackground == other.valueBackground &&
          valueBackgroundSelected == other.valueBackgroundSelected &&
          valueBorder == other.valueBorder;

  @override
  int get hashCode =>
      Object.hash(valueBackground, valueBackgroundSelected, valueBorder);
}

class ImpaktfullUiPinCodeDimensTheme {
  final BorderRadiusGeometry valueBorderRadius;

  const ImpaktfullUiPinCodeDimensTheme({
    required this.valueBorderRadius,
  });

  ImpaktfullUiPinCodeDimensTheme copyWith({
    BorderRadiusGeometry? valueBorderRadius,
  }) =>
      ImpaktfullUiPinCodeDimensTheme(
        valueBorderRadius: valueBorderRadius ?? this.valueBorderRadius,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiPinCodeDimensTheme &&
          valueBorderRadius == other.valueBorderRadius;

  @override
  int get hashCode => valueBorderRadius.hashCode;
}

class ImpaktfullUiPinCodeDurationsTheme {
  final Duration submitOpacity;

  const ImpaktfullUiPinCodeDurationsTheme({
    required this.submitOpacity,
  });

  ImpaktfullUiPinCodeDurationsTheme copyWith({
    Duration? submitOpacity,
  }) =>
      ImpaktfullUiPinCodeDurationsTheme(
        submitOpacity: submitOpacity ?? this.submitOpacity,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiPinCodeDurationsTheme &&
          submitOpacity == other.submitOpacity;

  @override
  int get hashCode => submitOpacity.hashCode;
}

class ImpaktfullUiPinCodeTextStyleTheme {
  const ImpaktfullUiPinCodeTextStyleTheme();

  ImpaktfullUiPinCodeTextStyleTheme copyWith() =>
      const ImpaktfullUiPinCodeTextStyleTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiPinCodeTextStyleTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}
