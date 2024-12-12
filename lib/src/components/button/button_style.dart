import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiButtonTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiButtonColorTheme colors;
  final ImpaktfullUiButtonDimensTheme dimens;
  final ImpaktfullUiButtonDurationsTheme durations;
  final ImpaktfullUiButtonTextStylesTheme textStyles;

  const ImpaktfullUiButtonTheme({
    required this.colors,
    required this.dimens,
    required this.durations,
    required this.textStyles,
  });

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
        ),
        dimens: ImpaktfullUiButtonDimensTheme(
          borderRadius: dimens.borderRadius,
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

  const ImpaktfullUiButtonColorTheme({
    required this.primary,
    required this.primaryBorder,
    required this.secondary,
    required this.secondaryBorder,
    required this.tertiary,
    required this.tertiaryBorder,
    required this.destructive,
    required this.destructiveBorder,
  });
}

class ImpaktfullUiButtonDimensTheme {
  final BorderRadiusGeometry borderRadius;

  const ImpaktfullUiButtonDimensTheme({
    required this.borderRadius,
  });
}

class ImpaktfullUiButtonDurationsTheme {
  final Duration loading;
  const ImpaktfullUiButtonDurationsTheme({
    required this.loading,
  });
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
}
