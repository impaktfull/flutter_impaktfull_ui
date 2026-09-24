import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../_core_test_helpers.dart';

/// Proves that [ImpaktfullUiHorizontalTabsColorTheme.background] changes what
/// is rendered. The class had no fields at all.

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

/// The colored box around the row of tabs. The tabs themselves hold one too
/// (the transparent box of their touch feedback), so this only looks at the
/// boxes above the list.
Finder _background() => find.ancestor(
      of: find.byType(ListView),
      matching: find.descendant(
        of: find.byType(ImpaktfullUiHorizontalTabs<int>),
        matching: find.byType(ColoredBox),
      ),
    );

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
      expect(
        tester.widget<ColoredBox>(_background().first).color,
        const Color(0xFFF5F5F5),
      );
    });
  });
}
