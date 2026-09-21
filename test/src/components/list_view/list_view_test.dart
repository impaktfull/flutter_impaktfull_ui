import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  const placeholderData = ImpaktfullUiListViewPlaceholderData(title: 'Empty');

  group('separated', () {
    testWidgets('draws one custom separator between every item',
        (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiListView<int>.separated(
          items: const [1, 2, 3],
          placeholderData: placeholderData,
          itemBuilder: (context, item, index) => Text('Item $item'),
          separatorBuilder: (context, item, index) =>
              Text('Separator after $item'),
        ),
      );
      expect(find.textContaining('Separator'), findsNWidgets(2));
      expect(find.text('Separator after 1'), findsOneWidget);
      expect(find.text('Separator after 2'), findsOneWidget);
      expect(find.text('Separator after 3'), findsNothing);
    });

    testWidgets('draws one default divider between every item', (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiListView<int>.separated(
          items: const [1, 2, 3],
          placeholderData: placeholderData,
          itemBuilder: (context, item, index) => Text('Item $item'),
        ),
      );
      expect(find.byType(ImpaktfullUiDivider), findsNWidgets(2));
    });

    testWidgets('with itemsPerRow: one separator between every row',
        (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiListView<int>.separated(
          items: const [1, 2, 3, 4, 5],
          itemsPerRow: 2,
          placeholderData: placeholderData,
          itemBuilder: (context, item, index) => Text('Item $item'),
          separatorBuilder: (context, item, index) =>
              Text('Separator after $item ($index)'),
        ),
      );
      for (var item = 1; item <= 5; item++) {
        expect(find.text('Item $item'), findsOneWidget);
      }
      // 3 rows: [1, 2], [3, 4], [5].
      expect(find.textContaining('Separator'), findsNWidgets(2));
      expect(find.text('Separator after 2 (1)'), findsOneWidget);
      expect(find.text('Separator after 4 (3)'), findsOneWidget);
    });
  });

  testWidgets(
      'builder with itemsPerRow: no empty rows, trailing after the last',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiListView<int>.builder(
        items: const [1, 2, 3],
        itemsPerRow: 2,
        placeholderData: placeholderData,
        itemBuilder: (context, item, index) => Text('Item $item'),
        trailingBuilder: (context) => const Text('Trailing'),
      ),
    );
    expect(find.text('Trailing'), findsOneWidget);
    // The trailing widget is right below the last row, not below empty rows.
    final lastItemBottom = tester.getBottomLeft(find.text('Item 3')).dy;
    final trailingTop = tester.getTopLeft(find.text('Trailing')).dy;
    expect(trailingTop - lastItemBottom, lessThan(1));
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is ImpaktfullUiAutoLayout &&
            widget.orientation == ImpaktfullUiAutoLayoutOrientation.horizontal,
      ),
      findsNWidgets(2),
    );
  });
}
