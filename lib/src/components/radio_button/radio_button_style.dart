import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiRadioButtonTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiRadioButtonAssetsTheme assets;
  final ImpaktfullUiRadioButtonColorTheme colors;
  final ImpaktfullUiRadioButtonDimensTheme dimens;
  final ImpaktfullUiRadioButtonTextStyleTheme textStyles;

  const ImpaktfullUiRadioButtonTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiRadioButtonTheme copyWith({
    ImpaktfullUiRadioButtonAssetsTheme? assets,
    ImpaktfullUiRadioButtonColorTheme? colors,
    ImpaktfullUiRadioButtonDimensTheme? dimens,
    ImpaktfullUiRadioButtonTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiRadioButtonTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiRadioButtonTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.radioButton;

  static ImpaktfullUiRadioButtonTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiRadioButtonTheme(
        assets: const ImpaktfullUiRadioButtonAssetsTheme(),
        colors: ImpaktfullUiRadioButtonColorTheme(
          selected: colors.accent,
          unselected: colors.card,
          border: colors.border,
          centerSelectedBackground: colors.card,
          centerUnSelectedBackground: Colors.transparent,
        ),
        dimens: ImpaktfullUiRadioButtonDimensTheme(
          borderRadius: dimens.borderRadiusCircle,
        ),
        textStyles: const ImpaktfullUiRadioButtonTextStyleTheme(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiRadioButtonTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiRadioButtonAssetsTheme {
  const ImpaktfullUiRadioButtonAssetsTheme();

  ImpaktfullUiRadioButtonAssetsTheme copyWith() =>
      const ImpaktfullUiRadioButtonAssetsTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiRadioButtonAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiRadioButtonColorTheme {
  final Color selected;
  final Color unselected;
  final Color border;
  final Color centerSelectedBackground;
  final Color centerUnSelectedBackground;
  const ImpaktfullUiRadioButtonColorTheme({
    required this.selected,
    required this.unselected,
    required this.border,
    required this.centerSelectedBackground,
    required this.centerUnSelectedBackground,
  });

  ImpaktfullUiRadioButtonColorTheme copyWith({
    Color? border,
    Color? centerSelectedBackground,
    Color? centerUnSelectedBackground,
    Color? selected,
    Color? unselected,
  }) =>
      ImpaktfullUiRadioButtonColorTheme(
        border: border ?? this.border,
        centerSelectedBackground:
            centerSelectedBackground ?? this.centerSelectedBackground,
        centerUnSelectedBackground:
            centerUnSelectedBackground ?? this.centerUnSelectedBackground,
        selected: selected ?? this.selected,
        unselected: unselected ?? this.unselected,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiRadioButtonColorTheme &&
          selected == other.selected &&
          unselected == other.unselected &&
          border == other.border &&
          centerSelectedBackground == other.centerSelectedBackground &&
          centerUnSelectedBackground == other.centerUnSelectedBackground;

  @override
  int get hashCode => Object.hash(selected, unselected, border,
      centerSelectedBackground, centerUnSelectedBackground);
}

class ImpaktfullUiRadioButtonDimensTheme {
  final BorderRadiusGeometry borderRadius;

  /// Opt-in: the minimum size of the tap area, e.g. `Size.square(48)` for
  /// the Android and `Size.square(44)` for the iOS tap target guideline.
  ///
  /// The radio button looks the same, but takes at least this much space in the
  /// layout. Null (the default) keeps the size of the radio button.
  final Size? minTapTargetSize;
  const ImpaktfullUiRadioButtonDimensTheme({
    required this.borderRadius,
    this.minTapTargetSize,
  });

  ImpaktfullUiRadioButtonDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    Size? minTapTargetSize,
  }) =>
      ImpaktfullUiRadioButtonDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        minTapTargetSize: minTapTargetSize ?? this.minTapTargetSize,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiRadioButtonDimensTheme &&
          borderRadius == other.borderRadius &&
          minTapTargetSize == other.minTapTargetSize;

  @override
  int get hashCode => Object.hash(borderRadius, minTapTargetSize);
}

class ImpaktfullUiRadioButtonTextStyleTheme {
  const ImpaktfullUiRadioButtonTextStyleTheme();

  ImpaktfullUiRadioButtonTextStyleTheme copyWith() =>
      const ImpaktfullUiRadioButtonTextStyleTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiRadioButtonTextStyleTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}
