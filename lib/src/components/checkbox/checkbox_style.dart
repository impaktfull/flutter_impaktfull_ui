import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiCheckboxTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiCheckboxColorTheme colors;
  final ImpaktfullUiCheckboxDimensTheme dimens;
  final ImpaktfullUiCheckboxDurationsTheme durations;
  final ImpaktfullUiCheckboxAssetsTheme assets;

  const ImpaktfullUiCheckboxTheme({
    required this.colors,
    required this.dimens,
    required this.durations,
    required this.assets,
  });

  static ImpaktfullUiCheckboxTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.checkbox;

  static ImpaktfullUiCheckboxTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiCheckboxTheme(
        assets: ImpaktfullUiCheckboxAssetsTheme(
          check: assets.icons.check,
          indeterminate: assets.icons.minus,
        ),
        colors: ImpaktfullUiCheckboxColorTheme(
          borderColor: colors.border,
          activeColor: colors.accent,
          inactiveColor: colors.card,
          checkMarkColor: colors.textOnAccent,
          backgroundColor: colors.card,
        ),
        dimens: ImpaktfullUiCheckboxDimensTheme(
          borderRadius: dimens.borderRadiusSmall,
        ),
        durations: ImpaktfullUiCheckboxDurationsTheme(
          selected: durations.short,
        ),
      );

  ImpaktfullUiCheckboxTheme copyWith({
    ImpaktfullUiCheckboxColorTheme? colors,
    ImpaktfullUiCheckboxDimensTheme? dimens,
    ImpaktfullUiCheckboxDurationsTheme? durations,
    ImpaktfullUiCheckboxAssetsTheme? assets,
  }) =>
      ImpaktfullUiCheckboxTheme(
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        assets: assets ?? this.assets,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiCheckboxTheme &&
          colors == other.colors &&
          dimens == other.dimens &&
          durations == other.durations &&
          assets == other.assets;

  @override
  int get hashCode => Object.hash(colors, dimens, durations, assets);
}

class ImpaktfullUiCheckboxAssetsTheme {
  final ImpaktfullUiAsset check;
  final ImpaktfullUiAsset? _indeterminate;

  // `indeterminate` becomes `required` again in 1.0.0, when `indermediate` is
  // removed.
  const ImpaktfullUiCheckboxAssetsTheme({
    required this.check,
    ImpaktfullUiAsset? indeterminate,
    @Deprecated('Use indeterminate instead. Will be removed in 1.0.0.')
    ImpaktfullUiAsset? indermediate,
  })  : assert(indeterminate != null || indermediate != null,
            'indeterminate is required'),
        _indeterminate = indeterminate ?? indermediate;

  ImpaktfullUiAsset get indeterminate => _indeterminate!;

  @Deprecated('Use indeterminate instead. Will be removed in 1.0.0.')
  ImpaktfullUiAsset get indermediate => indeterminate;

  ImpaktfullUiCheckboxAssetsTheme copyWith({
    ImpaktfullUiAsset? check,
    ImpaktfullUiAsset? indeterminate,
    @Deprecated('Use indeterminate instead. Will be removed in 1.0.0.')
    ImpaktfullUiAsset? indermediate,
  }) =>
      ImpaktfullUiCheckboxAssetsTheme(
        check: check ?? this.check,
        indeterminate: indeterminate ?? indermediate ?? this.indeterminate,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiCheckboxAssetsTheme &&
          check == other.check &&
          _indeterminate == other._indeterminate;

  @override
  int get hashCode => Object.hash(check, _indeterminate);
}

class ImpaktfullUiCheckboxColorTheme {
  final Color borderColor;
  final Color activeColor;
  final Color inactiveColor;
  final Color checkMarkColor;
  final Color backgroundColor;

  const ImpaktfullUiCheckboxColorTheme({
    required this.borderColor,
    required this.activeColor,
    required this.inactiveColor,
    required this.checkMarkColor,
    required this.backgroundColor,
  });

