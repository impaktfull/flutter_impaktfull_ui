import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../_data_display_test_helpers.dart';

void main() {
  const interval = Duration(seconds: 1);
  final carouselTheme = ImpaktfullUiTheme.getDefault().components.carousel;
  List<Widget> pages(int count) => [
        for (var i = 0; i < count; i++) Center(child: Text('Page $i')),
      ];

  Future<void> pumpCarousel(WidgetTester tester, Widget carousel) =>
      pumpSized(tester, carousel, size: const Size(400, 300));

  /// Stops the autoplay timer.
  Future<void> dispose(WidgetTester tester) =>
      tester.pumpWidget(const SizedBox());

  /// The index of the active indicator.
  int activeIndicator(WidgetTester tester) {
    final indicators = tester
        .widgetList<Container>(find.descendant(
          of: find.byType(Row),
          matching: find.byType(Container),
        ))
        .toList();
    return indicators.indexWhere(
      (container) =>
          (container.decoration as BoxDecoration).color ==
          carouselTheme.colors.activeIndicator,
    );
  }

  testWidgets('swiping goes to the next and previous page', (tester) async {
    final changes = <int>[];
    await pumpCarousel(
      tester,
      ImpaktfullUiCarousel(items: pages(3), onItemChanged: changes.add),
    );
    expect(find.text('Page 0'), findsOneWidget);
    expect(activeIndicator(tester), 0);

    await tester.fling(find.byType(PageView), const Offset(-300, 0), 1000);
    await tester.pumpAndSettle();
    expect(find.text('Page 1'), findsOneWidget);
    expect(activeIndicator(tester), 1);

    await tester.fling(find.byType(PageView), const Offset(-300, 0), 1000);
    await tester.pumpAndSettle();
    await tester.fling(find.byType(PageView), const Offset(300, 0), 1000);
    await tester.pumpAndSettle();
    expect(changes, [1, 2, 1]);
    expect(activeIndicator(tester), 1);
  });

  testWidgets('a new index of the parent animates to that page',
      (tester) async {
    var index = 0;
    late StateSetter setState;
    final changes = <int>[];
    await pumpCarousel(
      tester,
      StatefulBuilder(
        builder: (context, setter) {
          setState = setter;
          return ImpaktfullUiCarousel(
            items: pages(4),
            index: index,
            onItemChanged: changes.add,
          );
        },
      ),
    );
    setState(() => index = 3);
    await tester.pumpAndSettle();
    expect(find.text('Page 3'), findsOneWidget);
    expect(changes.last, 3);
    expect(activeIndicator(tester), 3);
  });

  testWidgets('autoplay goes to the next page every interval', (tester) async {
    final changes = <int>[];
    await pumpCarousel(
      tester,
      ImpaktfullUiCarousel(
        items: pages(3),
        autoplay: true,
        autoplayInterval: interval,
        onItemChanged: changes.add,
      ),
    );
    await tester.pump(interval ~/ 2);
    expect(changes, isEmpty);

    await tester.pump(interval ~/ 2);
    await tester.pumpAndSettle();
    expect(changes, [1]);

    await tester.pump(interval);
    await tester.pumpAndSettle();
    expect(changes, [1, 2]);
    expect(find.text('Page 2'), findsOneWidget);
    await dispose(tester);
  });

  testWidgets('autoplay without loop goes back and forth', (tester) async {
    final changes = <int>[];
    await pumpCarousel(
      tester,
      ImpaktfullUiCarousel(
        items: pages(3),
        autoplay: true,
        loop: false,
        autoplayInterval: interval,
        onItemChanged: changes.add,
      ),
    );
    for (var i = 0; i < 5; i++) {
      await tester.pump(interval);
      await tester.pumpAndSettle();
    }
    expect(changes, [1, 2, 1, 0, 1]);
    await dispose(tester);
  });

  testWidgets('without autoplay the page does not change', (tester) async {
    final changes = <int>[];
    await pumpCarousel(
      tester,
      ImpaktfullUiCarousel(
        items: pages(3),
        autoplayInterval: interval,
        onItemChanged: changes.add,
      ),
    );
    await tester.pump(interval * 5);
    await tester.pumpAndSettle();
    expect(changes, isEmpty);
  });

  testWidgets('autoplay can be turned on and off by the parent',
      (tester) async {
    var autoplay = false;
    late StateSetter setState;
    final changes = <int>[];
    await pumpCarousel(
      tester,
      StatefulBuilder(
        builder: (context, setter) {
          setState = setter;
          return ImpaktfullUiCarousel(
            items: pages(3),
            autoplay: autoplay,
            autoplayInterval: interval,
            onItemChanged: changes.add,
          );
        },
      ),
    );
    await tester.pump(interval);
    expect(changes, isEmpty);

    setState(() => autoplay = true);
    await tester.pump();
    await tester.pump(interval);
    await tester.pumpAndSettle();
    expect(changes, [1]);

    setState(() => autoplay = false);
    await tester.pump();
    await tester.pump(interval * 3);
    await tester.pumpAndSettle();
    expect(changes, [1]);
  });

  testWidgets('a new autoplay interval of the parent is used', (tester) async {
    var autoplayInterval = interval;
    late StateSetter setState;
    final changes = <int>[];
    await pumpCarousel(
      tester,
      StatefulBuilder(
        builder: (context, setter) {
          setState = setter;
          return ImpaktfullUiCarousel(
            items: pages(3),
            autoplay: true,
            autoplayInterval: autoplayInterval,
            onItemChanged: changes.add,
          );
        },
      ),
    );
    setState(() => autoplayInterval = interval * 3);
    await tester.pump();
    await tester.pump(interval * 2);
    await tester.pumpAndSettle();
    expect(changes, isEmpty);
    await tester.pump(interval);
    await tester.pumpAndSettle();
    expect(changes, [1]);
    await dispose(tester);
  });

  testWidgets('a single item has no indicator and autoplay does nothing',
      (tester) async {
    final changes = <int>[];
    await pumpCarousel(
      tester,
      ImpaktfullUiCarousel(
        items: pages(1),
        autoplay: true,
        autoplayInterval: interval,
        onItemChanged: changes.add,
      ),
    );
    expect(find.byType(Row), findsNothing);
    await tester.pump(interval * 3);
    await tester.pumpAndSettle();
    expect(changes, isEmpty);
    expect(tester.takeException(), isNull);
    await dispose(tester);
  });

  testWidgets('itemMargin is added around every item', (tester) async {
    const margin = EdgeInsets.all(13);
    await pumpCarousel(
      tester,
      ImpaktfullUiCarousel(items: pages(2), itemMargin: margin),
    );
    expect(
      find.byWidgetPredicate(
        (widget) => widget is Padding && widget.padding == margin,
      ),
      findsOneWidget,
    );
  });
}
