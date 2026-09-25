import 'package:flutter/foundation.dart';
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiPasswordStrengthIndicatorTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          durations == other.durations &&
          textStyles == other.textStyles;

  @override
  int get hashCode =>
      Object.hash(assets, colors, dimens, durations, textStyles);
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiPasswordStrengthIndicatorAssetsTheme &&
          leadingRequirement == other.leadingRequirement &&
          leadingRequirementIsMet == other.leadingRequirementIsMet;

  @override
  int get hashCode => Object.hash(leadingRequirement, leadingRequirementIsMet);
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiPasswordStrengthIndicatorColorTheme &&
          listEquals(strengthIndicators, other.strengthIndicators) &&
          strengthIndicatorBackground == other.strengthIndicatorBackground &&
          requirementAsset == other.requirementAsset &&
          requirementAssetIsMet == other.requirementAssetIsMet;

  @override
  int get hashCode => Object.hash(Object.hashAll(strengthIndicators),
      strengthIndicatorBackground, requirementAsset, requirementAssetIsMet);
}

class ImpaktfullUiPasswordStrengthIndicatorDimensTheme {
  final double spacing;
  final double requirementSpacing;
  final BorderRadiusGeometry strengthIndicatorBorderRadius;

  /// The space between the bars and the rules under them.
  final double sectionSpacing;

  /// The thickness of a bar.
  final double barHeight;

  /// The space between the icon of a rule and its text.
  final double ruleSpacing;

  /// The size of the icon of a rule.
  final double iconSize;

  const ImpaktfullUiPasswordStrengthIndicatorDimensTheme({
    required this.spacing,
    required this.requirementSpacing,
    required this.strengthIndicatorBorderRadius,
    this.sectionSpacing = 12,
    this.barHeight = 4,
    this.ruleSpacing = 8,
    this.iconSize = 16,
  });

  ImpaktfullUiPasswordStrengthIndicatorDimensTheme copyWith({
    double? barHeight,
    double? iconSize,
    double? requirementSpacing,
    double? ruleSpacing,
    double? sectionSpacing,
    double? spacing,
    BorderRadiusGeometry? strengthIndicatorBorderRadius,
  }) =>
      ImpaktfullUiPasswordStrengthIndicatorDimensTheme(
        barHeight: barHeight ?? this.barHeight,
        iconSize: iconSize ?? this.iconSize,
        requirementSpacing: requirementSpacing ?? this.requirementSpacing,
        ruleSpacing: ruleSpacing ?? this.ruleSpacing,
        sectionSpacing: sectionSpacing ?? this.sectionSpacing,
        spacing: spacing ?? this.spacing,
        strengthIndicatorBorderRadius:
            strengthIndicatorBorderRadius ?? this.strengthIndicatorBorderRadius,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiPasswordStrengthIndicatorDimensTheme &&
          requirementSpacing == other.requirementSpacing &&
          strengthIndicatorBorderRadius ==
              other.strengthIndicatorBorderRadius &&
          spacing == other.spacing &&
          sectionSpacing == other.sectionSpacing &&
          barHeight == other.barHeight &&
          ruleSpacing == other.ruleSpacing &&
          iconSize == other.iconSize;

  @override
  int get hashCode => Object.hash(
        spacing,
        requirementSpacing,
        strengthIndicatorBorderRadius,
        sectionSpacing,
        barHeight,
        ruleSpacing,
        iconSize,
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiPasswordStrengthIndicatorDurationsTheme &&
          colorChangeDuration == other.colorChangeDuration;

  @override
  int get hashCode => colorChangeDuration.hashCode;
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiPasswordStrengthIndicatorTextStyleTheme &&
          requirement == other.requirement &&
          requirementIsMet == other.requirementIsMet;

  @override
  int get hashCode => Object.hash(requirement, requirementIsMet);
}
