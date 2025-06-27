import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/util/custom_theme.dart';

class ExampleThemes {
  static final themes = <ImpaktfullUiTheme>[
    ImpaktfullUiTheme.getDefault(
      package: null,
    ),
    ImpaktfullUiTheme.custom(
      label: 'impaktfull Dark Theme',
      primary: const Color(0xFF1A1A1A),
      accent: const Color(0xFF7d64f2),
      secondary: const Color(0xFF7d64f2),
      canvas: const Color(0xFF1A1A1A),
      card: const Color(0xFF131313),
      shadow: Colors.black87,
      text: const Color(0xFFFFFFFF),
      textOnAccent: const Color(0xFFFFFFFF),
      textOnSecondary: const Color(0xFFFFFFFF),
      package: null,
      assetSuffix: 'theme_dark',
    ),
    getRaisedButtonTheme(),
    ImpaktfullUiTheme.custom(
      label: 'Light mode (zero border radius)',
      primary: const Color(0xFF1A1A1A),
      accent: const Color(0xFF7d64f2),
      secondary: const Color(0xFF7d64f2),
      borderRadiusExtraSmall: BorderRadius.zero,
      borderRadiusSmall: BorderRadius.zero,
      borderRadius: BorderRadius.zero,
      borderRadiusLarge: BorderRadius.zero,
      borderRadiusExtraLarge: BorderRadius.zero,
      package: null,
    ),
    ImpaktfullUiCustomTheme.theme,
  ];

  static ImpaktfullUiTheme getRaisedButtonTheme() {
    final theme = ImpaktfullUiTheme.getDefault(
      package: null,
    );
    return theme.copyWith(
      label: 'impaktfull (raised buttons)',
      components: theme.components.copyWith(
        button: ImpaktfullUiButtonTheme(
          colors: ImpaktfullUiButtonColorTheme(
            primary: theme.colors.accent,
            primaryBorder: theme.colors.accent,
            secondary: theme.colors.card,
            secondaryBorder: theme.colors.border,
            tertiary: null,
            tertiaryBorder: null,
            destructive: theme.colors.destructive,
            destructiveBorder: theme.colors.destructive,
            raisedBackground: ImpaktfullUiRaisedButtonColorTheme(
              primary: Color.lerp(theme.colors.secondary, Colors.black, 0.33),
              secondary: theme.colors.border,
              destructive:
                  Color.lerp(theme.colors.destructive, Colors.black, 0.33),
              destructiveSecondary:
                  Color.lerp(theme.colors.destructive, Colors.black, 0.05),
            ),
          ),
          dimens: ImpaktfullUiButtonDimensTheme(
            borderRadius: theme.dimens.borderRadius,
            borderWidth: 2,
          ),
          durations: ImpaktfullUiButtonDurationsTheme(
            loading: theme.durations.short,
          ),
          textStyles: ImpaktfullUiButtonTextStylesTheme(
            primary: theme.textStyles.onAccent.text.small.bold,
            alternative: theme.textStyles.onCardAccent.text.small.bold,
            grey: theme.textStyles.onCard.text.small.bold,
            destructivePrimary: theme.textStyles.onDestructive.text.small.bold,
            destructiveAlternative:
                theme.textStyles.onCardDestructive.text.small.bold,
          ),
          shadow: const ImpaktfullUiButtonShadowTheme(
            primary: [],
            secondary: [],
            destructive: [],
          ),
          config: const ImpaktfullUiButtonConfig(
            isRaised: true,
            elevation: 4,
          ),
        ),
      ),
    );
  }
}
