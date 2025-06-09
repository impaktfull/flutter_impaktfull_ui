import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiButtonTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiButtonColorTheme colors;
  final ImpaktfullUiButtonDimensTheme dimens;
  final ImpaktfullUiButtonDurationsTheme durations;
  final ImpaktfullUiButtonTextStylesTheme textStyles;
  final ImpaktfullUiButtonShadowTheme? shadow;
  final ImpaktfullUiButtonConfig config;

  const ImpaktfullUiButtonTheme({
    required this.colors,
    required this.dimens,
    required this.durations,
    required this.textStyles,
    required this.config,
    this.shadow,
  });

  ImpaktfullUiButtonTheme copyWith({
    ImpaktfullUiButtonColorTheme? colors,
    ImpaktfullUiButtonDimensTheme? dimens,
    ImpaktfullUiButtonDurationsTheme? durations,
    ImpaktfullUiButtonTextStylesTheme? textStyles,
    ImpaktfullUiButtonConfig? config,
  }) =>
      ImpaktfullUiButtonTheme(
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        textStyles: textStyles ?? this.textStyles,
        config: config ?? this.config,
      );

  static ImpaktfullUiButtonTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.button;

  static ImpaktfullUiButtonTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiButtonTheme(
        colors: ImpaktfullUiButtonColorTheme(
          primary: colors.accent,
          primaryBorder: colors.accent,
          secondary: colors.card,
          secondaryBorder: colors.border,
          tertiary: null,
          tertiaryBorder: null,
          destructive: colors.destructive,
          destructiveBorder: colors.destructive,
          raisedBackground: ImpaktfullUiRaisedButtonColorTheme(
            primary: Color.lerp(colors.secondary, Colors.black, 0.33),
            secondary: colors.border,
            destructive: Color.lerp(colors.destructive, Colors.black, 0.33),
            destructiveSecondary:
                Color.lerp(colors.destructive, Colors.black, 0.05),
          ),
        ),
        dimens: ImpaktfullUiButtonDimensTheme(
          borderRadius: dimens.borderRadius,
          borderWidth: 1,
        ),
        durations: ImpaktfullUiButtonDurationsTheme(
          loading: durations.short,
        ),
        textStyles: ImpaktfullUiButtonTextStylesTheme(
          primary: textStyles.onAccent.text.small.bold,
          alternative: textStyles.onCardAccent.text.small.bold,
          grey: textStyles.onCard.text.small.bold,
          destructivePrimary: textStyles.onDestructive.text.small.bold,
          destructiveAlternative: textStyles.onCardDestructive.text.small.bold,
        ),
        shadow: ImpaktfullUiButtonShadowTheme(
          primary: [],
          secondary: [],
          destructive: [],
        ),
        config: ImpaktfullUiButtonConfig(
          isRaised: true,
        ),
      );
}

class ImpaktfullUiButtonColorTheme {
  final Color primary;
  final Color primaryBorder;
  final Color secondary;
  final Color secondaryBorder;
  final Color? tertiary;
  final Color? tertiaryBorder;
  final Color? destructive;
  final Color? destructiveBorder;
  final ImpaktfullUiRaisedButtonColorTheme? raisedBackground;

  const ImpaktfullUiButtonColorTheme({
    required this.primary,
    required this.primaryBorder,
    required this.secondary,
    required this.secondaryBorder,
    required this.tertiary,
    required this.tertiaryBorder,
    required this.destructive,
    required this.destructiveBorder,
    required this.raisedBackground,
  });

  ImpaktfullUiButtonColorTheme copyWith({
    Color? primary,
    Color? primaryBorder,
    Color? secondary,
    Color? secondaryBorder,
    Color? tertiary,
    Color? tertiaryBorder,
    Color? destructive,
    Color? destructiveBorder,
    ImpaktfullUiRaisedButtonColorTheme? raisedBackground,
  }) =>
      ImpaktfullUiButtonColorTheme(
        primary: primary ?? this.primary,
        primaryBorder: primaryBorder ?? this.primaryBorder,
        secondary: secondary ?? this.secondary,
        secondaryBorder: secondaryBorder ?? this.secondaryBorder,
        tertiary: tertiary ?? this.tertiary,
        tertiaryBorder: tertiaryBorder ?? this.tertiaryBorder,
        destructive: destructive ?? this.destructive,
        destructiveBorder: destructiveBorder ?? this.destructiveBorder,
        raisedBackground: raisedBackground ?? this.raisedBackground,
      );
}

