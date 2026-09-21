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

  ImpaktfullUiPasswordStrengthIndicatorTheme copyWith({
    ImpaktfullUiPasswordStrengthIndicatorAssetsTheme? assets,
    ImpaktfullUiPasswordStrengthIndicatorColorTheme? colors,
    ImpaktfullUiPasswordStrengthIndicatorDimensTheme? dimens,
    ImpaktfullUiPasswordStrengthIndicatorDurationsTheme? durations,
    ImpaktfullUiPasswordStrengthIndicatorTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiPasswordStrengthIndicatorTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        textStyles: textStyles ?? this.textStyles,
      );

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

  ImpaktfullUiPasswordStrengthIndicatorAssetsTheme copyWith({
    ImpaktfullUiAsset? leadingRequirement,
    ImpaktfullUiAsset? leadingRequirementIsMet,
  }) =>
      ImpaktfullUiPasswordStrengthIndicatorAssetsTheme(
        leadingRequirement: leadingRequirement ?? this.leadingRequirement,
        leadingRequirementIsMet:
            leadingRequirementIsMet ?? this.leadingRequirementIsMet,
      );

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

  ImpaktfullUiPasswordStrengthIndicatorColorTheme copyWith({
    Color? requirementAsset,
    Color? requirementAssetIsMet,
    Color? strengthIndicatorBackground,
    List<Color>? strengthIndicators,
  }) =>
      ImpaktfullUiPasswordStrengthIndicatorColorTheme(
        requirementAsset: requirementAsset ?? this.requirementAsset,
        requirementAssetIsMet:
            requirementAssetIsMet ?? this.requirementAssetIsMet,
        strengthIndicatorBackground:
            strengthIndicatorBackground ?? this.strengthIndicatorBackground,
        strengthIndicators: strengthIndicators ?? this.strengthIndicators,
      );
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

  ImpaktfullUiPasswordStrengthIndicatorDimensTheme copyWith({
    double? requirementSpacing,
    double? spacing,
    BorderRadiusGeometry? strengthIndicatorBorderRadius,
  }) =>
      ImpaktfullUiPasswordStrengthIndicatorDimensTheme(
        requirementSpacing: requirementSpacing ?? this.requirementSpacing,
        spacing: spacing ?? this.spacing,
        strengthIndicatorBorderRadius:
            strengthIndicatorBorderRadius ?? this.strengthIndicatorBorderRadius,
      );
}

class ImpaktfullUiPasswordStrengthIndicatorDurationsTheme {
  final Duration colorChangeDuration;
  const ImpaktfullUiPasswordStrengthIndicatorDurationsTheme({
    required this.colorChangeDuration,
  });

  ImpaktfullUiPasswordStrengthIndicatorDurationsTheme copyWith({
    Duration? colorChangeDuration,
  }) =>
      ImpaktfullUiPasswordStrengthIndicatorDurationsTheme(
        colorChangeDuration: colorChangeDuration ?? this.colorChangeDuration,
      );
}

class ImpaktfullUiPasswordStrengthIndicatorTextStyleTheme {
  final TextStyle requirement;
  final TextStyle requirementIsMet;
  const ImpaktfullUiPasswordStrengthIndicatorTextStyleTheme({
    required this.requirement,
    required this.requirementIsMet,
  });

  ImpaktfullUiPasswordStrengthIndicatorTextStyleTheme copyWith({
    TextStyle? requirement,
    TextStyle? requirementIsMet,
  }) =>
      ImpaktfullUiPasswordStrengthIndicatorTextStyleTheme(
        requirement: requirement ?? this.requirement,
        requirementIsMet: requirementIsMet ?? this.requirementIsMet,
      );
}
