import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiStepperTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiStepperAssetsTheme assets;
  final ImpaktfullUiStepperColorTheme colors;
  final ImpaktfullUiStepperDimensTheme dimens;
  final ImpaktfullUiStepperTextStyleTheme textStyles;

  const ImpaktfullUiStepperTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiStepperTheme copyWith({
    ImpaktfullUiStepperAssetsTheme? assets,
    ImpaktfullUiStepperColorTheme? colors,
    ImpaktfullUiStepperDimensTheme? dimens,
    ImpaktfullUiStepperTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiStepperTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiStepperTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.stepper;

  static ImpaktfullUiStepperTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiStepperTheme(
        assets: const ImpaktfullUiStepperAssetsTheme(),
        colors: ImpaktfullUiStepperColorTheme(
          activeStep: colors.accent,
          inactiveStep: colors.border,
          assetBorder: colors.border,
          assetBackground: colors.card,
          assetColor: colors.text,
          assetBorderCompleted: colors.accent,
          assetBackgroundCompleted: colors.accent,
          assetColorCompleted: colors.textOnAccent,
        ),
        dimens: ImpaktfullUiStepperDimensTheme(
          spacing: 8,
          height: 8,
          borderRadius: dimens.borderRadius,
        ),
        textStyles: ImpaktfullUiStepperTextStyleTheme(
          title: textStyles.onCard.text.small.medium,
          subtitle: textStyles.onCard.text.small.light,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiStepperTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiStepperAssetsTheme {
  const ImpaktfullUiStepperAssetsTheme();

  ImpaktfullUiStepperAssetsTheme copyWith() =>
      const ImpaktfullUiStepperAssetsTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiStepperAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiStepperColorTheme {
  final Color activeStep;
  final Color inactiveStep;
  final Color assetBorder;
  final Color assetBackground;
  final Color assetColor;
  final Color assetBorderCompleted;
  final Color assetBackgroundCompleted;
  final Color assetColorCompleted;

  const ImpaktfullUiStepperColorTheme({
    required this.activeStep,
    required this.inactiveStep,
    required this.assetBorder,
    required this.assetColor,
    required this.assetBackground,
    required this.assetBorderCompleted,
    required this.assetBackgroundCompleted,
    required this.assetColorCompleted,
  });

  ImpaktfullUiStepperColorTheme copyWith({
    Color? activeStep,
    Color? assetBackground,
    Color? assetBackgroundCompleted,
    Color? assetBorder,
    Color? assetBorderCompleted,
    Color? assetColor,
    Color? assetColorCompleted,
    Color? inactiveStep,
  }) =>
      ImpaktfullUiStepperColorTheme(
        activeStep: activeStep ?? this.activeStep,
        assetBackground: assetBackground ?? this.assetBackground,
        assetBackgroundCompleted:
            assetBackgroundCompleted ?? this.assetBackgroundCompleted,
        assetBorder: assetBorder ?? this.assetBorder,
        assetBorderCompleted: assetBorderCompleted ?? this.assetBorderCompleted,
        assetColor: assetColor ?? this.assetColor,
        assetColorCompleted: assetColorCompleted ?? this.assetColorCompleted,
        inactiveStep: inactiveStep ?? this.inactiveStep,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiStepperColorTheme &&
          activeStep == other.activeStep &&
          inactiveStep == other.inactiveStep &&
          assetBorder == other.assetBorder &&
          assetBackground == other.assetBackground &&
          assetColor == other.assetColor &&
          assetBorderCompleted == other.assetBorderCompleted &&
          assetBackgroundCompleted == other.assetBackgroundCompleted &&
          assetColorCompleted == other.assetColorCompleted;

  @override
  int get hashCode => Object.hash(
      activeStep,
      inactiveStep,
      assetBorder,
      assetBackground,
      assetColor,
      assetBorderCompleted,
      assetBackgroundCompleted,
      assetColorCompleted);
}

class ImpaktfullUiStepperDimensTheme {
  final double spacing;
  final double height;
  final BorderRadiusGeometry borderRadius;

  /// The padding around the asset of a step.
  final EdgeInsetsGeometry padding;

  const ImpaktfullUiStepperDimensTheme({
    required this.spacing,
    required this.height,
    required this.borderRadius,
    this.padding = const EdgeInsets.all(8),
  });

  ImpaktfullUiStepperDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    double? height,
    EdgeInsetsGeometry? padding,
    double? spacing,
  }) =>
      ImpaktfullUiStepperDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        height: height ?? this.height,
        padding: padding ?? this.padding,
        spacing: spacing ?? this.spacing,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiStepperDimensTheme &&
          spacing == other.spacing &&
          height == other.height &&
          borderRadius == other.borderRadius &&
          padding == other.padding;

  @override
  int get hashCode => Object.hash(spacing, height, borderRadius, padding);
}

class ImpaktfullUiStepperTextStyleTheme {
  final TextStyle title;
  final TextStyle subtitle;
  const ImpaktfullUiStepperTextStyleTheme({
    required this.title,
    required this.subtitle,
  });

  ImpaktfullUiStepperTextStyleTheme copyWith({
    TextStyle? subtitle,
    TextStyle? title,
  }) =>
      ImpaktfullUiStepperTextStyleTheme(
        subtitle: subtitle ?? this.subtitle,
        title: title ?? this.title,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiStepperTextStyleTheme &&
          title == other.title &&
          subtitle == other.subtitle;

  @override
  int get hashCode => Object.hash(title, subtitle);
}