class ImpaktfullUiRaisedButtonColorTheme {
  final Color? primary;
  final Color? secondary;
  final Color? destructive;
  final Color? destructiveSecondary;

  const ImpaktfullUiRaisedButtonColorTheme({
    required this.primary,
    required this.secondary,
    required this.destructive,
    required this.destructiveSecondary,
  });

  ImpaktfullUiRaisedButtonColorTheme copyWith({
    Color? primary,
    Color? secondary,
    Color? destructive,
    Color? destructiveSecondary,
  }) =>
      ImpaktfullUiRaisedButtonColorTheme(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        destructive: destructive ?? this.destructive,
        destructiveSecondary: destructiveSecondary ?? this.destructiveSecondary,
      );
}

class ImpaktfullUiButtonDimensTheme {
  final BorderRadiusGeometry borderRadius;
  final double borderWidth;

  const ImpaktfullUiButtonDimensTheme({
    required this.borderRadius,
    required this.borderWidth,
  });

  ImpaktfullUiButtonDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    double? borderWidth,
  }) =>
      ImpaktfullUiButtonDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        borderWidth: borderWidth ?? this.borderWidth,
      );
}

class ImpaktfullUiButtonDurationsTheme {
  final Duration loading;
  const ImpaktfullUiButtonDurationsTheme({
    required this.loading,
  });

  ImpaktfullUiButtonDurationsTheme copyWith({
    Duration? loading,
  }) =>
      ImpaktfullUiButtonDurationsTheme(
        loading: loading ?? this.loading,
      );
}

class ImpaktfullUiButtonTextStylesTheme {
  final TextStyle primary;
  final TextStyle alternative;
  final TextStyle grey;
  final TextStyle destructivePrimary;
  final TextStyle destructiveAlternative;

  const ImpaktfullUiButtonTextStylesTheme({
    required this.primary,
    required this.alternative,
    required this.grey,
    required this.destructivePrimary,
    required this.destructiveAlternative,
  });

  ImpaktfullUiButtonTextStylesTheme copyWith({
    TextStyle? primary,
    TextStyle? alternative,
    TextStyle? grey,
    TextStyle? destructivePrimary,
    TextStyle? destructiveAlternative,
  }) =>
      ImpaktfullUiButtonTextStylesTheme(
        primary: primary ?? this.primary,
        alternative: alternative ?? this.alternative,
        grey: grey ?? this.grey,
        destructivePrimary: destructivePrimary ?? this.destructivePrimary,
        destructiveAlternative:
            destructiveAlternative ?? this.destructiveAlternative,
      );
}

class ImpaktfullUiButtonShadowTheme {
  final List<BoxShadow>? primary;
  final List<BoxShadow>? secondary;
  final List<BoxShadow>? destructive;

  const ImpaktfullUiButtonShadowTheme({
    required this.primary,
    required this.secondary,
    required this.destructive,
  });

  ImpaktfullUiButtonShadowTheme copyWith({
    List<BoxShadow>? primary,
    List<BoxShadow>? secondary,
    List<BoxShadow>? destructive,
  }) =>
      ImpaktfullUiButtonShadowTheme(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        destructive: destructive ?? this.destructive,
      );
}

class ImpaktfullUiButtonConfig {
  final bool isRaised;
  final double elevation;
  final bool vibrateOnTap;

  const ImpaktfullUiButtonConfig({
    this.isRaised = false,
    this.elevation = 0,
    this.vibrateOnTap = false,
  });

  ImpaktfullUiButtonConfig copyWith({
    bool? isRaised,
    double? elevation,
    bool? vibrateOnTap,
  }) =>
      ImpaktfullUiButtonConfig(
        isRaised: isRaised ?? this.isRaised,
        elevation: elevation ?? this.elevation,
        vibrateOnTap: vibrateOnTap ?? this.vibrateOnTap,
      );
}
