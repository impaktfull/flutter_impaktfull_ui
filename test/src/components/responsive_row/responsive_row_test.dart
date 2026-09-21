import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/screen_size_util.dart';
import '../../../util/test_util.dart';

void main() {
  /// The amount of children per row.
  List<int> rows(WidgetTester tester) => tester
      .widgetList<ImpaktfullUiAutoLayout>(find.descendant(
        of: find.byType(ImpaktfullUiResponsiveRow),
        matching: find.byType(ImpaktfullUiAutoLayout),
      ))
      .where((layout) =>
          layout.orientation == ImpaktfullUiAutoLayoutOrientation.horizontal)
      // The empty cells (Spacer) that fill the last row are not counted.
      .map((row) => row.children.whereType<Expanded>().length)
      .toList();

  const cases = <int, List<int>>{
    0: [],
    1: [1],
    2: [2],
    3: [2, 1],
    4: [2, 2],
    6: [2, 2, 2],
  };

  for (final entry in cases.entries) {
    testWidgets('${entry.key} children in 2 columns', (tester) async {
      setScreenSize(tester, const Size(400, 800));
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiResponsiveRow(
          maxColumns: 2,
          verticalSpacing: 8,
          children: [
            for (var i = 0; i < entry.key; i++) Text('$i'),
          ],
        ),
      );
      expect(rows(tester), entry.value);
    });
  }
}