  ImpaktfullUiCheckboxColorTheme copyWith({
    Color? borderColor,
    Color? activeColor,
    Color? inactiveColor,
    Color? checkMarkColor,
    Color? backgroundColor,
  }) =>
      ImpaktfullUiCheckboxColorTheme(
        borderColor: borderColor ?? this.borderColor,
        activeColor: activeColor ?? this.activeColor,
        inactiveColor: inactiveColor ?? this.inactiveColor,
        checkMarkColor: checkMarkColor ?? this.checkMarkColor,
        backgroundColor: backgroundColor ?? this.backgroundColor,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiCheckboxColorTheme &&
          borderColor == other.borderColor &&
          activeColor == other.activeColor &&
          inactiveColor == other.inactiveColor &&
          checkMarkColor == other.checkMarkColor &&
          backgroundColor == other.backgroundColor;

  @override
  int get hashCode => Object.hash(
      borderColor, activeColor, inactiveColor, checkMarkColor, backgroundColor);
}

class ImpaktfullUiCheckboxDimensTheme {
  final BorderRadiusGeometry borderRadius;

  /// Opt-in: the minimum size of the tap area, e.g. `Size.square(48)` for
  /// the Android and `Size.square(44)` for the iOS tap target guideline.
  ///
  /// The checkbox looks the same, but takes at least this much space in the
  /// layout. Null (the default) keeps the size of the checkbox.
  final Size? minTapTargetSize;

  /// The width and the height of the box of the checkbox, e.g. 16 for both
  /// shadcn/ui's `size-4` and Ant Design's `controlInteractiveSize`.
  ///
  /// [minTapTargetSize] keeps the tap area of the checkbox large enough
  /// without changing this.
  final double size;

  /// The size of the check mark and of the indeterminate mark inside the box.
  final double iconSize;

  /// The width of the border of an unchecked box.
  final double borderWidth;

  /// The width of the border of a checked (or indeterminate) box, which is
  /// drawn in `activeColor` over the background.
  final double activeBorderWidth;

  // `size`, `iconSize`, `borderWidth` and `activeBorderWidth` are optional,
  // with the value the widget hardcoded before they were tokens as their
  // default. They become `required` in 1.0.0.
  const ImpaktfullUiCheckboxDimensTheme({
    required this.borderRadius,
    this.minTapTargetSize,
    this.size = 24,
    this.iconSize = 20,
    this.borderWidth = 1,
    this.activeBorderWidth = 2,
  });

  ImpaktfullUiCheckboxDimensTheme copyWith({
    double? activeBorderWidth,
    BorderRadiusGeometry? borderRadius,
    double? borderWidth,
    double? iconSize,
    Size? minTapTargetSize,
    double? size,
  }) =>
      ImpaktfullUiCheckboxDimensTheme(
        activeBorderWidth: activeBorderWidth ?? this.activeBorderWidth,
        borderRadius: borderRadius ?? this.borderRadius,
        borderWidth: borderWidth ?? this.borderWidth,
        iconSize: iconSize ?? this.iconSize,
        minTapTargetSize: minTapTargetSize ?? this.minTapTargetSize,
        size: size ?? this.size,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiCheckboxDimensTheme &&
          borderRadius == other.borderRadius &&
          minTapTargetSize == other.minTapTargetSize &&
          size == other.size &&
          iconSize == other.iconSize &&
          borderWidth == other.borderWidth &&
          activeBorderWidth == other.activeBorderWidth;

  @override
  int get hashCode => Object.hash(borderRadius, minTapTargetSize, size,
      iconSize, borderWidth, activeBorderWidth);
}

class ImpaktfullUiCheckboxDurationsTheme {
  final Duration selected;
  const ImpaktfullUiCheckboxDurationsTheme({
    required this.selected,
  });

  ImpaktfullUiCheckboxDurationsTheme copyWith({
    Duration? selected,
  }) =>
      ImpaktfullUiCheckboxDurationsTheme(
        selected: selected ?? this.selected,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiCheckboxDurationsTheme && selected == other.selected;

  @override
  int get hashCode => selected.hashCode;
}
