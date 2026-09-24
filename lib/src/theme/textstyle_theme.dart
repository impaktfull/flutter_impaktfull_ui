import 'dart:math';

import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/theme/color_theme.dart';

class ImpaktfullUiTextStylesTheme {
  final ImpaktfullUiTextStyleTheme onCanvas;
  final ImpaktfullUiTextStyleTheme onCanvasAccent;
  final ImpaktfullUiTextStyleTheme onCanvasSecondary;
  final ImpaktfullUiTextStyleTheme onCanvasTertiary;
  final ImpaktfullUiTextStyleTheme onCard;
  final ImpaktfullUiTextStyleTheme onCardAccent;
  final ImpaktfullUiTextStyleTheme onCardSecondary;
  final ImpaktfullUiTextStyleTheme onCardTertiary;
  final ImpaktfullUiTextStyleTheme onCardDestructive;
  final ImpaktfullUiTextStyleTheme onPrimary;
  final ImpaktfullUiTextStyleTheme onAccent;
  final ImpaktfullUiTextStyleTheme onSecondary;
  final ImpaktfullUiTextStyleTheme onDestructive;

  const ImpaktfullUiTextStylesTheme({
    required this.onCanvas,
    required this.onCanvasAccent,
    required this.onCanvasSecondary,
    required this.onCanvasTertiary,
    required this.onCard,
    required this.onCardAccent,
    required this.onCardSecondary,
    required this.onCardTertiary,
    required this.onCardDestructive,
    required this.onPrimary,
    required this.onAccent,
    required this.onSecondary,
    required this.onDestructive,
  });

  List<ImpaktfullUiTextStyleTheme> get all => [
        onCanvas,
        onCanvasAccent,
        onCanvasSecondary,
        onCanvasTertiary,
        onCard,
        onCardAccent,
        onCardSecondary,
        onCardTertiary,
        onCardDestructive,
        onPrimary,
        onAccent,
        onSecondary,
        onDestructive,
      ];

  ImpaktfullUiTextStylesTheme copyWith({
    ImpaktfullUiTextStyleTheme? onCanvas,
    ImpaktfullUiTextStyleTheme? onCanvasAccent,
    ImpaktfullUiTextStyleTheme? onCanvasSecondary,
    ImpaktfullUiTextStyleTheme? onCanvasTertiary,
    ImpaktfullUiTextStyleTheme? onCard,
    ImpaktfullUiTextStyleTheme? onCardAccent,
    ImpaktfullUiTextStyleTheme? onCardSecondary,
    ImpaktfullUiTextStyleTheme? onCardTertiary,
    ImpaktfullUiTextStyleTheme? onCardDestructive,
    ImpaktfullUiTextStyleTheme? onPrimary,
    ImpaktfullUiTextStyleTheme? onAccent,
    ImpaktfullUiTextStyleTheme? onSecondary,
    ImpaktfullUiTextStyleTheme? onDestructive,
  }) =>
      ImpaktfullUiTextStylesTheme(
        onCanvas: onCanvas ?? this.onCanvas,
        onCanvasAccent: onCanvasAccent ?? this.onCanvasAccent,
        onCanvasSecondary: onCanvasSecondary ?? this.onCanvasSecondary,
        onCanvasTertiary: onCanvasTertiary ?? this.onCanvasTertiary,
        onCard: onCard ?? this.onCard,
        onCardAccent: onCardAccent ?? this.onCardAccent,
        onCardSecondary: onCardSecondary ?? this.onCardSecondary,
        onCardTertiary: onCardTertiary ?? this.onCardTertiary,
        onCardDestructive: onCardDestructive ?? this.onCardDestructive,
        onPrimary: onPrimary ?? this.onPrimary,
        onAccent: onAccent ?? this.onAccent,
        onSecondary: onSecondary ?? this.onSecondary,
        onDestructive: onDestructive ?? this.onDestructive,
      );

