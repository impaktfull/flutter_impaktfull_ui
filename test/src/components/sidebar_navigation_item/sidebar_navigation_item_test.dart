import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  testWidgets('tapping a leaf outside an ImpaktfullUiScreen does not crash',
      (tester) async {
    var taps = 0;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiSidebarNavigationItem(
        title: 'Leaf',
        onTap: () => taps++,
      ),
    );
    await tester.tap(find.text('Leaf'));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(taps, 1);
  });

  testWidgets('tapping a leaf closes the drawer of the ImpaktfullUiScreen',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiScreen(
        isDrawerEnabled: true,
        drawer: Builder(
          builder: (context) => ImpaktfullUiSidebarNavigationItem(
            title: 'Leaf',
            onTap: () {},
          ),
        ),
        child: Builder(
          builder: (context) => TextButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            child: const Text('open'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    expect(find.text('Leaf'), findsOneWidget);

    await tester.tap(find.text('Leaf'));
    await tester.pumpAndSettle();
    expect(find.text('Leaf'), findsNothing);
  });

  Widget group({required bool subItemSelected}) =>
      ImpaktfullUiSidebarNavigationItem(
        title: 'Group',
        items: [
          ImpaktfullUiSidebarNavigationItem(
            title: 'Sub item',
            isSelected: subItemSelected,
            onTap: () {},
          ),
        ],
      );

  double subItemsSizeFactor(WidgetTester tester) => tester
      .widget<SizeTransition>(find.ancestor(
        of: find.text('Sub item'),
        matching: find.byType(SizeTransition),
      ))
      .sizeFactor
      .value;

  testWidgets('expands when a sub item becomes selected', (tester) async {
    var selected = false;
    late StateSetter setState;
    await pumpAndSettleComponent(
      tester,
      StatefulBuilder(builder: (context, setter) {
        setState = setter;
        return group(subItemSelected: selected);
      }),
    );
    expect(subItemsSizeFactor(tester), 0);

    setState(() => selected = true);
    await tester.pumpAndSettle();
    expect(subItemsSizeFactor(tester), 1);
  });

  testWidgets('starts expanded when a sub item is selected', (tester) async {
    await pumpAndSettleComponent(tester, group(subItemSelected: true));
    expect(subItemsSizeFactor(tester), 1);
  });

  testWidgets('keeps a collapsed group collapsed while the selection stays',
      (tester) async {
    var title = 'a';
    late StateSetter setState;
    await pumpAndSettleComponent(
      tester,
      StatefulBuilder(builder: (context, setter) {
        setState = setter;
        return ImpaktfullUiAutoLayout.vertical(
          children: [
            Text(title),
            group(subItemSelected: true),
          ],
        );
      }),
    );
    // The user collapses the group.
    await tester.tap(find.text('Group'));
    await tester.pumpAndSettle();
    expect(subItemsSizeFactor(tester), 0);

    setState(() => title = 'b');
    await tester.pumpAndSettle();
    expect(subItemsSizeFactor(tester), 0);
  });
}
