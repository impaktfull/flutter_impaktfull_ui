import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

void main() {
  const primary = Color(0xFF010101);
  const accent = Color(0xFF020202);
  const secondary = Color(0xFF030303);
  const card = Color(0xFF040404);
  const border = Color(0xFF050505);
  const error = Color(0xFF060606);
  const destructive = Color(0xFF070707);
  const text = Color(0xFF080808);
  const textOnAccent = Color(0xFF090909);
  const tertiary = Color(0xFF0A0A0A);

  final theme = ImpaktfullUiDefaultTheme.withMinimalChanges(
    primary: primary,
    accent: accent,
    secondary: secondary,
    card: card,
    border: border,
    error: error,
    destructive: destructive,
    text: text,
    textOnAccent: textOnAccent,
    tertiary: tertiary,
    borderRadius: BorderRadius.circular(3),
    borderRadiusSmall: BorderRadius.circular(2),
  );

  group('colors', () {
    test('are set on the color theme', () {
      expect(theme.colors.primary, primary);
      expect(theme.colors.accent, accent);
      expect(theme.colors.secondary, secondary);
      expect(theme.colors.card, card);
      expect(theme.colors.border, border);
      expect(theme.colors.error, error);
      expect(theme.colors.destructive, destructive);
      expect(theme.colors.text, text);
      expect(theme.colors.textOnAccent, textOnAccent);
    });

    test('derived colors fall back to the given colors', () {
      expect(theme.colors.textSecondary, secondary);
      expect(theme.colors.textTertiary, tertiary);
      final withoutTertiary = ImpaktfullUiDefaultTheme.withMinimalChanges(
        primary: primary,
        accent: accent,
        secondary: secondary,
      );
      expect(withoutTertiary.colors.textTertiary, const Color(0xFF999b9e));
      expect(withoutTertiary.colors.tertiary, const Color(0xFF475467));
    });
  });

  group('colors propagate into the component themes', () {
    test('button', () {
      final button = theme.components.button;
      expect(button.colors.primary, accent);
      expect(button.colors.primaryBorder, accent);
      expect(button.colors.secondary, card);
      expect(button.colors.secondaryBorder, border);
      expect(button.colors.destructive, destructive);
    });

    test('card', () {
      final cardTheme = theme.components.card;
      expect(cardTheme.colors.background, card);
      expect(cardTheme.colors.border, border);
      expect(cardTheme.colors.borderError, error);
      expect(cardTheme.dimens.borderRadius, BorderRadius.circular(3));
      expect(cardTheme.shadows.card, theme.shadows.small);
    });

    test('checkbox', () {
      final checkbox = theme.components.checkbox;
      expect(checkbox.colors.activeColor, accent);
      expect(checkbox.colors.borderColor, border);
      expect(checkbox.colors.checkMarkColor, textOnAccent);
      expect(checkbox.dimens.borderRadius, BorderRadius.circular(2));
    });

    test('text styles', () {
      expect(theme.textStyles.onCanvas.text.medium.color, text);
      expect(theme.textStyles.onCanvas.display.large.color, text);
      expect(theme.textStyles.onCanvasAccent.text.medium.color, accent);
      expect(theme.textStyles.onCanvasSecondary.text.medium.color, secondary);
      expect(theme.textStyles.onCanvasTertiary.text.medium.color, tertiary);
      expect(theme.textStyles.onAccent.text.medium.color, textOnAccent);
      expect(theme.textStyles.onCardDestructive.text.medium.color, destructive);
    });

    test('every component theme is shared with the theme', () {
      // The component themes are built from the same assets, colors, ... as
      // the theme, a new theme must build new component themes.
      final other = ImpaktfullUiDefaultTheme.withMinimalChanges(
        primary: primary,
        accent: const Color(0xFFFF0000),
        secondary: secondary,
      );
      expect(other.components.button.colors.primary, const Color(0xFFFF0000));
      expect(theme.components.button.colors.primary, accent);
    });
  });

  test('uses the default fonts', () {
    expect(theme.textStyles.onCanvas.display.large.fontFamily, 'Ubuntu');
    expect(theme.textStyles.onCanvas.text.medium.fontFamily, 'Geologica');
  });

  test('uses the default border radius', () {
    final defaults = ImpaktfullUiDefaultTheme.withMinimalChanges(
      primary: primary,
      accent: accent,
      secondary: secondary,
    );
    expect(defaults.dimens.borderRadiusExtraSmall, BorderRadius.circular(4));
    expect(defaults.dimens.borderRadiusSmall, BorderRadius.circular(6));
    expect(defaults.dimens.borderRadius, BorderRadius.circular(8));
    expect(defaults.dimens.borderRadiusLarge, BorderRadius.circular(12));
    expect(defaults.dimens.borderRadiusExtraLarge, BorderRadius.circular(16));
  });
}
