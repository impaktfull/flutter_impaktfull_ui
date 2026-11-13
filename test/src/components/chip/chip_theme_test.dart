import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

void main() {
  group('ImpaktfullUiChipTheme.getDefault', () {
    test('is built from the base tokens', () {
      final theme = ImpaktfullUiTheme.getDefault();
      final chip = theme.components.chip;
      expect(chip.colors.background, theme.colors.card);
      expect(chip.colors.backgroundSelected, theme.colors.accent);
      expect(chip.colors.border, theme.colors.border);
      expect(chip.colors.borderSelected, theme.colors.accent);
      expect(chip.colors.text, theme.colors.text);
      expect(chip.colors.textSelected, theme.colors.textOnAccent);
      expect(chip.dimens.borderRadius, theme.dimens.borderRadiusCircle);
      expect(chip.textStyles.title, theme.textStyles.onCard.text.small);
      expect(
        chip.textStyles.titleSelected,
        theme.textStyles.onAccent.text.small,
      );
    });

    test('follows a changed accent', () {
      final base = ImpaktfullUiTheme.getDefault();
      final theme = base.copyWithBaseTokens(
        colors: base.colors.copyWith(accent: Colors.teal),
      );
      expect(theme.components.chip.colors.backgroundSelected, Colors.teal);
    });

    test('has no tap target by default', () {
      final chip = ImpaktfullUiTheme.getDefault().components.chip;
      expect(chip.dimens.minTapTargetSize, isNull);
    });
  });

  test('a theme built twice from the same tokens is equal', () {
    expect(
      ImpaktfullUiTheme.getDefault().components.chip,
      ImpaktfullUiTheme.getDefault().components.chip,
    );
    expect(
      ImpaktfullUiTheme.getDefault().components.chip.hashCode,
      ImpaktfullUiTheme.getDefault().components.chip.hashCode,
    );
  });

  test('copyWith changes one token and keeps the others', () {
    const theme = ImpaktfullUiChipTheme.fallback;
    final changed = theme.copyWith(
      dimens: theme.dimens.copyWith(minHeight: 40),
    );
    expect(changed.dimens.minHeight, 40);
    expect(changed.dimens.padding, theme.dimens.padding);
    expect(changed.colors, theme.colors);
    expect(changed, isNot(theme));
  });

  test('the presets give the chip the look of their design system', () {
    final shadcn = ImpaktfullUiShadcnTheme.light().components.chip;
    // `h-9 px-2 rounded-md`, `bg-accent` (the muted surface) when it is on.
    expect(shadcn.dimens.minHeight, 36);
    expect(shadcn.dimens.padding, const EdgeInsets.symmetric(horizontal: 8));
    expect(
      shadcn.dimens.borderRadius,
      BorderRadius.circular(ImpaktfullUiShadcnTheme.radiusMedium),
    );
    expect(shadcn.colors.backgroundSelected, ImpaktfullUiShadcnTheme.muted);

    final ant = ImpaktfullUiAntDesignTheme.light().components.chip;
    // `Tag.CheckableTag`: 22 high, `colorPrimary` when it is checked.
    expect(ant.dimens.minHeight, 22);
    expect(ant.colors.background, Colors.transparent);
    expect(
      ant.colors.backgroundSelected,
      ImpaktfullUiAntDesignTheme.colorPrimary,
    );
  });
}
