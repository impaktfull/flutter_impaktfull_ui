// The base token groups of a theme (colors, textStyles, dimens, durations,
// shadows, assets) must reach the component themes: a token that only lives on
// the root theme is a token no component reads.
//
// See `ImpaktfullUiComponentsTheme.getDefault`,
// `ImpaktfullUiDefaultTheme.withMinimalChanges` and
// `ImpaktfullUiTheme.copyWithBaseTokens`.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../_core_test_helpers.dart';

void main() {
  const primary = Color(0xFF010101);
  const accent = Color(0xFF020202);
  const secondary = Color(0xFF030303);

  ImpaktfullUiTheme<Object> build({
    double radius = 8,
    BorderRadiusGeometry? borderRadius,
    BorderRadiusGeometry? borderRadiusCircle,
    double spacingUnit = 4,
    double? heightDisplay,
    double? heightText,
    double? letterSpacingDisplay,
    double? letterSpacingText,
    FontWeight? fontWeightDisplay,
    FontWeight? fontWeightText,
    ImpaktfullUiColorTheme? colors,
    ImpaktfullUiTextStylesTheme? textStyles,
    ImpaktfullUiDimensTheme? dimens,
    ImpaktfullUiDurationTheme? durations,
    ImpaktfullUiShadowsTheme? shadows,
    ImpaktfullUiAssetTheme? assets,
  }) =>
      ImpaktfullUiDefaultTheme.withMinimalChanges(
        primary: colors == null ? primary : null,
        accent: colors == null ? accent : null,
        secondary: colors == null ? secondary : null,
        radius: radius,
        borderRadius: borderRadius,
        borderRadiusCircle: borderRadiusCircle,
        spacingUnit: spacingUnit,
        heightDisplay: heightDisplay,
        heightText: heightText,
        letterSpacingDisplay: letterSpacingDisplay,
        letterSpacingText: letterSpacingText,
        fontWeightDisplay: fontWeightDisplay,
        fontWeightText: fontWeightText,
        colors: colors,
        textStyles: textStyles,
        dimens: dimens,
        durations: durations,
        shadows: shadows,
        assets: assets,
      );

  const fastDurations = ImpaktfullUiDurationTheme(
    short: Duration(milliseconds: 100),
    medium: Duration(milliseconds: 200),
    long: Duration(milliseconds: 300),
  );

  final loudShadows = ImpaktfullUiShadowsTheme.getDefault(
    shadowBase: const Color(0xFFFF00FF),
  );

  group('ImpaktfullUiComponentsTheme.getDefault', () {
    test('builds every component theme from the base tokens it is given', () {
      final base = ImpaktfullUiTheme.getDefault();
      final colors = base.colors.copyWith(accent: const Color(0xFF00FF00));
      final components = ImpaktfullUiComponentsTheme.getDefault(
        assets: base.assets,
        colors: colors,
        textStyles: base.textStyles,
        dimens: base.dimens.copyWith(borderRadius: BorderRadius.circular(21)),
        durations: fastDurations,
        shadows: loudShadows,
      );

      expect(components.button.colors.primary, const Color(0xFF00FF00));
      expect(components.button.dimens.borderRadius, BorderRadius.circular(21));
      expect(components.button.durations.loading,
          const Duration(milliseconds: 100));
      expect(components.card.shadows.card, loudShadows.small);
      expect(components.dropdown.shadows.overlay, loudShadows.large);
      expect(components.switchTheme.durations.selected,
          const Duration(milliseconds: 100));
    });

    test('is what withMinimalChanges builds its components with', () {
      final theme = build();
      final components = ImpaktfullUiComponentsTheme.getDefault(
        assets: theme.assets,
        colors: theme.colors,
        textStyles: theme.textStyles,
        dimens: theme.dimens,
        durations: theme.durations,
        shadows: theme.shadows,
      );
      expect(theme.components, components);
    });
  });

  group('withMinimalChanges reaches the component themes with', () {
    test('durations', () {
      final theme = build(durations: fastDurations);
      expect(theme.durations, fastDurations);
      expect(theme.components.button.durations.loading,
          const Duration(milliseconds: 100));
      expect(theme.components.switchTheme.durations.selected,
          const Duration(milliseconds: 100));
      expect(theme.components.tooltip.durations.wait,
          const Duration(milliseconds: 300));
      // The four component themes that built their own durations instead of
      // taking `short` from the scale, until they were mapped onto it.
      expect(theme.components.accordion.durations.expand,
          const Duration(milliseconds: 100));
      expect(theme.components.dropdown.durations.overlay,
          const Duration(milliseconds: 100));
      expect(theme.components.floatingActionButton.durations.expand,
          const Duration(milliseconds: 100));
      expect(theme.components.segmentedControl.durations.selected,
          const Duration(milliseconds: 100));
    });

    test('durations, without changing what they are by default', () {
      final theme = build();
      expect(theme.components.accordion.durations.expand,
          const Duration(milliseconds: 200));
      expect(theme.components.dropdown.durations.overlay,
          const Duration(milliseconds: 200));
      expect(theme.components.floatingActionButton.durations.expand,
          const Duration(milliseconds: 200));
      expect(theme.components.segmentedControl.durations.selected,
          const Duration(milliseconds: 200));
    });

    testWidgets('durations, in the widget that animates', (tester) async {
      await pumpImpaktfullUiApp(
        tester,
        const ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Save',
        ),
        theme: build(durations: fastDurations),
      );
      final opacity = tester.widget<AnimatedOpacity>(
        find
            .descendant(
              of: find.byType(ImpaktfullUiButton),
              matching: find.byType(AnimatedOpacity),
            )
            .first,
      );
      expect(opacity.duration, const Duration(milliseconds: 100));
    });

    test('shadows', () {
      final theme = build(shadows: loudShadows);
      expect(theme.shadows, loudShadows);
      expect(theme.components.card.shadows.card, loudShadows.small);
      expect(theme.components.cmsHeader.shadows.background,
          loudShadows.extraSmall);
      expect(theme.components.dropdown.shadows.overlay, loudShadows.large);
    });

    testWidgets('shadows, in the widget that paints them', (tester) async {
      await pumpImpaktfullUiApp(
        tester,
        const ImpaktfullUiCard(child: Text('card')),
        theme: build(shadows: loudShadows),
      );
      final container = tester.widget<ImpaktfullUiContainer>(
        find
            .descendant(
              of: find.byType(ImpaktfullUiCard),
              matching: find.byType(ImpaktfullUiContainer),
            )
            .first,
      );
      expect(container.shadow, loudShadows.small);
    });

    test('a colors group, without primary, accent and secondary', () {
      final colors = ImpaktfullUiTheme.getDefault()
          .colors
          .copyWith(accent: const Color(0xFF123456));
      final theme = build(colors: colors);
      expect(theme.colors, colors);
      expect(theme.components.button.colors.primary, const Color(0xFF123456));
    });

    test('primary, accent and secondary stay required without a colors group',
        () {
      expect(
        () => ImpaktfullUiDefaultTheme.withMinimalChanges(primary: primary),
        throwsAssertionError,
      );
      expect(
        () => ImpaktfullUiTheme.custom(primary: primary, accent: accent),
        throwsAssertionError,
      );
    });

    test('a textStyles group', () {
      final base = ImpaktfullUiTheme.getDefault();
      final textStyles = base.textStyles.copyWith(
        onCard: ImpaktfullUiTextStyleTheme.getByColor(
          color: const Color(0xFF654321),
          heightText: 2,
        ),
      );
      final theme = build(textStyles: textStyles);
      expect(theme.textStyles, textStyles);
      expect(theme.components.inputField.textStyles.text.height, 2);
      expect(theme.components.inputField.textStyles.text.color,
          const Color(0xFF654321));
    });

    test('a dimens group', () {
      final dimens = ImpaktfullUiDimensTheme.getDefault(radius: 3);
      final theme = build(radius: 99, dimens: dimens);
      expect(theme.dimens, dimens);
      expect(theme.components.button.dimens.borderRadius,
          BorderRadius.circular(3));
    });

    test('an assets group', () {
      final base = ImpaktfullUiTheme.getDefault();
      final assets = base.assets.copyWith(
        icons: base.assets.icons.copyWith(
          close: const ImpaktfullUiAsset.icon(Icons.cancel),
        ),
      );
      final theme = build(assets: assets);
      expect(theme.assets, assets);
      expect(theme.components.badge.assets.close,
          const ImpaktfullUiAsset.icon(Icons.cancel));
    });
  });

  group('typography', () {
    test('height, letterSpacing and fontWeight default to Flutter', () {
      final theme = build();
      final style = theme.textStyles.onCanvas.text.medium;
      expect(style.height, isNull);
      expect(style.letterSpacing, isNull);
      expect(style.fontWeight, isNull);
      final display = theme.textStyles.onCanvas.display.medium;
      expect(display.height, isNull);
      expect(display.letterSpacing, isNull);
      expect(display.fontWeight, isNull);
    });

    test('apply to every size of the scale, and to the component themes', () {
      final theme = build(
        heightText: 1.5714,
        letterSpacingText: 0.2,
        fontWeightText: FontWeight.w300,
        heightDisplay: 1,
        letterSpacingDisplay: -0.5,
        fontWeightDisplay: FontWeight.w800,
      );
      for (final group in theme.textStyles.all) {
        for (final style in [
          group.text.extraSmall,
          group.text.small,
          group.text.medium,
          group.text.large,
          group.text.extraLarge,
        ]) {
          expect(style.height, 1.5714);
          expect(style.letterSpacing, 0.2);
          expect(style.fontWeight, FontWeight.w300);
        }
        for (final style in [
          group.display.extraSmall,
          group.display.small,
          group.display.medium,
          group.display.large,
          group.display.extraLarge,
          group.display.extraLarge2,
        ]) {
          expect(style.height, 1);
          expect(style.letterSpacing, -0.5);
          expect(style.fontWeight, FontWeight.w800);
        }
      }
      // The font size is untouched by all of it.
      expect(theme.textStyles.onCanvas.text.small.fontSize, 14);
      expect(theme.textStyles.onCanvas.display.medium.fontSize, 30);

      final inputField = theme.components.inputField.textStyles.text;
      expect(inputField.height, 1.5714);
      expect(inputField.letterSpacing, 0.2);
      expect(inputField.fontWeight, FontWeight.w300);
    });

    testWidgets('reach the text a component renders', (tester) async {
      await pumpImpaktfullUiApp(
        tester,
        const ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.primary,
          title: 'Save',
        ),
        theme: build(heightText: 1.5714, letterSpacingText: 0.2),
      );
      final text = tester.widget<Text>(find.text('Save'));
      expect(text.style?.height, 1.5714);
      expect(text.style?.letterSpacing, 0.2);
    });
  });

  group('the border radius seed', () {
    test('grows the whole scale, clamped at 0', () {
      final scale = ImpaktfullUiDimensTheme.getDefault(radius: 10);
      expect(scale.borderRadiusExtraSmall, BorderRadius.circular(6));
      expect(scale.borderRadiusSmall, BorderRadius.circular(8));
      expect(scale.borderRadius, BorderRadius.circular(10));
      expect(scale.borderRadiusLarge, BorderRadius.circular(14));
      expect(scale.borderRadiusExtraLarge, BorderRadius.circular(18));

      final square = ImpaktfullUiDimensTheme.getDefault(radius: 0);
      expect(square.borderRadiusExtraSmall, BorderRadius.zero);
      expect(square.borderRadiusSmall, BorderRadius.zero);
      expect(square.borderRadius, BorderRadius.zero);
      expect(square.borderRadiusLarge, BorderRadius.circular(4));
    });

    test('defaults to the scale of today', () {
      final theme = build();
      expect(theme.dimens.borderRadiusExtraSmall, BorderRadius.circular(4));
      expect(theme.dimens.borderRadiusSmall, BorderRadius.circular(6));
      expect(theme.dimens.borderRadius, BorderRadius.circular(8));
      expect(theme.dimens.borderRadiusLarge, BorderRadius.circular(12));
      expect(theme.dimens.borderRadiusExtraLarge, BorderRadius.circular(16));
    });

    test('a single step wins over the seed', () {
      final theme = build(radius: 10, borderRadius: BorderRadius.circular(2));
      expect(theme.dimens.borderRadius, BorderRadius.circular(2));
      expect(theme.dimens.borderRadiusLarge, BorderRadius.circular(14));
    });

    test('reaches the component themes', () {
      final theme = build(radius: 10);
      expect(theme.components.button.dimens.borderRadius,
          BorderRadius.circular(10));
      expect(
          theme.components.card.dimens.borderRadius, BorderRadius.circular(10));
      expect(theme.components.modal.dimens.borderRadius,
          BorderRadius.circular(10));
      expect(theme.components.skeleton.dimens.borderRadius,
          BorderRadius.circular(10));
    });

    testWidgets('reaches the widget that paints the border', (tester) async {
      await pumpImpaktfullUiApp(
        tester,
        const ImpaktfullUiCard(child: Text('card')),
        theme: build(radius: 10),
      );
      final container = tester.widget<ImpaktfullUiContainer>(
        find
            .descendant(
              of: find.byType(ImpaktfullUiCard),
              matching: find.byType(ImpaktfullUiContainer),
            )
            .first,
      );
      expect(container.borderRadius, BorderRadius.circular(10));
    });
  });

  group('borderRadiusCircle', () {
    test('is a bounded pill radius, not an absurd one', () {
      // Regression: it used to be BorderRadius.circular(99999999). Flutter
      // clamps a radius when it paints, but an InkWell with that radius makes
      // a software rendered frame take minutes.
      expect(ImpaktfullUiDimensTheme.borderRadiusCircleMax, 999);
      final circle = build().dimens.borderRadiusCircle.resolve(null);
      for (final radius in [
        circle.topLeft,
        circle.topRight,
        circle.bottomLeft,
        circle.bottomRight,
      ]) {
        expect(radius.x, lessThanOrEqualTo(1000));
        expect(radius.y, lessThanOrEqualTo(1000));
      }
    });

    test('paints the same shape as the absurd radius it replaces', () {
      // Every control of this package is far smaller than 2 * 999 logical
      // pixels, so both radii clamp to the same half circle.
      for (final size in const [Size(20, 20), Size(48, 24), Size(320, 56)]) {
        final rect = Offset.zero & size;
        final pill = BorderRadius.circular(999).toRRect(rect).scaleRadii();
        final absurd =
            BorderRadius.circular(99999999).toRRect(rect).scaleRadii();
        expect(pill.tlRadiusX, absurd.tlRadiusX);
        expect(pill.tlRadiusY, absurd.tlRadiusY);
        expect(pill.brRadiusX, absurd.brRadiusX);
      }
    });

    test('is overridable', () {
      final theme = build(borderRadiusCircle: BorderRadius.circular(4));
      expect(theme.dimens.borderRadiusCircle, BorderRadius.circular(4));
    });
  });

  group('the spacing scale', () {
    test('defaults to 4 / 8 / 12 / 16 / 24 / 32', () {
      final spacing = build().dimens.spacing;
      expect(spacing.extraSmall, 4);
      expect(spacing.small, 8);
      expect(spacing.medium, 12);
      expect(spacing.large, 16);
      expect(spacing.extraLarge, 24);
      expect(spacing.extraLarge2, 32);
      expect(spacing, ImpaktfullUiSpacingTheme.getDefault());
    });

    test('grows from one unit', () {
      final spacing = build(spacingUnit: 8).dimens.spacing;
      expect(spacing.extraSmall, 8);
      expect(spacing.small, 16);
      expect(spacing.medium, 24);
      expect(spacing.large, 32);
      expect(spacing.extraLarge, 48);
      expect(spacing.extraLarge2, 64);
    });

    test('is a value with a copyWith', () {
      final spacing = ImpaktfullUiSpacingTheme.getDefault();
      expect(spacing.copyWith(), spacing);
      expect(spacing.copyWith(large: 20).large, 20);
      expect(spacing.copyWith(large: 20).small, 8);
      expect(spacing.copyWith(large: 20), isNot(spacing));
      expect(spacing.hashCode, ImpaktfullUiSpacingTheme.getDefault().hashCode);
    });

    test('is part of the dimens theme value', () {
      final dimens = ImpaktfullUiDimensTheme.getDefault();
      expect(dimens.copyWith(), dimens);
      expect(
        dimens.copyWith(spacing: dimens.spacing.copyWith(large: 20)),
        isNot(dimens),
      );
    });
  });

  group('copyWith and copyWithBaseTokens', () {
    test('copyWith replaces only what it is given', () {
      final base = ImpaktfullUiTheme.getDefault();
      final colors = base.colors.copyWith(accent: const Color(0xFF00FF00));
      final copy = base.copyWith(colors: colors);

      expect(copy.colors, colors);
      // Documented on purpose: the component themes keep the old tokens, so a
      // customisation that was layered on them survives a copyWith.
      expect(copy.components, same(base.components));
      expect(copy.components.button.colors.primary, base.colors.accent);
    });

    test('copyWithBaseTokens builds the component themes again', () {
      final base = ImpaktfullUiTheme.getDefault();
      final colors = base.colors.copyWith(accent: const Color(0xFF00FF00));
      final copy = base.copyWithBaseTokens(
        colors: colors,
        dimens: base.dimens.copyWith(borderRadius: BorderRadius.circular(21)),
        durations: fastDurations,
        shadows: loudShadows,
      );

      expect(copy.colors, colors);
      expect(copy.components.button.colors.primary, const Color(0xFF00FF00));
      expect(copy.components.button.dimens.borderRadius,
          BorderRadius.circular(21));
      expect(copy.components.button.durations.loading,
          const Duration(milliseconds: 100));
      expect(copy.components.card.shadows.card, loudShadows.small);
    });

    test('copyWithBaseTokens without arguments keeps the theme equal', () {
      final base = ImpaktfullUiTheme.getDefault();
      final copy = base.copyWithBaseTokens();
      expect(copy, base);
      expect(copy.label, base.label);
      expect(copy.brightness, base.brightness);
    });

    test('copyWithBaseTokens keeps label, brightness and customTheme', () {
      final base = ImpaktfullUiTheme.getDefaultDark<String>(
        customTheme: 'mine',
      );
      final copy = base.copyWithBaseTokens(durations: fastDurations);
      expect(copy.label, 'impaktfull Dark Theme');
      expect(copy.brightness, Brightness.dark);
      expect(copy.customTheme, 'mine');
      expect(copy.copyWithBaseTokens(label: 'other').label, 'other');
    });

    test('copyWithBaseTokens drops a component theme customisation', () {
      final base = ImpaktfullUiTheme.getDefault();
      final customised = base.copyWith(
        components: base.components.copyWith(
          card: base.components.card.copyWith(
            dimens: base.components.card.dimens
                .copyWith(padding: const EdgeInsets.all(42)),
          ),
        ),
      );
      expect(
          customised.components.card.dimens.padding, const EdgeInsets.all(42));

      final rebuilt = customised.copyWithBaseTokens(durations: fastDurations);
      expect(rebuilt.components.card.dimens.padding,
          base.components.card.dimens.padding);
    });

    testWidgets('a rebuilt token reaches a rendered widget', (tester) async {
      final base = ImpaktfullUiTheme.getDefault();
      await pumpImpaktfullUiApp(
        tester,
        const ImpaktfullUiCard(child: Text('card')),
        theme: base.copyWithBaseTokens(
          dimens: base.dimens.copyWith(borderRadius: BorderRadius.circular(21)),
        ),
      );
      final container = tester.widget<ImpaktfullUiContainer>(
        find
            .descendant(
              of: find.byType(ImpaktfullUiCard),
              matching: find.byType(ImpaktfullUiContainer),
            )
            .first,
      );
      expect(container.borderRadius, BorderRadius.circular(21));
    });
  });

  group('ImpaktfullUiThemeConfigurator', () {
    testWidgets('scopes a theme to a subtree', (tester) async {
      final base = ImpaktfullUiTheme.getDefault();
      await pumpImpaktfullUiApp(
        tester,
        Row(
          children: [
            Expanded(
              child: ImpaktfullUiThemeConfigurator(
                theme: build(radius: 0),
                child: const ImpaktfullUiCard(child: Text('square')),
              ),
            ),
            Expanded(
              child: ImpaktfullUiThemeConfigurator(
                theme: build(radius: 20),
                child: const ImpaktfullUiCard(child: Text('round')),
              ),
            ),
          ],
        ),
        theme: base,
      );

      BorderRadiusGeometry? radiusOf(String text) => tester
          .widget<ImpaktfullUiContainer>(
            find
                .ancestor(
                  of: find.text(text),
                  matching: find.byType(ImpaktfullUiContainer),
                )
                .first,
          )
          .borderRadius;

      expect(radiusOf('square'), BorderRadius.zero);
      expect(radiusOf('round'), BorderRadius.circular(20));
    });
  });
}
