import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  double marker(WidgetTester tester) =>
      tester.widget<AnimatedOpacity>(find.byType(AnimatedOpacity)).opacity;

  Future<TabController> pumpItem(WidgetTester tester, {int index = 1}) async {
    final controller = TabController(length: 2, vsync: const TestVSync());
    addTearDown(controller.dispose);
    await pumpAndSettleComponent(
      tester,
      Center(
        child: ImpaktfullUiTabBarItem(
          title: 'Tab',
          index: index,
          controller: controller,
        ),
      ),
    );
    return controller;
  }

  testWidgets('tapping animates the controller to its index', (tester) async {
    final controller = await pumpItem(tester);
    expect(controller.index, 0);
    expect(marker(tester), 0);

    await tester.tap(find.text('Tab'));
    await tester.pumpAndSettle();
    expect(controller.index, 1);
    expect(marker(tester), 1);
  });

  testWidgets('tapping the selected item keeps it selected', (tester) async {
    final controller = await pumpItem(tester, index: 0);
    expect(marker(tester), 1);
    await tester.tap(find.text('Tab'));
    await tester.pumpAndSettle();
    expect(controller.index, 0);
    expect(marker(tester), 1);
  });

  testWidgets('the marker hides when another tab is selected', (tester) async {
    final controller = await pumpItem(tester, index: 0);
    controller.index = 1;
    await tester.pumpAndSettle();
    expect(marker(tester), 0);
  });
}
