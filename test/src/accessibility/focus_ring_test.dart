// The focus ring: one per component, and off everywhere when an app says so.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../_core_test_helpers.dart';

ImpaktfullUiTheme _themeWithRing(ImpaktfullUiFocusRingTheme focusRing) {
  final base = ImpaktfullUiTheme.getDefault();
  return base.copyWith(
    components: base.components.copyWith(
      touchFeedback:
          base.components.touchFeedback.copyWith(focusRing: focusRing),
    ),
  );
}

/// The number of rings that are *visible* inside [of].
///
/// An `ImpaktfullUiFocusFeedback` keeps its box in the tree while nothing has
/// focus and paints a transparent border in it, so the widgets say nothing
/// about what a person sees: the colour of the border does.
int _rings(WidgetTester tester, Finder of) => tester
        .widgetList<Container>(
      find.descendant(
        of: find.descendant(
          of: of,
          matching: find.byType(ImpaktfullUiFocusFeedback),
        ),
        matching: find.descendant(
          of: find.byType(PositionedDirectional),
          matching: find.byType(Container),
        ),
      ),
    )
        .where((container) {
      final border = (container.decoration as BoxDecoration?)?.border?.top;
      return border != null && border.color.a > 0;
    }).length;

Future<FocusNode> _pumpInputField(
  WidgetTester tester, {
  ImpaktfullUiTheme? theme,
}) async {
  final focusNode = FocusNode();
  addTearDown(focusNode.dispose);
  await pumpImpaktfullUiApp(
    tester,
    Center(
      child: SizedBox(
        width: 300,
        child: ImpaktfullUiInputField(
          label: 'Verification code',
          value: '',
          onChanged: (_) {},
          focusNode: focusNode,
        ),
      ),
    ),
    theme: theme,
  );
  focusNode.requestFocus();
  await tester.pumpAndSettle();
  return focusNode;
}

/// The shadows the card of the field paints, which is where its own ring is.
///
/// The field passes them in the theme of its card, not in its `shadow`.
List<BoxShadow> _cardShadows(WidgetTester tester) {
  final card = tester.widget<ImpaktfullUiCard>(find.byType(ImpaktfullUiCard));
  return [...?card.shadow, ...?card.theme?.shadows.card];
}

void main() {
  group('an input field that draws its own ring', () {
    /// A theme with a ring on the field itself, like both design system
    /// presets have.
    ImpaktfullUiTheme themeWithFieldRing() {
      final base = ImpaktfullUiTheme.getDefault();
      return base.copyWith(
        components: base.components.copyWith(
          inputField: base.components.inputField.copyWith(
            colors: base.components.inputField.colors.copyWith(
              focusRing: const Color(0xFF00FF00),
            ),
          ),
        ),
      );
    }

    testWidgets('draws exactly one ring', (tester) async {
      await _pumpInputField(tester, theme: themeWithFieldRing());
      expect(
        _rings(tester, find.byType(ImpaktfullUiInputField)),
        0,
        reason: 'the card of the field does not add a ring of its own to the '
            'one the field paints as a shadow',
      );
      expect(
        _cardShadows(tester).where(
          (shadow) => shadow.color == const Color(0xFF00FF00),
        ),
        hasLength(1),
      );
    });

    testWidgets('paints no ring at all when the theme turns them off',
        (tester) async {
      final base = themeWithFieldRing();
      await _pumpInputField(
        tester,
        theme: base.copyWith(
          components: base.components.copyWith(
            touchFeedback: base.components.touchFeedback.copyWith(
              focusRing: const ImpaktfullUiFocusRingTheme(enabled: false),
            ),
          ),
        ),
      );
      expect(_rings(tester, find.byType(ImpaktfullUiInputField)), 0);
      expect(
        _cardShadows(tester).where(
          (shadow) => shadow.color == const Color(0xFF00FF00),
        ),
        isEmpty,
      );
    });
  });

  testWidgets('a field without a ring of its own keeps the one of its card',
      (tester) async {
    // Tabbing focuses the card of the field, which is what draws the ring of
    // the default theme.
    await pumpImpaktfullUiApp(
      tester,
      Center(
        child: SizedBox(
          width: 300,
          child: ImpaktfullUiInputField(
            label: 'Verification code',
            value: '',
            onChanged: (_) {},
          ),
        ),
      ),
    );
    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pumpAndSettle();
    expect(_rings(tester, find.byType(ImpaktfullUiInputField)), 1);
  });

  testWidgets('the ring of a field is as thick as the theme asks',
      (tester) async {
    final base = ImpaktfullUiTheme.getDefault();
    await _pumpInputField(
      tester,
      theme: base.copyWith(
        components: base.components.copyWith(
          inputField: base.components.inputField.copyWith(
            colors: base.components.inputField.colors.copyWith(
              focusRing: const Color(0xFF00FF00),
            ),
            dimens: base.components.inputField.dimens.copyWith(
              focusRingWidth: 3,
              borderWidth: 1,
            ),
          ),
        ),
      ),
    );
    final ring = _cardShadows(tester)
        .firstWhere((shadow) => shadow.color == const Color(0xFF00FF00));
    expect(
      ring.spreadRadius,
      3,
      reason: 'the border of a card is painted inside its box, so the ring '
          'that spreads out of it is exactly `focusRingWidth` thick',
    );
  });

  testWidgets('a slider paints no ring when the theme turns them off',
      (tester) async {
    Widget slider() => Center(
          child: SizedBox(
            width: 200,
            child: ImpaktfullUiSlider(
              value: 0.5,
              min: 0,
              max: 1,
              onChanged: (_) {},
            ),
          ),
        );

    BoxDecoration? sliderRing(WidgetTester tester) => tester
        .widgetList<Container>(
          find.descendant(
            of: find.byType(ImpaktfullUiSlider),
            matching: find.byType(Container),
          ),
        )
        .map((container) => container.foregroundDecoration)
        .whereType<BoxDecoration>()
        .firstOrNull;

    await pumpImpaktfullUiApp(tester, slider());
    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pumpAndSettle();
    expect(sliderRing(tester), isNotNull);

    await pumpImpaktfullUiApp(
      tester,
      slider(),
      theme: _themeWithRing(const ImpaktfullUiFocusRingTheme(enabled: false)),
    );
    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pumpAndSettle();
    expect(sliderRing(tester), isNull);
  });

  group('enabled: false', () {
    testWidgets('takes the ring off a button', (tester) async {
      await pumpImpaktfullUiApp(
        tester,
        Center(
          child: ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: 'Verify',
            onTap: () {},
          ),
        ),
        theme: _themeWithRing(const ImpaktfullUiFocusRingTheme()),
      );
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pumpAndSettle();
      expect(_rings(tester, find.byType(ImpaktfullUiButton)), 1);

      await pumpImpaktfullUiApp(
        tester,
        Center(
          child: ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: 'Verify',
            onTap: () {},
          ),
        ),
        theme: _themeWithRing(
          const ImpaktfullUiFocusRingTheme(enabled: false),
        ),
      );
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pumpAndSettle();
      expect(_rings(tester, find.byType(ImpaktfullUiButton)), 0);
    });
  });
}
