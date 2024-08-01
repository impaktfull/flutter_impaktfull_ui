import 'package:flutter/material.dart';

class ImpaktfullUiTextStylesTheme {
  final ImpaktfullUiTextStyleTheme onCanvas;
  final ImpaktfullUiTextStyleTheme onCanvasPrimary;
  final ImpaktfullUiTextStyleTheme onCanvasSecondary;
  final ImpaktfullUiTextStyleTheme onCanvasTertiary;
  final ImpaktfullUiTextStyleTheme onCard;
  final ImpaktfullUiTextStyleTheme onCardPrimary;
  final ImpaktfullUiTextStyleTheme onCardSecondary;
  final ImpaktfullUiTextStyleTheme onCardTertiary;
  final ImpaktfullUiTextStyleTheme onCardDestructive;
  final ImpaktfullUiTextStyleTheme onPrimary;
  final ImpaktfullUiTextStyleTheme onSecondary;
  final ImpaktfullUiTextStyleTheme onDestructive;

  const ImpaktfullUiTextStylesTheme({
    required this.onCanvas,
    required this.onCanvasPrimary,
    required this.onCanvasSecondary,
    required this.onCanvasTertiary,
    required this.onCard,
    required this.onCardPrimary,
    required this.onCardSecondary,
    required this.onCardTertiary,
    required this.onCardDestructive,
    required this.onPrimary,
    required this.onSecondary,
    required this.onDestructive,
  });

  ImpaktfullUiTextStylesTheme copyWith({
    ImpaktfullUiTextStyleTheme? onCanvas,
    ImpaktfullUiTextStyleTheme? onCanvasPrimary,
    ImpaktfullUiTextStyleTheme? onCanvasSecondary,
    ImpaktfullUiTextStyleTheme? onCanvasTertiary,
    ImpaktfullUiTextStyleTheme? onCard,
    ImpaktfullUiTextStyleTheme? onCardPrimary,
    ImpaktfullUiTextStyleTheme? onCardSecondary,
    ImpaktfullUiTextStyleTheme? onCardTertiary,
    ImpaktfullUiTextStyleTheme? onCardDestructive,
    ImpaktfullUiTextStyleTheme? onPrimary,
    ImpaktfullUiTextStyleTheme? onSecondary,
    ImpaktfullUiTextStyleTheme? onDestructive,
  }) =>
      ImpaktfullUiTextStylesTheme(
        onCanvas: onCanvas ?? this.onCanvas,
        onCanvasPrimary: onCanvasPrimary ?? this.onCanvasPrimary,
        onCanvasSecondary: onCanvasSecondary ?? this.onCanvasSecondary,
        onCanvasTertiary: onCanvasTertiary ?? this.onCanvasTertiary,
        onCard: onCard ?? this.onCard,
        onCardPrimary: onCardPrimary ?? this.onCardPrimary,
        onCardSecondary: onCardSecondary ?? this.onCardSecondary,
        onCardTertiary: onCardTertiary ?? this.onCardTertiary,
        onCardDestructive: onCardDestructive ?? this.onCardDestructive,
        onPrimary: onPrimary ?? this.onPrimary,
        onSecondary: onSecondary ?? this.onSecondary,
        onDestructive: onDestructive ?? this.onDestructive,
      );
}

class ImpaktfullUiTextStyleTheme {
  final ImpaktfullUiTextStyleDisplayTheme display;
  final ImpaktfullUiTextStyleTextTheme text;

  const ImpaktfullUiTextStyleTheme({
    required this.display,
    required this.text,
  });

  ImpaktfullUiTextStyleTheme copyWith({
    ImpaktfullUiTextStyleDisplayTheme? display,
    ImpaktfullUiTextStyleTextTheme? text,
  }) =>
      ImpaktfullUiTextStyleTheme(
        display: display ?? this.display,
        text: text ?? this.text,
      );

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

  ImpaktfullUiTextStyleDisplayTheme copyWith({
    TextStyle? extraLarge2,
    TextStyle? extraLarge,
    TextStyle? large,
    TextStyle? medium,
    TextStyle? small,
    TextStyle? extraSmall,
  }) =>
      ImpaktfullUiTextStyleDisplayTheme(
        extraLarge2: extraLarge2 ?? this.extraLarge2,
        extraLarge: extraLarge ?? this.extraLarge,
        large: large ?? this.large,
        medium: medium ?? this.medium,
        small: small ?? this.small,
        extraSmall: extraSmall ?? this.extraSmall,
      );

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

  ImpaktfullUiTextStyleTextTheme copyWith({
    TextStyle? extraLarge,
    TextStyle? large,
    TextStyle? medium,
    TextStyle? small,
    TextStyle? extraSmall,
  }) =>
      ImpaktfullUiTextStyleTextTheme(
        extraLarge: extraLarge ?? this.extraLarge,
        large: large ?? this.large,
        medium: medium ?? this.medium,
        small: small ?? this.small,
        extraSmall: extraSmall ?? this.extraSmall,
      );

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
