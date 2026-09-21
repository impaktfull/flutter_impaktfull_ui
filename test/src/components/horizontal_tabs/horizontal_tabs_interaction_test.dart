import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  final tabs = [
    for (var i = 0; i < 3; i++)
      ImpaktfullUiHorizontalTabConfig(label: 'Tab $i', value: i),
  ];

  List<bool> selection(WidgetTester tester) => tester
      .widgetList<ImpaktfullUiHorizontalTab>(
          find.byType(ImpaktfullUiHorizontalTab))
      .map((tab) => tab.isSelected)
      .toList();

  testWidgets('onTabSelected changes the selected tab', (tester) async {
    var selected = 0;
    final selections = <int>[];
    await pumpAndSettleComponent(
      tester,
      StatefulBuilder(
        builder: (context, setState) => ImpaktfullUiHorizontalTabs<int>(
          selectedValue: selected,
          onTabSelected: (value) {
            selections.add(value);
            setState(() => selected = value);
          },
          tabs: tabs,
        ),
      ),
    );
    expect(selection(tester), [true, false, false]);

    await tester.tap(find.text('Tab 2'));
    await tester.pumpAndSettle();
    expect(selections, [2]);
    expect(selection(tester), [false, false, true]);

    await tester.tap(find.text('Tab 0'));
    await tester.pumpAndSettle();
    expect(selections, [2, 0]);
    expect(selection(tester), [true, false, false]);
  });

  testWidgets('tapping the selected tab does not call onTabSelected',
      (tester) async {
    final selections = <int>[];
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiHorizontalTabs<int>(
        selectedValue: 1,
        onTabSelected: selections.add,
        tabs: tabs,
      ),
    );
    await tester.tap(find.text('Tab 1'));
    await tester.pumpAndSettle();
    expect(selections, isEmpty);
  });

  testWidgets('passes the badge config to the tabs', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiHorizontalTabs<String>(
        selectedValue: 'a',
        onTabSelected: (_) {},
        tabs: [
          ImpaktfullUiHorizontalTabConfig(
            label: 'A',
            value: 'a',
          ),
          ImpaktfullUiHorizontalTabConfig(
            label: 'B',
            value: 'b',
            badge: '3',
            badgeType: ImpaktfullUiBadgeType.warning,
          ),
        ],
      ),
    );
    final tab = tester.widget<ImpaktfullUiHorizontalTab>(
      find.widgetWithText(ImpaktfullUiHorizontalTab, 'B'),
    );
    expect(tab.badge, '3');
    expect(tab.badgeType, ImpaktfullUiBadgeType.warning);
    expect(tab.isSelected, isFalse);
  });

  testWidgets('scrolls horizontally when the tabs do not fit', (tester) async {
    final selections = <int>[];
    await pumpAndSettleComponent(
      tester,
      Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: 150,
          child: ImpaktfullUiHorizontalTabs<int>(
            selectedValue: 0,
            onTabSelected: selections.add,
            tabs: [
              for (var i = 0; i < 10; i++)
                ImpaktfullUiHorizontalTabConfig(label: 'Tab $i', value: i),
            ],
          ),
        ),
      ),
    );
    expect(
      tester.getSize(find.byType(ImpaktfullUiHorizontalTabs<int>)).height,
      48,
    );
    final lastTab = find.text('Tab 9');
    await tester.scrollUntilVisible(
      lastTab,
      100,
      scrollable: find.byType(Scrollable),
    );
    await tester.tap(lastTab);
    await tester.pumpAndSettle();
    expect(selections, [9]);
  });
}
