import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiSegmentedControlTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSegmentedControlAssetsTheme assets;
  final ImpaktfullUiSegmentedControlColorTheme colors;
  final ImpaktfullUiSegmentedControlDimensTheme dimens;
  final ImpaktfullUiSegmentedControlTextStyleTheme textStyles;

  const ImpaktfullUiSegmentedControlTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiSegmentedControlTheme copyWith({
    ImpaktfullUiSegmentedControlAssetsTheme? assets,
    ImpaktfullUiSegmentedControlColorTheme? colors,
    ImpaktfullUiSegmentedControlDimensTheme? dimens,
    ImpaktfullUiSegmentedControlTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiSegmentedControlTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
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
  const ImpaktfullUiSegmentedControlDimensTheme({
    required this.borderRadius,
    required this.padding,
  });

  ImpaktfullUiSegmentedControlDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    EdgeInsets? padding,
  }) =>
      ImpaktfullUiSegmentedControlDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        padding: padding ?? this.padding,
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
