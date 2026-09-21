import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../_layout_test_helpers.dart';

void main() {
  Future<TabController> pumpTabBar(WidgetTester tester) async {
    final controller = TabController(length: 3, vsync: const TestVSync());
    addTearDown(controller.dispose);
    await pumpLayoutApp(
      tester,
      Align(
        alignment: Alignment.topCenter,
        child: ImpaktfullUiTabBar(
          controller: controller,
          items: [
            for (var i = 0; i < 3; i++)
              ImpaktfullUiTabBarItem(
                label: 'Tab $i',
                index: i,
                controller: controller,
              ),
          ],
        ),
      ),
    );
    return controller;
  }

  /// The opacity of the selected marker of every tab.
  List<double> markers(WidgetTester tester) => tester
      .widgetList<AnimatedOpacity>(find.byType(AnimatedOpacity))
      .map((opacity) => opacity.opacity)
      .toList();

  testWidgets('tapping a tab selects it', (tester) async {
    final controller = await pumpTabBar(tester);
    expect(markers(tester), [1, 0, 0]);

    await tester.tap(find.text('Tab 2'));
    await tester.pumpAndSettle();
    expect(controller.index, 2);
    expect(markers(tester), [0, 0, 1]);

    await tester.tap(find.text('Tab 1'));
    await tester.pumpAndSettle();
    expect(controller.index, 1);
    expect(markers(tester), [0, 1, 0]);
  });

  testWidgets('follows the controller', (tester) async {
    final controller = await pumpTabBar(tester);
    controller.animateTo(2);
    await tester.pumpAndSettle();
    expect(markers(tester), [0, 0, 1]);
  });

  testWidgets('the tabs share the width equally', (tester) async {
    await pumpTabBar(tester);
    final widths = tester
        .widgetList(find.byType(ImpaktfullUiTabBarItem))
        .map((item) => tester.getSize(find.byWidget(item)).width)
        .toSet();
    expect(widths, {smallScreenSize.width / 3});
  });
}
