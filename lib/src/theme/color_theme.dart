import 'dart:ui';

class ImpaktfullUiColorTheme {
  final Color primary;
  final Color accent;
  final Color secondary;
  final Color tertiary;
  final Color canvas;
  final Color card;
  final Color header;
  final Color border;
  final Color shadow;
  final Color text;
  final Color textOnAccent;
  final Color textOnSecondary;
  final Color warning;
  final Color error;
  final Color info;
  final Color success;
  final Color destructive;

  const ImpaktfullUiColorTheme({
    required this.primary,
    required this.accent,
    required this.secondary,
    required this.tertiary,
    required this.canvas,
    required this.card,
    required this.header,
    required this.border,
    required this.shadow,
    required this.text,
    required this.textOnAccent,
    required this.textOnSecondary,
    required this.warning,
    required this.error,
    required this.info,
    required this.success,
    required this.destructive,
  });

  ImpaktfullUiColorTheme copyWith({
    Color? primary,
    Color? accent,
    Color? secondary,
    Color? tertiary,
    Color? canvas,
    Color? card,
    Color? header,
    Color? border,
    Color? shadow,
    Color? text,
    Color? textOnAccent,
    Color? textOnSecondary,
    Color? warning,
    Color? error,
    Color? info,
    Color? success,
    Color? destructive,
  }) =>
      ImpaktfullUiColorTheme(
        primary: primary ?? this.primary,
        accent: accent ?? this.accent,
        secondary: secondary ?? this.secondary,
        tertiary: tertiary ?? this.tertiary,
        canvas: canvas ?? this.canvas,
        card: card ?? this.card,
        header: header ?? this.header,
        border: border ?? this.border,
        shadow: shadow ?? this.shadow,
        text: text ?? this.text,
        textOnAccent: textOnAccent ?? this.textOnAccent,
        textOnSecondary: textOnSecondary ?? this.textOnSecondary,
        warning: warning ?? this.warning,
        error: error ?? this.error,
        info: info ?? this.info,
        success: success ?? this.success,
        destructive: destructive ?? this.destructive,
      );
}
