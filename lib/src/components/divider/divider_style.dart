import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiDividerTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiDividerColorTheme colors;
  final ImpaktfullUiDividerDimensTheme dimens;

  const ImpaktfullUiDividerTheme({
    required this.colors,
    required this.dimens,
  });

  static ImpaktfullUiDividerTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.divider;

  static ImpaktfullUiDividerTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiDividerTheme(
        colors: ImpaktfullUiDividerColorTheme(
          color: colors.border,
        ),
        dimens: const ImpaktfullUiDividerDimensTheme(
          margin: EdgeInsets.zero,
          thickness: 1,
        ),
      );
}

class ImpaktfullUiDividerColorTheme {
  final Color color;

  const ImpaktfullUiDividerColorTheme({
    required this.color,
  });
}

class ImpaktfullUiDividerDimensTheme {
  final EdgeInsetsGeometry margin;
  final double thickness;

  const ImpaktfullUiDividerDimensTheme({
    required this.margin,
    required this.thickness,
  });
}