  /// The 13 text style groups of a theme, one per background and text color
  /// of [colors].
  ///
  /// This is what [ImpaktfullUiDefaultTheme.withMinimalChanges] builds
  /// `textStyles` with. The typography ([heightDisplay] / [heightText],
  /// [letterSpacingDisplay] / [letterSpacingText], [fontWeightDisplay] /
  /// [fontWeightText] and [fontSizeText]) applies to every style of every
  /// group, so a design system's line height or body font size is one value.
  /// `null` (the default) leaves it to Flutter, or keeps the scale of the
  /// default theme for [fontSizeText].
  static ImpaktfullUiTextStylesTheme getDefault({
    required ImpaktfullUiColorTheme colors,
    String? fontFamilyDisplay,
    String? fontFamilyText,
    double? heightDisplay,
    double? heightText,
    double? letterSpacingDisplay,
    double? letterSpacingText,
    FontWeight? fontWeightDisplay,
    FontWeight? fontWeightText,
    double? fontSizeText,
  }) {
    ImpaktfullUiTextStyleTheme byColor(Color color) =>
        ImpaktfullUiTextStyleTheme.getByColor(
          color: color,
          fontFamilyDisplay: fontFamilyDisplay,
          fontFamilyText: fontFamilyText,
          heightDisplay: heightDisplay,
          heightText: heightText,
          letterSpacingDisplay: letterSpacingDisplay,
          letterSpacingText: letterSpacingText,
          fontWeightDisplay: fontWeightDisplay,
          fontWeightText: fontWeightText,
          fontSizeText: fontSizeText,
        );
    return ImpaktfullUiTextStylesTheme(
      onCanvas: byColor(colors.text),
      onCanvasAccent: byColor(colors.accent),
      onCanvasSecondary: byColor(colors.textSecondary),
      onCanvasTertiary: byColor(colors.textTertiary),
      onCard: byColor(colors.text),
      onCardAccent: byColor(colors.accent),
      onCardSecondary: byColor(colors.textSecondary),
      onCardTertiary: byColor(colors.textTertiary),
      onCardDestructive: byColor(colors.destructive),
      onPrimary: byColor(colors.textOnPrimary),
      onAccent: byColor(colors.textOnAccent),
      onSecondary: byColor(colors.textOnSecondary),
      onDestructive: byColor(colors.textOnDestructive),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTextStylesTheme &&
          onCanvas == other.onCanvas &&
          onCanvasAccent == other.onCanvasAccent &&
          onCanvasSecondary == other.onCanvasSecondary &&
          onCanvasTertiary == other.onCanvasTertiary &&
          onCard == other.onCard &&
          onCardAccent == other.onCardAccent &&
          onCardSecondary == other.onCardSecondary &&
          onCardTertiary == other.onCardTertiary &&
          onCardDestructive == other.onCardDestructive &&
          onPrimary == other.onPrimary &&
          onAccent == other.onAccent &&
          onSecondary == other.onSecondary &&
          onDestructive == other.onDestructive;

  @override
  int get hashCode => Object.hash(
      onCanvas,
      onCanvasAccent,
      onCanvasSecondary,
      onCanvasTertiary,
      onCard,
      onCardAccent,
      onCardSecondary,
      onCardTertiary,
      onCardDestructive,
      onPrimary,
      onAccent,
      onSecondary,
      onDestructive);
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

  /// The display and text scale in [color].
  ///
  /// [heightDisplay] / [heightText] ([TextStyle.height], a multiple of the
  /// font size), [letterSpacingDisplay] / [letterSpacingText] and
  /// [fontWeightDisplay] / [fontWeightText] are the typography of a design
  /// system that is not its font size: they apply to every style of that
  /// scale. `null` (the default) leaves them to Flutter, which is what every
  /// style of this package looked like before they existed.
  static ImpaktfullUiTextStyleTheme getByColor({
    required Color color,
    String? fontFamilyDisplay,
    String? fontFamilyText,
    double? heightDisplay,
    double? heightText,
    double? letterSpacingDisplay,
    double? letterSpacingText,
    FontWeight? fontWeightDisplay,
    FontWeight? fontWeightText,
    double? fontSizeText,
  }) =>
      ImpaktfullUiTextStyleTheme(
        display: ImpaktfullUiTextStyleDisplayTheme.getByColor(
          color: color,
          fontFamily: fontFamilyDisplay,
          height: heightDisplay,
          letterSpacing: letterSpacingDisplay,
          fontWeight: fontWeightDisplay,
        ),
        text: ImpaktfullUiTextStyleTextTheme.getByColor(
          color: color,
          fontFamily: fontFamilyText,
          height: heightText,
          letterSpacing: letterSpacingText,
          fontWeight: fontWeightText,
          fontSize: fontSizeText ?? 16,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTextStyleTheme &&
          display == other.display &&
          text == other.text;

  @override
  int get hashCode => Object.hash(display, text);
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

  /// The display scale (72 / 60 / 48 / 30 / 24 / 20) in [color].
  ///
  /// [height] ([TextStyle.height], a multiple of the font size),
  /// [letterSpacing] and [fontWeight] apply to every size of the scale.
  /// `null` (the default) leaves them to Flutter.
  static ImpaktfullUiTextStyleDisplayTheme getByColor({
    required Color color,
    String? fontFamily,
    double? height,
    double? letterSpacing,
    FontWeight? fontWeight,
  }) {
    TextStyle style(double fontSize) => TextStyle(
          fontSize: fontSize,
          color: color,
          fontFamily: fontFamily,
          height: height,
          letterSpacing: letterSpacing,
          fontWeight: fontWeight,
        );
    return ImpaktfullUiTextStyleDisplayTheme(
      extraLarge2: style(72),
      extraLarge: style(60),
      large: style(48),
      medium: style(30),
      small: style(24),
      extraSmall: style(20),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTextStyleDisplayTheme &&
          extraLarge2 == other.extraLarge2 &&
          extraLarge == other.extraLarge &&
          large == other.large &&
          medium == other.medium &&
          small == other.small &&
          extraSmall == other.extraSmall;

  @override
  int get hashCode =>
      Object.hash(extraLarge2, extraLarge, large, medium, small, extraSmall);
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

  /// The text scale in [color], grown from [fontSize] in steps of 2:
  /// `fontSize + 4` / `+ 2` / `fontSize` / `- 2` / `- 4`, so the default of 16
  /// is 20 / 18 / 16 / 14 / 12.
  ///
  /// [fontSize] is the size of body text and of the text in a control, which
  /// is what a design system declares: `fontSize: 14` is both Ant Design's
  /// `fontSize` (with `fontSizeSM: 12` and `fontSizeLG: 16`) and the
  /// `text-sm` of a shadcn/ui control.
  ///
  /// [height] ([TextStyle.height], a multiple of the font size),
  /// [letterSpacing] and [fontWeight] apply to every size of the scale.
  /// `null` (the default) leaves them to Flutter.
  static ImpaktfullUiTextStyleTextTheme getByColor({
    required Color color,
    String? fontFamily,
    double? height,
    double? letterSpacing,
    FontWeight? fontWeight,
    double fontSize = 16,
  }) {
    TextStyle style(double fontSize) => TextStyle(
          fontSize: fontSize,
          color: color,
          fontFamily: fontFamily,
          height: height,
          letterSpacing: letterSpacing,
          fontWeight: fontWeight,
        );
    return ImpaktfullUiTextStyleTextTheme(
      extraLarge: style(max(0, fontSize + 4)),
      large: style(max(0, fontSize + 2)),
      medium: style(fontSize),
      small: style(max(0, fontSize - 2)),
      extraSmall: style(max(0, fontSize - 4)),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTextStyleTextTheme &&
          extraLarge == other.extraLarge &&
          large == other.large &&
          medium == other.medium &&
          small == other.small &&
          extraSmall == other.extraSmall;

  @override
  int get hashCode => Object.hash(extraLarge, large, medium, small, extraSmall);
}
