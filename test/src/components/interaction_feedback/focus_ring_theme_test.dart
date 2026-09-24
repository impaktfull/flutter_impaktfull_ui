import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../_core_test_helpers.dart';

/// Proves that every token of [ImpaktfullUiFocusRingTheme] changes the ring
/// that is drawn around a focused element, and that the default ring is the
/// one from before the tokens existed: the accent color at 66%, 2 logical
/// pixels thick, 1 logical pixel outside the child.

const _childKey = Key('child');
const _child = SizedBox(key: _childKey, width: 120, height: 48);

/// The accent of the default theme at 66%: the color of the default ring.
final _defaultColor = ImpaktfullUiTheme.getDefault()
    .colors
    .accent
    .withAlpha((255 * 0.66).round());

/// The theme with [focusRing] on its touch feedback theme.
ImpaktfullUiTheme _themeWithRing(ImpaktfullUiFocusRingTheme focusRing) {
  final theme = ImpaktfullUiTheme.getDefault();
  return theme.copyWith(
    components: theme.components.copyWith(
      touchFeedback:
          theme.components.touchFeedback.copyWith(focusRing: focusRing),
    ),
  );
}

Future<void> _pumpRing(
  WidgetTester tester, {
  ImpaktfullUiFocusRingTheme? theme,
  ImpaktfullUiFocusRingTheme? appRing,
  bool hasFocus = true,
}) =>
    pumpImpaktfullUiApp(
      tester,
      Center(
        child: ImpaktfullUiFocusFeedback(
          hasFocus: hasFocus,
          borderRadius: BorderRadius.circular(8),
          theme: theme,
          child: _child,
        ),
      ),
      theme: appRing == null ? null : _themeWithRing(appRing),
    );

/// The container that paints the ring: the only one inside the focus
/// feedback.
Finder _ring() => find.descendant(
      of: find.byType(ImpaktfullUiFocusFeedback),
      matching: find.byType(Container),
    );

BorderSide _ringSide(WidgetTester tester) {
  final decoration =
      tester.widget<Container>(_ring()).decoration! as BoxDecoration;
  return decoration.border!.top;
}

/// How far the ring is drawn outside of the child, on every side.
double _ringOffset(WidgetTester tester) {
  final child = tester.getRect(find.byKey(_childKey));
  final ring = tester.getRect(_ring());
  expect(child.left - ring.left, child.top - ring.top);
  expect(ring.right - child.right, ring.bottom - child.bottom);
  expect(child.left - ring.left, ring.right - child.right);
  return child.left - ring.left;
}

