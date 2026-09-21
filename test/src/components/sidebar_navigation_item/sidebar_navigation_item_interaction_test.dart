import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  double subItemsSizeFactor(WidgetTester tester) => tester
      .widget<SizeTransition>(find.ancestor(
        of: find.text('Sub item'),
        matching: find.byType(SizeTransition),
      ))
      .sizeFactor
      .value;

  double chevronTurns(WidgetTester tester) =>
      tester.widget<AnimatedRotation>(find.byType(AnimatedRotation)).turns;

  Widget group({VoidCallback? onTap, VoidCallback? onSubItemTap}) =>
      ImpaktfullUiSidebarNavigationItem(
        title: 'Group',
        onTap: onTap,
        items: [
          ImpaktfullUiSidebarNavigationItem(
            title: 'Sub item',
            onTap: onSubItemTap ?? () {},
          ),
        ],
      );

  testWidgets('tapping the title expands and collapses a group',
      (tester) async {
    var taps = 0;
    await pumpAndSettleComponent(tester, group(onTap: () => taps++));
    expect(subItemsSizeFactor(tester), 0);
    expect(chevronTurns(tester), 0);

    await tester.tap(find.text('Group'));
    await tester.pumpAndSettle();
    expect(subItemsSizeFactor(tester), 1);
    expect(chevronTurns(tester), -0.5);
    expect(taps, 1);

    await tester.tap(find.text('Group'));
    await tester.pumpAndSettle();
    expect(subItemsSizeFactor(tester), 0);
    expect(chevronTurns(tester), 0);
    expect(taps, 2);
  });

  testWidgets('tapping the chevron expands and collapses a group',
      (tester) async {
    var taps = 0;
    await pumpAndSettleComponent(tester, group(onTap: () => taps++));
    await tester.tap(find.byType(ImpaktfullUiIconButton));
    await tester.pumpAndSettle();
    expect(subItemsSizeFactor(tester), 1);

    await tester.tap(find.byType(ImpaktfullUiIconButton));
    await tester.pumpAndSettle();
    expect(subItemsSizeFactor(tester), 0);
    // The chevron does not call onTap.
    expect(taps, 0);
  });

  testWidgets('tapping a sub item calls its onTap', (tester) async {
    var subTaps = 0;
    await pumpAndSettleComponent(
      tester,
      group(onSubItemTap: () => subTaps++),
    );
    await tester.tap(find.text('Group'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Sub item'));
    await tester.pumpAndSettle();
    expect(subTaps, 1);
    // The group stays open.
    expect(subItemsSizeFactor(tester), 1);
  });

  testWidgets('a leaf has no chevron', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiSidebarNavigationItem(title: 'Leaf', onTap: () {}),
    );
    expect(find.byType(AnimatedRotation), findsNothing);
    expect(find.byType(SizeTransition), findsNothing);
  });

  testWidgets('a nested selected item expands every parent', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiSidebarNavigationItem(
        title: 'Group',
        items: [
          ImpaktfullUiSidebarNavigationItem(
            title: 'Nested group',
            items: [
              ImpaktfullUiSidebarNavigationItem(
                title: 'Sub item',
                isSelected: true,
              ),
            ],
          ),
        ],
      ),
    );
    final factors = tester
        .widgetList<SizeTransition>(find.byType(SizeTransition))
        .map((transition) => transition.sizeFactor.value)
        .toList();
    expect(factors, [1, 1]);
    expect(find.text('Sub item').hitTestable(), findsOneWidget);
  });

  testWidgets('selected uses the theme background', (tester) async {
    await pumpLayoutApp(
      tester,
      Column(
        children: [
          ImpaktfullUiSidebarNavigationItem(
            title: 'Selected',
            isSelected: true,
            onTap: () {},
          ),
          ImpaktfullUiSidebarNavigationItem(
            title: 'Unselected',
            onTap: () {},
          ),
        ],
      ),
    );
    final theme = ImpaktfullUiSidebarNavigationItemTheme.of(
      tester.element(find.byType(ImpaktfullUiSidebarNavigationItem).first),
    );
    Color? color(String title) => tester
        .widget<ImpaktfullUiTouchFeedback>(find.ancestor(
          of: find.text(title),
          matching: find.byType(ImpaktfullUiTouchFeedback),
        ))
        .color;
    expect(color('Selected'), theme.colors.background);
    expect(color('Unselected'), isNull);
  });
}
