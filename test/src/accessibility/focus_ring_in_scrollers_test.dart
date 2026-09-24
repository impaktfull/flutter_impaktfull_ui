// A component inside a scroller has no room outside itself: the viewport
// clips whatever is painted there. These tests prove that the focus ring of
// such a component stays inside the scroller, including with the thick rings
// of the design system presets, so a keyboard user sees the whole ring
// instead of the two sides that survived the clip.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../_core_test_helpers.dart';

/// The rect the ring paints: the border is drawn outside the box of the
/// [ImpaktfullUiFocusFeedback] (`BorderSide.strokeAlignOutside`), so it covers
/// `width` more on every side.
Rect _paintedRing(WidgetTester tester, double width) {
  return tester.getRect(_ringFinder()).inflate(width);
}

/// The box the ring is painted in: the [Container] inside the [IgnorePointer]
/// of the [ImpaktfullUiFocusFeedback], not the one the component itself uses
/// for its background.
Finder _ringFinder() => find
    .descendant(
      of: find.descendant(
        of: find.byType(ImpaktfullUiFocusFeedback),
        matching: find.byType(PositionedDirectional),
      ),
      matching: find.byType(Container),
    )
    .first;

/// [ring] is inside [bounds], edges included: a ring that is flush with the
/// edge is exactly what fits, and `Rect.contains` excludes the bottom and the
/// right edge.
void _expectInside(Rect ring, Rect bounds, String what) {
  const epsilon = 0.01;
  expect(
    ring.left >= bounds.left - epsilon &&
        ring.top >= bounds.top - epsilon &&
        ring.right <= bounds.right + epsilon &&
        ring.bottom <= bounds.bottom + epsilon,
    isTrue,
    reason: 'the ring $ring is painted outside $what $bounds, so the viewport '
        'clips it',
  );
}

ImpaktfullUiTheme _themeWithRing(ImpaktfullUiFocusRingTheme focusRing) {
  final base = ImpaktfullUiTheme.getDefault();
  return base.copyWith(
    components: base.components.copyWith(
      touchFeedback: base.components.touchFeedback.copyWith(
        focusRing: focusRing,
      ),
    ),
  );
}

void main() {
  const rings = {
    'the default ring': ImpaktfullUiFocusRingTheme(),
    // `focus-visible:ring-[3px]` of shadcn/ui.
    'a shadcn/ui ring': ImpaktfullUiFocusRingTheme(width: 3, offset: 0),
    // `outline: 4px solid colorPrimaryBorder; outline-offset: 1px` of Ant.
    'an Ant Design ring': ImpaktfullUiFocusRingTheme(width: 4, offset: 1),
  };

  group('ImpaktfullUiHorizontalTabs', () {
    for (final entry in rings.entries) {
      testWidgets('keeps ${entry.key} inside the strip', (tester) async {
        await pumpImpaktfullUiApp(
          tester,
          Center(
            child: ImpaktfullUiHorizontalTabs<int>(
              value: 0,
              onChanged: (_) {},
              tabs: [
                ImpaktfullUiHorizontalTabConfig(title: 'One', value: 0),
                ImpaktfullUiHorizontalTabConfig(title: 'Two', value: 1),
              ],
            ),
          ),
          theme: _themeWithRing(entry.value),
        );
        await tester.sendKeyEvent(LogicalKeyboardKey.tab);
        await tester.pumpAndSettle();

        final strip =
            tester.getRect(find.byType(ImpaktfullUiHorizontalTabs<int>));
        _expectInside(
          _paintedRing(tester, entry.value.width),
          strip,
          'the strip',
        );
      });
    }

    testWidgets('still draws a ring of the width of the theme', (tester) async {
      await pumpImpaktfullUiApp(
        tester,
        Center(
          child: ImpaktfullUiHorizontalTabs<int>(
            value: 0,
            onChanged: (_) {},
            tabs: [
              ImpaktfullUiHorizontalTabConfig(title: 'One', value: 0),
            ],
          ),
        ),
        theme: _themeWithRing(
          const ImpaktfullUiFocusRingTheme(color: Color(0xFFFF0000), width: 3),
        ),
      );
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pumpAndSettle();

      final container = tester.widget<Container>(_ringFinder());
      final border = (container.decoration! as BoxDecoration).border!.top;
      expect(border.width, 3);
      expect(border.color, const Color(0xFFFF0000));
    });
  });

  group('ImpaktfullUiSidebarNavigationItem', () {
    testWidgets('keeps the ring inside the navigation', (tester) async {
      await pumpImpaktfullUiApp(
        tester,
        SizedBox(
          height: 400,
          child: ImpaktfullUiSidebarNavigation(
            width: 280,
            items: [
              ImpaktfullUiSidebarNavigationItem(title: 'Home', onTap: () {}),
              ImpaktfullUiSidebarNavigationItem(
                  title: 'Settings', onTap: () {}),
            ],
          ),
        ),
        theme: _themeWithRing(
          const ImpaktfullUiFocusRingTheme(width: 4, offset: 1),
        ),
      );
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pumpAndSettle();

      final navigation =
          tester.getRect(find.byType(ImpaktfullUiSidebarNavigation));
      _expectInside(_paintedRing(tester, 4), navigation, 'the navigation');
    });
  });

  group('ImpaktfullUiTableRow', () {
    testWidgets('keeps the ring inside the table', (tester) async {
      await pumpImpaktfullUiApp(
        tester,
        SizedBox(
          height: 200,
          child: ImpaktfullUiTable(
            titles: const [ImpaktfullUiTableHeaderItem(title: 'Name')],
            content: [
              ImpaktfullUiTableRow(
                onTap: () {},
                columns: const [ImpaktfullUiTableRowItem.text(title: 'A')],
              ),
            ],
          ),
        ),
        theme: _themeWithRing(
          const ImpaktfullUiFocusRingTheme(width: 4, offset: 1),
        ),
      );
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pumpAndSettle();

      final table = tester.getRect(find.byType(ImpaktfullUiTable));
      _expectInside(_paintedRing(tester, 4), table, 'the table');
    });
  });
}