void main() {
  group('the default ring', () {
    testWidgets('is the accent color at 66%, 2 wide, 1 outside the child',
        (tester) async {
      await _pumpRing(tester);
      expect(_ringSide(tester).color, _defaultColor);
      expect(_ringSide(tester).width, 2);
      expect(_ringSide(tester).strokeAlign, BorderSide.strokeAlignOutside);
      expect(_ringOffset(tester), 1);
    });

    testWidgets('is transparent without focus', (tester) async {
      await _pumpRing(tester, hasFocus: false);
      expect(_ringSide(tester).color, Colors.transparent);
    });

    test('has no color, so the accent of the theme is used', () {
      const ring = ImpaktfullUiFocusRingTheme();
      expect(ring.color, isNull);
      expect(ring.width, 2);
      expect(ring.offset, 1);
      expect(
        ImpaktfullUiTheme.getDefault().components.touchFeedback.focusRing,
        ring,
      );
    });
  });

  group('color', () {
    testWidgets('of the theme is the color of the ring', (tester) async {
      await _pumpRing(
        tester,
        appRing: const ImpaktfullUiFocusRingTheme(color: Color(0xFF00FF00)),
      );
      expect(_ringSide(tester).color, const Color(0xFF00FF00));
    });

    testWidgets('of the widget wins over the theme', (tester) async {
      await _pumpRing(
        tester,
        appRing: const ImpaktfullUiFocusRingTheme(color: Color(0xFF00FF00)),
        theme: const ImpaktfullUiFocusRingTheme(color: Color(0xFFFF0000)),
      );
      expect(_ringSide(tester).color, const Color(0xFFFF0000));
    });
  });

  testWidgets('width is the thickness of the ring', (tester) async {
    await _pumpRing(
      tester,
      appRing: const ImpaktfullUiFocusRingTheme(width: 3),
    );
    expect(_ringSide(tester).width, 3);
  });

  group('offset', () {
    testWidgets('moves the ring away from the child', (tester) async {
      // A shadcn style ring: 3 wide, 3 away from the component, so it never
      // touches the border of the component itself.
      await _pumpRing(
        tester,
        appRing: const ImpaktfullUiFocusRingTheme(width: 3, offset: 3),
      );
      expect(_ringOffset(tester), 3);
      expect(_ringSide(tester).width, 3);
    });

    testWidgets('zero draws the ring against the child', (tester) async {
      await _pumpRing(
        tester,
        appRing: const ImpaktfullUiFocusRingTheme(offset: 0),
      );
      expect(_ringOffset(tester), 0);
    });

    testWidgets('negative draws the ring over the child', (tester) async {
      await _pumpRing(
        tester,
        appRing: const ImpaktfullUiFocusRingTheme(offset: -2),
      );
      expect(_ringOffset(tester), -2);
    });
  });

  testWidgets('a touch feedback uses the ring of the theme', (tester) async {
    await pumpImpaktfullUiApp(
      tester,
      Center(
        child: ImpaktfullUiTouchFeedback(
          onTap: () {},
          child: _child,
        ),
      ),
      theme: _themeWithRing(
        const ImpaktfullUiFocusRingTheme(color: Color(0xFF123456), width: 4),
      ),
    );
    // Tab focuses it with a keyboard: only then the ring is shown.
    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pumpAndSettle();
    expect(_ringSide(tester).color, const Color(0xFF123456));
    expect(_ringSide(tester).width, 4);
  });

  testWidgets('the ring of the touch feedback of an instance wins',
      (tester) async {
    await pumpImpaktfullUiApp(
      tester,
      Center(
        child: ImpaktfullUiTouchFeedback(
          onTap: () {},
          theme: const ImpaktfullUiTouchFeedbackTheme(
            colors: ImpaktfullUiTouchFeedbackColorTheme(),
            focusRing: ImpaktfullUiFocusRingTheme(color: Color(0xFFABCDEF)),
          ),
          child: _child,
        ),
      ),
      theme: _themeWithRing(
        const ImpaktfullUiFocusRingTheme(color: Color(0xFF123456)),
      ),
    );
    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pumpAndSettle();
    expect(_ringSide(tester).color, const Color(0xFFABCDEF));
  });

  group('the theme class', () {
    test('copyWith changes one token and keeps the others', () {
      const ring = ImpaktfullUiFocusRingTheme(
        color: Color(0xFF00FF00),
        width: 3,
        offset: 2,
      );
      final changed = ring.copyWith(width: 4);
      expect(changed.color, const Color(0xFF00FF00));
      expect(changed.width, 4);
      expect(changed.offset, 2);
      expect(ring.copyWith(), ring);
    });

    test('compares by value', () {
      expect(
        const ImpaktfullUiFocusRingTheme(color: Color(0xFF00FF00), width: 3),
        const ImpaktfullUiFocusRingTheme(color: Color(0xFF00FF00), width: 3),
      );
      expect(
        const ImpaktfullUiFocusRingTheme(color: Color(0xFF00FF00), width: 3)
            .hashCode,
        const ImpaktfullUiFocusRingTheme(color: Color(0xFF00FF00), width: 3)
            .hashCode,
      );
      expect(
        const ImpaktfullUiFocusRingTheme(width: 3),
        isNot(const ImpaktfullUiFocusRingTheme(width: 4)),
      );
    });
  });
}
