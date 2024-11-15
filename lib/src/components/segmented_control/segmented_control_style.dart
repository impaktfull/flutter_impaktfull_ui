import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

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
        ),
        textStyles: ImpaktfullUiSegmentedControlTextStyleTheme(
          label: textStyles.onCanvas.text.small,
          activeLabel: textStyles.onCard.text.small,
        ),
      );
}

class ImpaktfullUiSegmentedControlAssetsTheme {
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
}

class ImpaktfullUiSegmentedControlDimensTheme {
  final BorderRadiusGeometry borderRadius;
  const ImpaktfullUiSegmentedControlDimensTheme({
    required this.borderRadius,
  });
}

class ImpaktfullUiSegmentedControlTextStyleTheme {
  final TextStyle label;
  final TextStyle activeLabel;

  const ImpaktfullUiSegmentedControlTextStyleTheme({
    required this.label,
    required this.activeLabel,
  });
}
