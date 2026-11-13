import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../_core_test_helpers.dart';

/// The theme is only worth shipping while it still *renders* like shadcn/ui,
/// so these tests measure the pixels of the components instead of reading the
/// tokens back out of the theme. A component that starts hardcoding a size
/// again fails here.
void main() {
  final light = ImpaktfullUiShadcnTheme.light();
  final dark = ImpaktfullUiShadcnTheme.dark();

  group('colors', () {
    test('are the CSS variables of the default base color', () {
      expect(light.colors.accent, ImpaktfullUiShadcnTheme.primary);
      expect(light.colors.canvas, ImpaktfullUiShadcnTheme.background);
      expect(light.colors.card, ImpaktfullUiShadcnTheme.card);
      expect(light.colors.border, ImpaktfullUiShadcnTheme.border);
      expect(light.brightness, Brightness.light);

      expect(dark.colors.accent, ImpaktfullUiShadcnTheme.primaryDark);
      expect(dark.colors.canvas, ImpaktfullUiShadcnTheme.backgroundDark);
      expect(dark.brightness, Brightness.dark);
    });

    test('the label says which theme it is', () {
      expect(light.label, 'shadcn/ui');
      expect(dark.label, 'shadcn/ui (dark)');
    });
  });

  group('the radius scale', () {
    test('is --radius-sm, --radius-md, --radius-lg and --radius-xl', () {
      expect(
        light.dimens.borderRadius,
        BorderRadius.circular(ImpaktfullUiShadcnTheme.radiusMedium),
      );
      expect(
        light.dimens.borderRadiusSmall,
        BorderRadius.circular(ImpaktfullUiShadcnTheme.radiusSmall),
      );
      expect(
        light.dimens.borderRadiusLarge,
        BorderRadius.circular(ImpaktfullUiShadcnTheme.radiusLarge),
      );
      expect(
        light.dimens.borderRadiusExtraLarge,
        BorderRadius.circular(ImpaktfullUiShadcnTheme.radiusExtraLarge),
      );
    });

    test('reaches the card and the modal', () {
      expect(
        light.components.card.dimens.borderRadius,
        BorderRadius.circular(ImpaktfullUiShadcnTheme.radiusExtraLarge),
      );
      expect(
        light.components.modal.dimens.borderRadius,
        BorderRadius.circular(ImpaktfullUiShadcnTheme.radiusLarge),
      );
    });
  });

  group('a button', () {
    /// `button.tsx`: `sm` is `h-8`, the default `h-9` and `lg` is `h-10`.
    const heights = {
      ImpaktfullUiButtonSize.small: 32.0,
      ImpaktfullUiButtonSize.medium: 36.0,
      ImpaktfullUiButtonSize.large: 40.0,
    };

    for (final entry in heights.entries) {
      testWidgets('of size ${entry.key.name} is ${entry.value} tall',
          (tester) async {
        await pumpImpaktfullUiApp(
          tester,
          Center(
            child: ImpaktfullUiButton(
              type: ImpaktfullUiButtonType.primary,
              title: 'Button',
              size: entry.key,
              onTap: () {},
            ),
          ),
          theme: light,
        );
        expect(
          tester.getSize(find.byType(ImpaktfullUiButton)).height,
          entry.value,
        );
      });
    }

    testWidgets('of the default size is 16 wide on each side', (tester) async {
      await pumpImpaktfullUiApp(
        tester,
        Center(
          child: ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: 'Button',
            onTap: () {},
          ),
        ),
        theme: light,
      );
      final button = tester.getRect(find.byType(ImpaktfullUiButton));
      final text = tester.getRect(find.text('Button'));
      expect(text.left - button.left, 16);
      expect(button.right - text.right, 16);
    });

    testWidgets('grows when its title does not fit on one line',
        (tester) async {
      await pumpImpaktfullUiApp(
        tester,
        Center(
          child: SizedBox(
            width: 120,
            child: ImpaktfullUiButton(
              type: ImpaktfullUiButtonType.primary,
              title: 'A title that has to wrap to a second line',
              onTap: () {},
            ),
          ),
        ),
        theme: light,
      );
      expect(
        tester.getSize(find.byType(ImpaktfullUiButton)).height,
        greaterThan(36),
      );
    });
  });

  testWidgets('an input field is h-9', (tester) async {
    await pumpImpaktfullUiApp(
      tester,
      Center(
        child: ImpaktfullUiInputField(
          label: 'Label',
          value: '',
          onChanged: (_) {},
        ),
      ),
      theme: light,
    );
    expect(tester.getSize(find.byType(ImpaktfullUiCard)).height, 36);
  });

  testWidgets('a checkbox is size-4', (tester) async {
    await pumpImpaktfullUiApp(
      tester,
      Center(child: ImpaktfullUiCheckbox(value: true, onChanged: (_) {})),
      theme: light,
    );
    // The box of the checkbox, not the widget: the widget fills the space it
    // is given and centers the box in it.
    expect(
      tester.getSize(
        find
            .descendant(
              of: find.byType(ImpaktfullUiCheckbox),
              matching: find.byType(SizedBox),
            )
            .first,
      ),
      const Size.square(16),
    );
  });

  testWidgets('a switch is h-[1.15rem] w-8', (tester) async {
    await pumpImpaktfullUiApp(
      tester,
      Center(child: ImpaktfullUiSwitch(value: true, onChanged: (_) {})),
      theme: light,
    );
    final size = tester.getSize(find.byType(ImpaktfullUiSwitch));
    expect(size.width, 32);
    expect(size.height, closeTo(18.4, 0.01));
  });

  group('the focus ring', () {
    test('is ring/50 at 3px, with no offset', () {
      final focusRing = light.components.touchFeedback.focusRing;
      expect(focusRing.width, ImpaktfullUiShadcnTheme.focusRingWidth);
      expect(focusRing.offset, 0);
      expect(
        focusRing.color,
        ImpaktfullUiShadcnTheme.ring.withValues(alpha: 0.5),
      );
      expect(
        dark.components.touchFeedback.focusRing.color,
        ImpaktfullUiShadcnTheme.ringDark.withValues(alpha: 0.5),
      );
    });

    test('of an input field is the same ring', () {
      expect(
        light.components.inputField.dimens.focusRingWidth,
        ImpaktfullUiShadcnTheme.focusRingWidth,
      );
      expect(
        light.components.inputField.colors.focusRing,
        ImpaktfullUiShadcnTheme.ring.withValues(alpha: 0.5),
      );
      expect(
        light.components.inputField.colors.borderFocused,
        ImpaktfullUiShadcnTheme.ring,
      );
    });

    testWidgets('does not change the size of a focused input field',
        (tester) async {
      final focusNode = FocusNode();
      addTearDown(focusNode.dispose);
      await pumpImpaktfullUiApp(
        tester,
        Center(
          child: ImpaktfullUiInputField(
            label: 'Label',
            value: '',
            onChanged: (_) {},
            focusNode: focusNode,
          ),
        ),
        theme: light,
      );
      final unfocused = tester.getSize(find.byType(ImpaktfullUiCard));

      focusNode.requestFocus();
      await tester.pumpAndSettle();
      expect(tester.getSize(find.byType(ImpaktfullUiCard)), unfocused);
    });
  });

  test('a table row lights up on hover and when it is selected', () {
    final colors = light.components.tableRow.colors;
    expect(
      colors.backgroundHover,
      ImpaktfullUiShadcnTheme.muted.withValues(alpha: 0.5),
    );
    expect(colors.backgroundSelected, ImpaktfullUiShadcnTheme.muted);
  });

  test('a modal darkens the background without blurring it', () {
    expect(
      light.components.modal.colors.barrier,
      Colors.black.withValues(alpha: 0.5),
    );
    expect(light.components.modal.dimens.barrierBlurSigma, 0);
  });

  testWidgets('scopes to a subtree, next to another preset', (tester) async {
    await pumpImpaktfullUiApp(
      tester,
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImpaktfullUiThemeConfigurator(
            theme: ImpaktfullUiShadcnTheme.light(),
            child: ImpaktfullUiButton(
              type: ImpaktfullUiButtonType.primary,
              title: 'shadcn',
              onTap: () {},
            ),
          ),
          ImpaktfullUiThemeConfigurator(
            theme: ImpaktfullUiAntDesignTheme.light(),
            child: ImpaktfullUiButton(
              type: ImpaktfullUiButtonType.primary,
              title: 'ant',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
    expect(
      tester
          .getSize(find.ancestor(
            of: find.text('shadcn'),
            matching: find.byType(ImpaktfullUiButton),
          ))
          .height,
      36,
    );
    expect(
      tester
          .getSize(find.ancestor(
            of: find.text('ant'),
            matching: find.byType(ImpaktfullUiButton),
          ))
          .height,
      32,
    );
  });

  group('the rest of the components', () {
    test('a tooltip is bg-primary with text-xs in px-3 py-1.5', () {
      final tooltip = light.components.tooltip;
      expect(tooltip.colors.background, ImpaktfullUiShadcnTheme.primary);
      expect(tooltip.textStyles.text?.fontSize, 12);
      expect(
        tooltip.dimens.padding,
        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      );
    });

    test('a menu is p-1 with min-w-[8rem] and an item of px-2 py-1.5', () {
      expect(light.components.dropdown.dimens.padding, const EdgeInsets.all(4));
      expect(light.components.dropdown.dimens.minWidth, 128);
      expect(
        light.components.simpleListItem.dimens.padding,
        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      );
    });

    test('a radio button is size-4 that fills with a size-2 dot on it', () {
      final dimens = light.components.radioButton.dimens;
      expect(dimens.size, 16);
      // `size - 2 * dotInset`
      expect(dimens.size - 2 * dimens.dotInset, 8);
      final colors = light.components.radioButton.colors;
      // `data-checked:bg-primary data-checked:border-primary` with a
      // `bg-primary-foreground` dot, `border-input` while it is unchecked.
      expect(colors.selected, ImpaktfullUiShadcnTheme.primary);
      expect(colors.borderSelected, ImpaktfullUiShadcnTheme.primary);
      expect(
        colors.centerSelectedBackground,
        ImpaktfullUiShadcnTheme.primaryForeground,
      );
      expect(colors.border, ImpaktfullUiShadcnTheme.border);
    });

    test('a scrolling tab row is a w-fit rounded-lg track', () {
      final tabs = light.components.horizontalTabs;
      // `bg-muted rounded-lg p-[3px]`, with the space at the sides outside
      // the track instead of inside it.
      expect(tabs.colors.background, ImpaktfullUiShadcnTheme.muted);
      expect(tabs.dimens.padding, const EdgeInsets.all(3));
      expect(tabs.dimens.margin.horizontal, 32);
      expect(tabs.dimens.borderRadius, isNotNull);
      // A `TabsTrigger` fills when it is active, it has no bar under it.
      expect(light.components.horizontalTab.colors.selectedMarker, isNull);
    });

    test('a slider is a h-1.5 track with a size-4 thumb', () {
      final dimens = light.components.slider.dimens;
      expect(dimens.trackHeight, 6);
      expect(dimens.thumbSize, 16);
    });

    test('a tab is a box that fills in, not an underline', () {
      expect(
        light.components.tabBar.colors.background,
        ImpaktfullUiShadcnTheme.muted,
      );
      expect(light.components.tabBarItem.dimens.selectedMarkerHeight, 0);
      expect(
        light.components.tabBarItem.colors.selectedBackground,
        ImpaktfullUiShadcnTheme.background,
      );
    });

    testWidgets('a tab bar is h-9 with a p-[3px] list', (tester) async {
      await pumpImpaktfullUiApp(
        tester,
        Center(
          child: SizedBox(
            width: 320,
            child: DefaultTabController(
              length: 2,
              child: Builder(
                builder: (context) {
                  final controller = DefaultTabController.of(context);
                  return ImpaktfullUiTabBar(
                    controller: controller,
                    items: [
                      ImpaktfullUiTabBarItem(
                        title: 'One',
                        index: 0,
                        controller: controller,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        theme: light,
      );
      expect(tester.getSize(find.byType(ImpaktfullUiTabBar)).height, 36);
      expect(light.components.tabBar.dimens.padding, const EdgeInsets.all(3));
    });
  });

  test('the fontFamily is the one of the app, or the platform font', () {
    expect(light.textStyles.onCanvas.text.medium.fontFamily, isNull);
    expect(
      ImpaktfullUiShadcnTheme.light(fontFamily: 'Geist')
          .textStyles
          .onCanvas
          .text
          .medium
          .fontFamily,
      'Geist',
    );
  });
  group('the tokens of your own shadcn/ui theme', () {
    test('the default colors are the default base color', () {
      expect(
          ImpaktfullUiShadcnTheme.light(colors: ImpaktfullUiShadcnColors.light),
          light);
      expect(
          ImpaktfullUiShadcnTheme.dark(colors: ImpaktfullUiShadcnColors.dark),
          dark);
    });

    const brand = Color(0xFF0E7C66);
    const onBrand = Color(0xFFFFFFF0);
    const surface = Color(0xFFF4F1EA);
    const muted = Color(0xFFEDE8DD);
    const mutedText = Color(0xFF6B6455);
    const accent = Color(0xFFE6F2EF);
    const secondary = Color(0xFFDDEFE9);
    const onSecondary = Color(0xFF0B3D33);
    const line = Color(0xFFD9D2C3);
    const ring = Color(0xFF2E9C83);
    const red = Color(0xFFC62828);
    const amber = Color(0xFFB7791F);
    const green = Color(0xFF2F855A);
    const blue = Color(0xFF2B6CB0);
    final colors = ImpaktfullUiShadcnColors.light.copyWith(
      background: surface,
      foreground: const Color(0xFF1B1A17),
      card: const Color(0xFFFFFFFF),
      primary: brand,
      primaryForeground: onBrand,
      secondary: secondary,
      secondaryForeground: onSecondary,
      muted: muted,
      mutedForeground: mutedText,
      accent: accent,
      destructive: red,
      border: line,
      ring: ring,
      warning: amber,
      success: green,
      info: blue,
    );
    final theme = ImpaktfullUiShadcnTheme.light(colors: colors);

    test('reach the base tokens', () {
      expect(theme.colors.accent, brand);
      expect(theme.colors.textOnAccent, onBrand);
      expect(theme.colors.primary, brand);
      expect(theme.colors.canvas, surface);
      expect(theme.colors.card, const Color(0xFFFFFFFF));
      expect(theme.colors.card2, muted);
      expect(theme.colors.secondary, secondary);
      expect(theme.colors.textSecondary, mutedText);
      expect(theme.colors.border, line);
      expect(theme.colors.text, const Color(0xFF1B1A17));
      expect(theme.colors.destructive, red);
      expect(theme.colors.error, red);
      expect(theme.colors.warning, amber);
      expect(theme.colors.success, green);
      expect(theme.colors.info, blue);
    });

    test('reach the components that shadcn/ui colors itself', () {
      final components = theme.components;
      expect(components.button.colors.primaryHover?.background,
          brand.withValues(alpha: 0.9));
      expect(components.button.colors.secondaryHover?.background, accent);
      expect(components.button.colors.tertiaryHover?.background, accent);
      expect(components.inputField.colors.borderFocused, ring);
      expect(
          components.inputField.colors.focusRing, ring.withValues(alpha: 0.5));
      expect(components.touchFeedback.focusRing.color,
          ring.withValues(alpha: 0.5));
      expect(components.switchTheme.colors.activeBackground, brand);
      expect(components.switchTheme.colors.inactiveBackground, line);
      expect(components.switchTheme.colors.active, surface);
      expect(components.badge.colors.primaryBackground, brand);
      expect(components.badge.colors.primaryText, onBrand);
      expect(components.badge.colors.secondaryBackground, secondary);
      expect(components.badge.colors.secondaryText, onSecondary);
      expect(components.badge.colors.errorBackground, red);
      expect(components.badge.colors.warningBackground, amber);
      expect(components.badge.colors.successBackground, green);
      expect(components.radioButton.colors.borderSelected, brand);
      expect(components.radioButton.colors.centerSelectedBackground, onBrand);
      expect(components.tabBar.colors.background, muted);
      expect(components.tabBarItem.colors.selectedBackground, surface);
      expect(components.segmentedControl.colors.background, muted);
      expect(components.tooltip.colors.background, brand);
      expect(components.skeleton.colors.background, muted);
      expect(components.skeleton.colors.highlight, line);
      expect(components.divider.colors.color, line);
      expect(components.notificationBadge.colors.border, surface);
      expect(components.autoComplete.colors.highlightedItem, accent);
      expect(components.notification.colors.error, red);
    });

    test('in dark, the surfaces of the active items are the card', () {
      final darkTheme = ImpaktfullUiShadcnTheme.dark(
        colors: ImpaktfullUiShadcnColors.dark.copyWith(
          card: const Color(0xFF202020),
          muted: const Color(0xFF303030),
          mutedForeground: const Color(0xFF909090),
        ),
      );
      final components = darkTheme.components;
      expect(darkTheme.brightness, Brightness.dark);
      expect(components.tabBarItem.colors.selectedBackground,
          const Color(0xFF202020));
      expect(components.switchTheme.colors.inactiveBackground,
          const Color(0xFF303030));
      expect(components.skeleton.colors.highlight, const Color(0xFF909090));
    });

    test('--radius grows the whole scale like in shadcn/ui', () {
      final rounder = ImpaktfullUiShadcnTheme.light(radius: 16);
      expect(rounder.dimens.borderRadiusSmall, BorderRadius.circular(12));
      expect(rounder.dimens.borderRadius, BorderRadius.circular(14));
      expect(rounder.dimens.borderRadiusLarge, BorderRadius.circular(16));
      expect(rounder.dimens.borderRadiusExtraLarge, BorderRadius.circular(20));
      expect(rounder.components.card.dimens.borderRadius,
          BorderRadius.circular(20));
      expect(rounder.components.modal.dimens.borderRadius,
          BorderRadius.circular(16));
      expect(rounder.components.bottomSheet.dimens.borderRadius,
          BorderRadius.circular(16));
      expect(rounder.components.iconButton.dimens.borderRadius,
          BorderRadius.circular(14));
      expect(rounder.components.simpleListItem.dimens.borderRadius,
          BorderRadius.circular(12));
      expect(rounder.components.tabBar.dimens.borderRadius,
          BorderRadius.circular(16));
      expect(rounder.components.tabBarItem.dimens.borderRadius,
          BorderRadius.circular(14));
    });

    test('a radius of 0 makes everything square, never negative', () {
      final square = ImpaktfullUiShadcnTheme.light(radius: 0);
      expect(square.dimens.borderRadiusSmall, BorderRadius.zero);
      expect(square.dimens.borderRadius, BorderRadius.zero);
      expect(square.dimens.borderRadiusLarge, BorderRadius.zero);
      expect(square.dimens.borderRadiusExtraLarge, BorderRadius.circular(4));
    });

    testWidgets('a control is drawn with the radius of --radius-md',
        (tester) async {
      await pumpImpaktfullUiApp(
        tester,
        Center(
          child: ImpaktfullUiIconButton(
            onTap: () {},
            asset: ImpaktfullUiAsset.icon(Icons.add),
          ),
        ),
        theme: ImpaktfullUiShadcnTheme.light(radius: 20),
      );
      final feedback = tester.widget<ImpaktfullUiTouchFeedback>(
        find.descendant(
          of: find.byType(ImpaktfullUiIconButton),
          matching: find.byType(ImpaktfullUiTouchFeedback),
        ),
      );
      expect(feedback.borderRadius, BorderRadius.circular(18));
    });

    test('fontFamilyDisplay is the font of the display styles', () {
      final fonts = ImpaktfullUiShadcnTheme.light(
        fontFamily: 'Inter',
        fontFamilyDisplay: 'Plus Jakarta Sans',
      );
      expect(fonts.textStyles.onCanvas.text.medium.fontFamily, 'Inter');
      expect(fonts.textStyles.onCanvas.display.medium.fontFamily,
          'Plus Jakarta Sans');
      final one = ImpaktfullUiShadcnTheme.light(fontFamily: 'Geist');
      expect(one.textStyles.onCanvas.display.medium.fontFamily, 'Geist');
    });

    test('label names the theme', () {
      expect(ImpaktfullUiShadcnTheme.light(label: 'Brand').label, 'Brand');
      expect(ImpaktfullUiShadcnTheme.dark(label: 'Brand dark').label,
          'Brand dark');
    });

    test('a customTheme rides along', () {
      final custom = ImpaktfullUiShadcnTheme.light<String>(
        colors: colors,
        customTheme: 'brand',
      );
      expect(custom.customTheme, 'brand');
    });
  });

  group('ImpaktfullUiShadcnColors', () {
    test('compares by value', () {
      expect(
        ImpaktfullUiShadcnColors.light.copyWith(),
        ImpaktfullUiShadcnColors.light,
      );
      expect(
        ImpaktfullUiShadcnColors.light.copyWith().hashCode,
        ImpaktfullUiShadcnColors.light.hashCode,
      );
      expect(
        ImpaktfullUiShadcnColors.light.copyWith(primary: Colors.red),
        isNot(ImpaktfullUiShadcnColors.light),
      );
    });

    test('copyWith changes every field', () {
      const value = Color(0xFF123456);
      final all = ImpaktfullUiShadcnColors.light.copyWith(
        accent: value,
        background: value,
        border: value,
        card: value,
        destructive: value,
        foreground: value,
        info: value,
        muted: value,
        mutedForeground: value,
        primary: value,
        primaryForeground: value,
        ring: value,
        secondary: value,
        secondaryForeground: value,
        success: value,
        warning: value,
      );
      expect(all.accent, value);
      expect(all.background, value);
      expect(all.border, value);
      expect(all.card, value);
      expect(all.destructive, value);
      expect(all.foreground, value);
      expect(all.info, value);
      expect(all.muted, value);
      expect(all.mutedForeground, value);
      expect(all.primary, value);
      expect(all.primaryForeground, value);
      expect(all.ring, value);
      expect(all.secondary, value);
      expect(all.secondaryForeground, value);
      expect(all.success, value);
      expect(all.warning, value);
    });

    test('light and dark are the variables of the default base color', () {
      expect(ImpaktfullUiShadcnColors.light.primary,
          ImpaktfullUiShadcnTheme.primary);
      expect(ImpaktfullUiShadcnColors.light.secondaryForeground,
          ImpaktfullUiShadcnTheme.primary);
      expect(ImpaktfullUiShadcnColors.dark.primary,
          ImpaktfullUiShadcnTheme.primaryDark);
      expect(ImpaktfullUiShadcnColors.dark.secondaryForeground,
          ImpaktfullUiShadcnTheme.foregroundDark);
      expect(ImpaktfullUiShadcnColors.light.warning,
          ImpaktfullUiShadcnTheme.warning);
    });
  });
}
