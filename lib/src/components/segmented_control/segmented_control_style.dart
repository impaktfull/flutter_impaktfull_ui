import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiSegmentedControlTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSegmentedControlAssetsTheme assets;
  final ImpaktfullUiSegmentedControlColorTheme colors;
  final ImpaktfullUiSegmentedControlDimensTheme dimens;
  final ImpaktfullUiSegmentedControlDurationsTheme durations;
  final ImpaktfullUiSegmentedControlTextStyleTheme textStyles;

  const ImpaktfullUiSegmentedControlTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    this.durations = const ImpaktfullUiSegmentedControlDurationsTheme(),
    required this.textStyles,
  });

  ImpaktfullUiSegmentedControlTheme copyWith({
    ImpaktfullUiSegmentedControlAssetsTheme? assets,
    ImpaktfullUiSegmentedControlColorTheme? colors,
    ImpaktfullUiSegmentedControlDimensTheme? dimens,
    ImpaktfullUiSegmentedControlDurationsTheme? durations,
    ImpaktfullUiSegmentedControlTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiSegmentedControlTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiSegmentedControlTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.segmentedControl;

  static ImpaktfullUiSegmentedControlTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiSegmentedControlTheme(
        assets: const ImpaktfullUiSegmentedControlAssetsTheme(),
        colors: ImpaktfullUiSegmentedControlColorTheme(
          background: colors.canvas,
          border: Colors.transparent,
          activeBackground: colors.card,
          activeBorder: colors.border,
        ),
        dimens: ImpaktfullUiSegmentedControlDimensTheme(
          borderRadius: dimens.borderRadius,
          padding: EdgeInsets.zero,
        ),
        durations: ImpaktfullUiSegmentedControlDurationsTheme(
          selected: durations.short,
        ),
        textStyles: ImpaktfullUiSegmentedControlTextStyleTheme(
          label: textStyles.onCanvas.text.small,
          activeLabel: textStyles.onCard.text.small,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSegmentedControlTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          durations == other.durations &&
          textStyles == other.textStyles;

  @override
  int get hashCode =>
      Object.hash(assets, colors, dimens, durations, textStyles);
}

class ImpaktfullUiSegmentedControlAssetsTheme {
  const ImpaktfullUiSegmentedControlAssetsTheme();

  ImpaktfullUiSegmentedControlAssetsTheme copyWith() =>
      const ImpaktfullUiSegmentedControlAssetsTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiSegmentedControlAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiSegmentedControlColorTheme {
  final Color background;
  final Color border;
  final Color activeBackground;
  final Color activeBorder;
  const ImpaktfullUiSegmentedControlColorTheme({
    required this.background,
    required this.border,
    required this.activeBackground,
    required this.activeBorder,
  });

  ImpaktfullUiSegmentedControlColorTheme copyWith({
    Color? activeBackground,
    Color? activeBorder,
    Color? background,
    Color? border,
  }) =>
      ImpaktfullUiSegmentedControlColorTheme(
        activeBackground: activeBackground ?? this.activeBackground,
        activeBorder: activeBorder ?? this.activeBorder,
        background: background ?? this.background,
        border: border ?? this.border,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSegmentedControlColorTheme &&
          background == other.background &&
          border == other.border &&
          activeBackground == other.activeBackground &&
          activeBorder == other.activeBorder;

  @override
  int get hashCode =>
      Object.hash(background, border, activeBackground, activeBorder);
}

class ImpaktfullUiSegmentedControlDimensTheme {
  final BorderRadiusGeometry borderRadius;
  final EdgeInsets padding;

  /// The radius of the indicator behind the selected item.
  ///
  /// `null` (the default) gives it [borderRadius], which is what the control
  /// always did. A track and the box inside it have a radius of their own in
  /// both design systems (`rounded-lg` with a `rounded-md` trigger,
  /// `borderRadius` inside `borderRadiusLG`).
  final BorderRadiusGeometry? activeBorderRadius;

  /// The space between the indicator and the item next to it.
  final double activeSpacing;

  /// The space between two items of the control.
  final double spacing;

  /// The height of the control.
  final double height;

  const ImpaktfullUiSegmentedControlDimensTheme({
    required this.borderRadius,
    required this.padding,
    this.activeBorderRadius,
    this.activeSpacing = 2,
    this.spacing = 4,
    this.height = 56,
  });

  ImpaktfullUiSegmentedControlDimensTheme copyWith({
    BorderRadiusGeometry? activeBorderRadius,
    double? activeSpacing,
    BorderRadiusGeometry? borderRadius,
    double? height,
    EdgeInsets? padding,
    double? spacing,
  }) =>
      ImpaktfullUiSegmentedControlDimensTheme(
        activeBorderRadius: activeBorderRadius ?? this.activeBorderRadius,
        activeSpacing: activeSpacing ?? this.activeSpacing,
        borderRadius: borderRadius ?? this.borderRadius,
        height: height ?? this.height,
        padding: padding ?? this.padding,
        spacing: spacing ?? this.spacing,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSegmentedControlDimensTheme &&
          borderRadius == other.borderRadius &&
          activeBorderRadius == other.activeBorderRadius &&
          activeSpacing == other.activeSpacing &&
          spacing == other.spacing &&
          padding == other.padding &&
          height == other.height;

  @override
  int get hashCode => Object.hash(
        borderRadius,
        activeBorderRadius,
        activeSpacing,
        spacing,
        padding,
        height,
      );
}

class ImpaktfullUiSegmentedControlDurationsTheme {
  /// How long the indicator takes to slide to the selected item.
  final Duration selected;

  const ImpaktfullUiSegmentedControlDurationsTheme({
    this.selected = const Duration(milliseconds: 200),
  });

  ImpaktfullUiSegmentedControlDurationsTheme copyWith({
    Duration? selected,
  }) =>
      ImpaktfullUiSegmentedControlDurationsTheme(
        selected: selected ?? this.selected,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSegmentedControlDurationsTheme &&
          selected == other.selected;

  @override
  int get hashCode => selected.hashCode;
}

class ImpaktfullUiSegmentedControlTextStyleTheme {
  final TextStyle label;
  final TextStyle activeLabel;

  const ImpaktfullUiSegmentedControlTextStyleTheme({
    required this.label,
    required this.activeLabel,
  });

  ImpaktfullUiSegmentedControlTextStyleTheme copyWith({
    TextStyle? activeLabel,
    TextStyle? label,
  }) =>
      ImpaktfullUiSegmentedControlTextStyleTheme(
        activeLabel: activeLabel ?? this.activeLabel,
        label: label ?? this.label,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSegmentedControlTextStyleTheme &&
          label == other.label &&
          activeLabel == other.activeLabel;

  @override
  int get hashCode => Object.hash(label, activeLabel);
}
