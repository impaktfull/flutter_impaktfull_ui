import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiPasswordStrengthIndicatorTheme
    extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiPasswordStrengthIndicatorAssetsTheme assets;
  final ImpaktfullUiPasswordStrengthIndicatorColorTheme colors;
  final ImpaktfullUiPasswordStrengthIndicatorDimensTheme dimens;
  final ImpaktfullUiPasswordStrengthIndicatorTextStyleTheme textStyles;

  const ImpaktfullUiPasswordStrengthIndicatorTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiPasswordStrengthIndicatorTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.passwordStrengthIndicator;

  static ImpaktfullUiPasswordStrengthIndicatorTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiPasswordStrengthIndicatorTheme(
        assets: const ImpaktfullUiPasswordStrengthIndicatorAssetsTheme(),
        colors: ImpaktfullUiPasswordStrengthIndicatorColorTheme(
          requirement: colors.text,
          strengthIndicators: [
            colors.error,
            colors.warning,
            colors.info,
            colors.success,
          ],
          strengthIndicatorBackground: colors.card2,
        ),
        dimens: ImpaktfullUiPasswordStrengthIndicatorDimensTheme(
          spacing: 8,
          requirementSpacing: 4,
          strengthIndicatorBorderRadius: BorderRadius.circular(4),
        ),
        textStyles: ImpaktfullUiPasswordStrengthIndicatorTextStyleTheme(
          requirement: textStyles.onCard.text.small,
        ),
      );
}

class ImpaktfullUiPasswordStrengthIndicatorAssetsTheme {
  const ImpaktfullUiPasswordStrengthIndicatorAssetsTheme();
}

class ImpaktfullUiPasswordStrengthIndicatorColorTheme {
  final Color requirement;
  final List<Color> strengthIndicators;
  final Color strengthIndicatorBackground;

  const ImpaktfullUiPasswordStrengthIndicatorColorTheme({
    required this.requirement,
    required this.strengthIndicators,
    required this.strengthIndicatorBackground,
  });
}

class ImpaktfullUiPasswordStrengthIndicatorDimensTheme {
  final double spacing;
  final double requirementSpacing;
  final BorderRadiusGeometry strengthIndicatorBorderRadius;
  const ImpaktfullUiPasswordStrengthIndicatorDimensTheme({
    required this.spacing,
    required this.requirementSpacing,
    required this.strengthIndicatorBorderRadius,
  });
}

class ImpaktfullUiPasswordStrengthIndicatorTextStyleTheme {
  final TextStyle requirement;
  const ImpaktfullUiPasswordStrengthIndicatorTextStyleTheme({
    required this.requirement,
  });
}
