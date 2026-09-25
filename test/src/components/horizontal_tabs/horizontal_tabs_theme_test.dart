import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../_core_test_helpers.dart';

/// Proves that [ImpaktfullUiHorizontalTabsColorTheme.background] changes what
/// is rendered. The class had no fields at all.
///
/// [ImpaktfullUiHorizontalTabsDimensTheme.margin] and `borderRadius` make that
/// background a track instead of a bar from edge to edge.

ImpaktfullUiHorizontalTabsTheme get _base =>
    ImpaktfullUiTheme.getDefault().components.horizontalTabs;

Future<void> _pumpTabs(
  WidgetTester tester, {
  ImpaktfullUiHorizontalTabsTheme? theme,
}) =>
    pumpImpaktfullUiApp(
      tester,
      Material(
        child: SizedBox(
          width: 400,
          child: ImpaktfullUiHorizontalTabs<int>(
            value: 1,
            onChanged: (_) {},
            tabs: [
              ImpaktfullUiHorizontalTabConfig(title: 'One', value: 1),
              ImpaktfullUiHorizontalTabConfig(title: 'Two', value: 2),
            ],
            theme: theme,
          ),
        ),
      ),
    );

/// The decorated box around the row of tabs. The tabs themselves hold one too
/// (the transparent box of their touch feedback), so this only looks at the
/// boxes above the list.
Finder _background() => find.ancestor(
      of: find.byType(ListView),
      matching: find.descendant(
        of: find.byType(ImpaktfullUiHorizontalTabs<int>),
        matching: find.byType(DecoratedBox),
      ),
    );

BoxDecoration _backgroundDecoration(WidgetTester tester) =>
    tester.widget<DecoratedBox>(_background().first).decoration
        as BoxDecoration;

void main() {
  group('ImpaktfullUiHorizontalTabsColorTheme', () {
    testWidgets('a row of tabs without a background paints none',
        (tester) async {
      await _pumpTabs(tester);
      expect(_background(), findsNothing);
    });

    testWidgets('background is the background behind the tabs', (tester) async {
      final base = _base;
      await _pumpTabs(
        tester,
        theme: base.copyWith(
          colors: base.colors.copyWith(background: const Color(0xFFF5F5F5)),
        ),
      );
      expect(_backgroundDecoration(tester).color, const Color(0xFFF5F5F5));
    });
  });

  group('ImpaktfullUiHorizontalTabsDimensTheme', () {
    testWidgets('margin is space around the background, padding inside it',
        (tester) async {
      final base = _base;
      final theme = base.copyWith(
        colors: base.colors.copyWith(background: const Color(0xFFF5F5F5)),
        dimens: base.dimens.copyWith(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(3),
        ),
      );
      await _pumpTabs(tester, theme: theme);

      final row = tester.getRect(find.byType(ImpaktfullUiHorizontalTabs<int>));
      final background = tester.getRect(_background().first);
      expect(background.left, row.left + 16);
      expect(background.right, row.right - 16);
      expect(
        tester.getRect(find.byType(ListView)).left,
        background.left,
        reason: 'the padding is inside the list, not around the background',
      );
    });

    testWidgets('without a margin the background runs from edge to edge',
        (tester) async {
      final base = _base;
      await _pumpTabs(
        tester,
        theme: base.copyWith(
          colors: base.colors.copyWith(background: const Color(0xFFF5F5F5)),
        ),
      );
      expect(
        tester.getRect(_background().first),
        tester.getRect(find.byType(ImpaktfullUiHorizontalTabs<int>)),
      );
    });

    testWidgets('borderRadius rounds the background', (tester) async {
      final base = _base;
      await _pumpTabs(
        tester,
        theme: base.copyWith(
          colors: base.colors.copyWith(background: const Color(0xFFF5F5F5)),
          dimens: base.dimens.copyWith(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
      expect(
        _backgroundDecoration(tester).borderRadius,
        BorderRadius.circular(10),
      );
    });
  });
}
