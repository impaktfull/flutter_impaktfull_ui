import 'package:flutter/material.dart';
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
}
