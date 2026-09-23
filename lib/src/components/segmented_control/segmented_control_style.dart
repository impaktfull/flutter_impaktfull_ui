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
        durations: const ImpaktfullUiSegmentedControlDurationsTheme(),
        textStyles: ImpaktfullUiSegmentedControlTextStyleTheme(
          label: textStyles.onCanvas.text.small,
          activeLabel: textStyles.onCard.text.small,
        ),
      );
}

class ImpaktfullUiSegmentedControlAssetsTheme {
  const ImpaktfullUiSegmentedControlAssetsTheme();

  ImpaktfullUiSegmentedControlAssetsTheme copyWith() =>
      const ImpaktfullUiSegmentedControlAssetsTheme();
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
}

class ImpaktfullUiSegmentedControlDimensTheme {
  final BorderRadiusGeometry borderRadius;
  final EdgeInsets padding;

  /// The height of the control.
  final double height;

  const ImpaktfullUiSegmentedControlDimensTheme({
    required this.borderRadius,
    required this.padding,
    this.height = 56,
  });

  ImpaktfullUiSegmentedControlDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    double? height,
    EdgeInsets? padding,
  }) =>
      ImpaktfullUiSegmentedControlDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        height: height ?? this.height,
        padding: padding ?? this.padding,
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
}
