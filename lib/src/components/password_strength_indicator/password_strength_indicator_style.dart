import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiPasswordStrengthIndicatorTheme
    extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiPasswordStrengthIndicatorAssetsTheme assets;
  final ImpaktfullUiPasswordStrengthIndicatorColorTheme colors;
  final ImpaktfullUiPasswordStrengthIndicatorDimensTheme dimens;
  final ImpaktfullUiPasswordStrengthIndicatorDurationsTheme durations;
  final ImpaktfullUiPasswordStrengthIndicatorTextStyleTheme textStyles;

  const ImpaktfullUiPasswordStrengthIndicatorTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.durations,
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
        assets: ImpaktfullUiPasswordStrengthIndicatorAssetsTheme(
          leadingRequirement: assets.icons.closeCircle,
          leadingRequirementIsMet: assets.icons.checkCircle,
        ),
        colors: ImpaktfullUiPasswordStrengthIndicatorColorTheme(
          strengthIndicators: [
            colors.error,
            colors.warning,
            colors.info,
            colors.success,
          ],
          strengthIndicatorBackground: colors.card2,
          requirementAsset: colors.text,
          requirementAssetIsMet: colors.success,
        ),
        dimens: ImpaktfullUiPasswordStrengthIndicatorDimensTheme(
          spacing: 8,
          requirementSpacing: 4,
          strengthIndicatorBorderRadius: BorderRadius.circular(4),
        ),
        durations: ImpaktfullUiPasswordStrengthIndicatorDurationsTheme(
          colorChangeDuration: durations.short,
        ),
        textStyles: ImpaktfullUiPasswordStrengthIndicatorTextStyleTheme(
          requirement: textStyles.onCard.text.small,
          requirementIsMet:
              textStyles.onCard.text.small.copyWith(color: colors.success),
        ),
      );
}

class ImpaktfullUiPasswordStrengthIndicatorAssetsTheme {
  final ImpaktfullUiAsset? leadingRequirement;
  final ImpaktfullUiAsset? leadingRequirementIsMet;

  const ImpaktfullUiPasswordStrengthIndicatorAssetsTheme({
    ImpaktfullUiAsset? leadingRequirement,
    ImpaktfullUiAsset? leadingRequirementIsMet,
    @Deprecated('Use leadingRequirement instead. Will be removed in 1.0.0.')
    ImpaktfullUiAsset? leadingRequerement,
    @Deprecated(
        'Use leadingRequirementIsMet instead. Will be removed in 1.0.0.')
    ImpaktfullUiAsset? leadingRequerementIsMet,
  })  : leadingRequirement = leadingRequirement ?? leadingRequerement,
        leadingRequirementIsMet =
            leadingRequirementIsMet ?? leadingRequerementIsMet;

  @Deprecated('Use leadingRequirement instead. Will be removed in 1.0.0.')
  ImpaktfullUiAsset? get leadingRequerement => leadingRequirement;

  @Deprecated('Use leadingRequirementIsMet instead. Will be removed in 1.0.0.')
  ImpaktfullUiAsset? get leadingRequerementIsMet => leadingRequirementIsMet;
}

class ImpaktfullUiPasswordStrengthIndicatorColorTheme {
  final List<Color> strengthIndicators;
  final Color strengthIndicatorBackground;
  final Color requirementAsset;
  final Color requirementAssetIsMet;

  const ImpaktfullUiPasswordStrengthIndicatorColorTheme({
    required this.strengthIndicators,
    required this.strengthIndicatorBackground,
    required this.requirementAsset,
    required this.requirementAssetIsMet,
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

class ImpaktfullUiPasswordStrengthIndicatorDurationsTheme {
  final Duration colorChangeDuration;
  const ImpaktfullUiPasswordStrengthIndicatorDurationsTheme({
    required this.colorChangeDuration,
  });
}

class ImpaktfullUiPasswordStrengthIndicatorTextStyleTheme {
  final TextStyle requirement;
  final TextStyle requirementIsMet;
  const ImpaktfullUiPasswordStrengthIndicatorTextStyleTheme({
    required this.requirement,
    required this.requirementIsMet,
  });
}
