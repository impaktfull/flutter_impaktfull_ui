import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../_core_test_helpers.dart';

/// The theme is only worth shipping while it still *renders* like Ant Design,
/// so these tests measure the pixels of the components instead of reading the
/// tokens back out of the theme. A component that starts hardcoding a size
/// again fails here.
void main() {
  final light = ImpaktfullUiAntDesignTheme.light();
  final dark = ImpaktfullUiAntDesignTheme.dark();

  group('colors', () {
    test('are the seed and the alias tokens', () {
      expect(light.colors.accent, ImpaktfullUiAntDesignTheme.colorPrimary);
      expect(light.colors.text, ImpaktfullUiAntDesignTheme.colorText);
      expect(light.colors.border, ImpaktfullUiAntDesignTheme.colorBorder);
      expect(light.colors.canvas, ImpaktfullUiAntDesignTheme.colorBgLayout);
      expect(light.colors.card, ImpaktfullUiAntDesignTheme.colorBgContainer);
    });

    test('follow the dark algorithm in the dark theme', () {
      expect(dark.colors.accent, ImpaktfullUiAntDesignTheme.colorPrimaryDark);
      expect(
        dark.colors.canvas,
        ImpaktfullUiAntDesignTheme.colorBgLayoutDark,
      );
      expect(
        dark.colors.card,
        ImpaktfullUiAntDesignTheme.colorBgContainerDark,
      );
      expect(dark.brightness, Brightness.dark);
    });

    test('the label says which theme it is', () {
      expect(light.label, 'Ant Design');
      expect(dark.label, 'Ant Design (dark)');
    });
  });

  test('the radius is borderRadius, with borderRadiusLG on a card', () {
    expect(
      light.dimens.borderRadius,
      BorderRadius.circular(ImpaktfullUiAntDesignTheme.borderRadius),
    );
    expect(
      light.components.card.dimens.borderRadius,
      BorderRadius.circular(ImpaktfullUiAntDesignTheme.borderRadiusLarge),
    );
    expect(
      light.components.modal.dimens.borderRadius,
      BorderRadius.circular(ImpaktfullUiAntDesignTheme.borderRadiusLarge),
    );
  });

  group('controlHeight', () {
    const heights = {
      ImpaktfullUiButtonSize.extraSmall:
          ImpaktfullUiAntDesignTheme.controlHeightSmall,
      ImpaktfullUiButtonSize.medium: ImpaktfullUiAntDesignTheme.controlHeight,
      ImpaktfullUiButtonSize.large:
          ImpaktfullUiAntDesignTheme.controlHeightLarge,
    };

    for (final entry in heights.entries) {
      testWidgets('a button of size ${entry.key.name} is ${entry.value} tall',
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

    testWidgets('an input field is controlHeight tall too', (tester) async {
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
      expect(
        tester.getSize(find.byType(ImpaktfullUiCard)).height,
        ImpaktfullUiAntDesignTheme.controlHeight,
      );
    });

    testWidgets('a button has 15 of padding on each side', (tester) async {
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
      expect(text.left - button.left, 15);
      expect(button.right - text.right, 15);
    });
  });

  testWidgets('a checkbox is controlInteractiveSize', (tester) async {
    await pumpImpaktfullUiApp(
      tester,
      Center(child: ImpaktfullUiCheckbox(value: true, onChanged: (_) {})),
      theme: light,
    );
    expect(
      tester.getSize(
        find
            .descendant(
              of: find.byType(ImpaktfullUiCheckbox),
              matching: find.byType(SizedBox),
            )
            .first,
      ),
      const Size.square(ImpaktfullUiAntDesignTheme.controlInteractiveSize),
    );
  });

  testWidgets('a switch is a 44 x 22 track with an 18 thumb', (tester) async {
    await pumpImpaktfullUiApp(
      tester,
      Center(child: ImpaktfullUiSwitch(value: true, onChanged: (_) {})),
      theme: light,
    );
    expect(
      tester.getSize(find.byType(ImpaktfullUiSwitch)),
      const Size(44, 22),
    );
    expect(light.components.switchTheme.dimens.thumbSize, 18);
  });

  group('the hover and active ramp', () {
    testWidgets('a primary button turns colorPrimaryHover while hovered',
        (tester) async {
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
      expect(
        _buttonBackground(tester),
        ImpaktfullUiAntDesignTheme.colorPrimary,
      );

      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);
      await gesture.moveTo(tester.getCenter(find.text('Button')));
      await tester.pumpAndSettle();

      expect(
        _buttonBackground(tester),
        ImpaktfullUiAntDesignTheme.colorPrimaryHover,
      );
    });

    test('every state of every button type has its colors', () {
      final colors = light.components.button.colors;
      expect(
        colors.primaryPressed?.background,
        ImpaktfullUiAntDesignTheme.colorPrimaryActive,
      );
      expect(
        colors.secondaryHover?.border,
        ImpaktfullUiAntDesignTheme.colorPrimaryHover,
      );
      expect(
        colors.destructiveHover?.background,
        ImpaktfullUiAntDesignTheme.colorErrorHover,
      );
      expect(
        colors.primaryDisabled?.text,
        ImpaktfullUiAntDesignTheme.colorTextDisabled,
      );
      expect(
        dark.components.button.colors.destructivePressed?.background,
        ImpaktfullUiAntDesignTheme.colorErrorActiveDark,
      );
    });
  });

  test('a focused control has a 4px outline, 1 away from it', () {
    final focusRing = light.components.touchFeedback.focusRing;
    expect(focusRing.color, ImpaktfullUiAntDesignTheme.colorPrimaryBorder);
    expect(focusRing.width, 4);
    expect(focusRing.offset, 1);
  });

  test('a focused input field is bordered and ringed', () {
    final colors = light.components.inputField.colors;
    expect(colors.borderFocused, ImpaktfullUiAntDesignTheme.colorPrimaryHover);
    expect(colors.borderHover, ImpaktfullUiAntDesignTheme.colorPrimaryHover);
    expect(colors.focusRing, ImpaktfullUiAntDesignTheme.controlOutline);
    expect(light.components.inputField.dimens.focusRingWidth, 2);
  });

  test('a table is Ant: an alter header, a hovered row and 16 cells', () {
    expect(
      light.components.tableHeader.colors.background,
      ImpaktfullUiAntDesignTheme.colorFillAlter,
    );
    expect(
      light.components.tableRow.colors.backgroundHover,
      ImpaktfullUiAntDesignTheme.colorFillAlter,
    );
    expect(
      light.components.tableRow.colors.border,
      ImpaktfullUiAntDesignTheme.colorBorderSecondary,
    );
    expect(
      light.components.tableRowItem.dimens.padding,
      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  });

  test('a modal darkens the background without blurring it', () {
    expect(
      light.components.modal.colors.barrier,
      Colors.black.withValues(alpha: 0.45),
    );
    expect(light.components.modal.dimens.barrierBlurSigma, 0);
  });

  group('the rest of the components', () {
    test('a tooltip is colorBgSpotlight with white text in 6px 8px', () {
      final tooltip = light.components.tooltip;
      expect(
        tooltip.colors.background,
        ImpaktfullUiAntDesignTheme.colorBgSpotlight,
      );
      expect(tooltip.textStyles.text?.color, Colors.white);
      expect(
        tooltip.dimens.padding,
        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      );
    });

    test('a dropdown menu is padding 4 at borderRadiusLG, items 5px 12px', () {
      expect(
        light.components.dropdown.dimens.borderRadius,
        BorderRadius.circular(ImpaktfullUiAntDesignTheme.borderRadiusLarge),
      );
      expect(light.components.dropdown.dimens.padding, const EdgeInsets.all(4));
      expect(
        light.components.simpleListItem.dimens.padding,
        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      );
    });

    test('a radio button is radioSize with a dotSize dot in white on primary',
        () {
      final dimens = light.components.radioButton.dimens;
      expect(dimens.size, ImpaktfullUiAntDesignTheme.controlInteractiveSize);
      // `dotSize` is `radioSize - (dotPadding + lineWidth) * 2`, with a
      // `dotPadding` of 4 and a `lineWidth` of 1.
      expect(dimens.size - 2 * dimens.dotInset, 6);
      final colors = light.components.radioButton.colors;
      // `radioBgColor` and `radioColor` of a theme that is not `wireframe`.
      expect(colors.selected, ImpaktfullUiAntDesignTheme.colorPrimary);
      expect(colors.borderSelected, ImpaktfullUiAntDesignTheme.colorPrimary);
      expect(colors.centerSelectedBackground, Colors.white);
    });

    test('a slider is a 4px rail with a 14px handle', () {
      final dimens = light.components.slider.dimens;
      expect(dimens.trackHeight, 4);
      expect(dimens.thumbSize, 14);
      expect(dimens.thumbBorderWidth, 2);
    });

    test('a tab is an underline, not a box', () {
      expect(light.components.tabBarItem.colors.background, Colors.transparent);
      expect(
        light.components.tabBarItem.colors.selectedMarker,
        ImpaktfullUiAntDesignTheme.colorPrimary,
      );
      expect(light.components.tabBarItem.dimens.selectedMarkerHeight, 2);
      expect(
        light.components.tabBarItem.dimens.selectedMarkerWidth,
        double.infinity,
      );
      expect(
        light.components.tabBar.colors.divider,
        ImpaktfullUiAntDesignTheme.colorSplit,
      );
    });

    test('a segmented control is controlHeight with padding 2', () {
      final dimens = light.components.segmentedControl.dimens;
      expect(dimens.height, ImpaktfullUiAntDesignTheme.controlHeight);
      expect(dimens.padding, const EdgeInsets.all(2));
    });
  });

  test('the line box of the text is 22 for a font size of 14', () {
    final style = light.textStyles.onCanvas.text.medium;
    expect(style.fontSize, 14);
    expect((style.fontSize! * style.height!).roundToDouble(), 22);
  });
}

/// The background the button paints, which is the color of the
/// [ImpaktfullUiTouchFeedback] inside it.
Color? _buttonBackground(WidgetTester tester) => tester
    .widget<ImpaktfullUiTouchFeedback>(
      find
          .descendant(
            of: find.byType(ImpaktfullUiButton),
            matching: find.byType(ImpaktfullUiTouchFeedback),
          )
          .first,
    )
    .color;
