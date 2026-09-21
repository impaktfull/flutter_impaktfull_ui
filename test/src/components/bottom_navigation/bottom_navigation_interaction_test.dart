import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  testWidgets('selecting an item updates the selection', (tester) async {
    var selected = 0;
    final selections = <int>[];
    await pumpAndSettleComponent(
      tester,
      StatefulBuilder(
        builder: (context, setState) => Align(
          alignment: Alignment.bottomCenter,
          child: ImpaktfullUiBottomNavigation(
            items: [
              for (var i = 0; i < 3; i++)
                ImpaktfullUiBottomNavigationItem(
                  asset: testAsset,
                  label: 'Item $i',
                  isSelected: i == selected,
                  onTap: () {
                    selections.add(i);
                    setState(() => selected = i);
                  },
                ),
            ],
          ),
        ),
      ),
    );
    List<bool> selectedStates() => tester
        .widgetList<ImpaktfullUiBottomNavigationItem>(
            find.byType(ImpaktfullUiBottomNavigationItem))
        .map((item) => item.isSelected)
        .toList();
    expect(selectedStates(), [true, false, false]);

    await tester.tap(find.text('Item 2'));
    await tester.pumpAndSettle();
    expect(selections, [2]);
    expect(selectedStates(), [false, false, true]);

    await tester.tap(find.text('Item 1'));
    await tester.pumpAndSettle();
    expect(selections, [2, 1]);
    expect(selectedStates(), [false, true, false]);
  });

  testWidgets('items share the width equally', (tester) async {
    await pumpLayoutApp(
      tester,
      Align(
        alignment: Alignment.bottomCenter,
        child: ImpaktfullUiBottomNavigation(
          items: [
            for (var i = 0; i < 4; i++)
              ImpaktfullUiBottomNavigationItem(
                asset: testAsset,
                label: i == 0 ? 'A much longer label' : 'Item',
                isSelected: false,
              ),
          ],
        ),
      ),
    );
    final widths = tester
        .widgetList(find.byType(ImpaktfullUiBottomNavigationItem))
        .map((item) => tester.getSize(find.byWidget(item)).width)
        .toSet();
    expect(widths, {smallScreenSize.width / 4});
  });

  testWidgets('removeTop false adds the top safe area', (tester) async {
    Future<double> height({required bool removeTop}) async {
      await pumpLayoutApp(
        tester,
        Align(
          alignment: Alignment.bottomCenter,
          child: MediaQuery(
            data: const MediaQueryData(
              size: smallScreenSize,
              padding: EdgeInsets.only(top: 30, bottom: 20),
            ),
            child: ImpaktfullUiBottomNavigation(
              removeTop: removeTop,
              items: const [
                ImpaktfullUiBottomNavigationItem(
                  asset: testAsset,
                  isSelected: true,
                ),
              ],
            ),
          ),
        ),
      );
      return tester.getSize(find.byType(ImpaktfullUiBottomNavigation)).height;
    }

    final withoutTop = await height(removeTop: true);
    final withTop = await height(removeTop: false);
    expect(withTop - withoutTop, 30);
  });
}
