import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/theme/component_theme.dart';
import 'package:impaktfull_ui_2/src/theme/theme_default.dart';
import 'package:impaktfull_ui_2/src/theme/theme_configurator.dart';

class ImpaktfullUiTheme {
  final ImpaktfullUiColorTheme colors;
  final ImpaktfullUiTextStylesTheme textStyles;
  final ImpaktfullUiDimensTheme dimens;
  final ImpaktfullUiShadowsTheme shadows;
  final ImpaktfullUiComponentsTheme components;

  const ImpaktfullUiTheme({
    required this.colors,
    required this.textStyles,
    required this.dimens,
    required this.shadows,
    required this.components,
  });

  static ImpaktfullUiTheme getDefault() => DefaultTheme.withMinimalChanges(
        accent: const Color(0xFF7d64f2),
        secondary: const Color(0xFF7d64f2),
        borderRadius: BorderRadius.circular(8),
      );

  static ImpaktfullUiTheme of(BuildContext context) => theme;
}

class ImpaktfullUiColorTheme {
  final Color accent;
  final Color secondary;
  final Color tertiary;
  final Color canvas;
  final Color card;
  final Color header;
  final Color border;
  final Color shadow;
  final Color text;
  final Color textOnPrimary;
  final Color textOnSecondary;
  final Color warning;
  final Color error;
  final Color info;
  final Color success;

  const ImpaktfullUiColorTheme({
    required this.accent,
    required this.secondary,
    required this.tertiary,
    required this.canvas,
    required this.card,
    required this.header,
    required this.border,
    required this.shadow,
    required this.text,
    required this.textOnPrimary,
    required this.textOnSecondary,
    required this.warning,
    required this.error,
    required this.info,
    required this.success,
  });
}

class ImpaktfullUiTextStylesTheme {
  final ImpaktfullUiTextStyleTheme onCanvas;
  final ImpaktfullUiTextStyleTheme onCanvasPrimary;
  final ImpaktfullUiTextStyleTheme onCanvasSecondary;
  final ImpaktfullUiTextStyleTheme onCanvasTertiary;
  final ImpaktfullUiTextStyleTheme onCard;
  final ImpaktfullUiTextStyleTheme onCardPrimary;
  final ImpaktfullUiTextStyleTheme onCardSecondary;
  final ImpaktfullUiTextStyleTheme onCardTertiary;
  final ImpaktfullUiTextStyleTheme onPrimary;
  final ImpaktfullUiTextStyleTheme onSecondary;

  const ImpaktfullUiTextStylesTheme({
    required this.onCanvas,
    required this.onCanvasPrimary,
    required this.onCanvasSecondary,
    required this.onCanvasTertiary,
    required this.onCard,
    required this.onCardPrimary,
    required this.onCardSecondary,
    required this.onCardTertiary,
    required this.onPrimary,
    required this.onSecondary,
  });
}

class ImpaktfullUiTextStyleTheme {
  final ImpaktfullUiTextStyleDisplayTheme display;
  final ImpaktfullUiTextStyleTextTheme text;

  const ImpaktfullUiTextStyleTheme({
    required this.display,
    required this.text,
  });
  static getByColor({
    required Color color,
    String? fontFamilyDisplay,
    String? fontFamilyText,
  }) =>
      ImpaktfullUiTextStyleTheme(
        display: ImpaktfullUiTextStyleDisplayTheme.getByColor(
          color: color,
          fontFamily: fontFamilyDisplay,
        ),
        text: ImpaktfullUiTextStyleTextTheme.getByColor(
          color: color,
          fontFamily: fontFamilyText,
        ),
      );
}

class ImpaktfullUiTextStyleDisplayTheme {
  final TextStyle extraLarge2;
  final TextStyle extraLarge;
  final TextStyle large;
  final TextStyle medium;
  final TextStyle small;
  final TextStyle extraSmall;

  const ImpaktfullUiTextStyleDisplayTheme({
    required this.extraLarge2,
    required this.extraLarge,
    required this.large,
    required this.medium,
    required this.small,
    required this.extraSmall,
  });

  static getByColor({
    required Color color,
    String? fontFamily,
  }) {
    return ImpaktfullUiTextStyleDisplayTheme(
      extraLarge2: TextStyle(fontSize: 72, color: color, fontFamily: fontFamily),
      extraLarge: TextStyle(fontSize: 60, color: color, fontFamily: fontFamily),
      large: TextStyle(fontSize: 48, color: color, fontFamily: fontFamily),
      medium: TextStyle(fontSize: 30, color: color, fontFamily: fontFamily),
      small: TextStyle(fontSize: 24, color: color, fontFamily: fontFamily),
      extraSmall: TextStyle(fontSize: 20, color: color, fontFamily: fontFamily),
    );
  }
}

class ImpaktfullUiTextStyleTextTheme {
  final TextStyle extraLarge;
  final TextStyle large;
  final TextStyle medium;
  final TextStyle small;
  final TextStyle extraSmall;

  const ImpaktfullUiTextStyleTextTheme({
    required this.extraLarge,
    required this.large,
    required this.medium,
    required this.small,
    required this.extraSmall,
  });

  static getByColor({
    required Color color,
    String? fontFamily,
  }) =>
      ImpaktfullUiTextStyleTextTheme(
        extraLarge: TextStyle(fontSize: 20, color: color, fontFamily: fontFamily),
        large: TextStyle(fontSize: 18, color: color, fontFamily: fontFamily),
        medium: TextStyle(fontSize: 16, color: color, fontFamily: fontFamily),
        small: TextStyle(fontSize: 14, color: color, fontFamily: fontFamily),
        extraSmall: TextStyle(fontSize: 12, color: color, fontFamily: fontFamily),
      );
}

extension TextStyleExtension on TextStyle {
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
}

class ImpaktfullUiDimensTheme {
  final BorderRadius borderRadius;

  const ImpaktfullUiDimensTheme({
    required this.borderRadius,
  });
}

class ImpaktfullUiShadowsTheme {
  final List<BoxShadow> extraSmall;
  final List<BoxShadow> small;
  final List<BoxShadow> medium;
  final List<BoxShadow> large;
  final List<BoxShadow> extraLarge;

  const ImpaktfullUiShadowsTheme({
    required this.extraSmall,
    required this.small,
    required this.medium,
    required this.large,
    required this.extraLarge,
  });
}

abstract class ImpaktfullUiComponentTheme {
  const ImpaktfullUiComponentTheme();
}
