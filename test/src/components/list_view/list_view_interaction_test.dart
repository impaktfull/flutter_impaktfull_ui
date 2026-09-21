import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../_data_display_test_helpers.dart';

void main() {
  const placeholderData = ImpaktfullUiListViewPlaceholderData(title: 'Empty');

  Widget itemBuilder(BuildContext context, int item, int index) =>
      SizedBox(height: 40, child: Text('Item $item at $index'));

  group('builder', () {
    testWidgets('builds every item with its index', (tester) async {
      await pumpSized(
        tester,
        ImpaktfullUiListView<int>.builder(
          items: const [10, 20, 30],
          itemBuilder: itemBuilder,
          placeholderData: placeholderData,
        ),
      );
      expect(find.text('Item 10 at 0'), findsOneWidget);
      expect(find.text('Item 20 at 1'), findsOneWidget);
      expect(find.text('Item 30 at 2'), findsOneWidget);
    });

    testWidgets('only builds the visible items', (tester) async {
      final built = <int>{};
      await pumpSized(
        tester,
        ImpaktfullUiListView<int>.builder(
          items: [for (var i = 0; i < 1000; i++) i],
          itemBuilder: (context, item, index) {
            built.add(index);
            return SizedBox(height: 40, child: Text('Item $item'));
          },
          placeholderData: placeholderData,
        ),
      );
      expect(built.length, lessThan(50));
      await tester.drag(find.byType(ListView), const Offset(0, -2000));
      await tester.pumpAndSettle();
      expect(find.text('Item 0'), findsNothing);
      expect(built.length, lessThan(150));
    });

    testWidgets('leading and trailing are shown once, around the items',
        (tester) async {
      await pumpSized(
        tester,
        ImpaktfullUiListView<int>.builder(
          items: const [1, 2],
          itemBuilder: itemBuilder,
          leadingBuilder: (context) => const Text('Leading'),
          trailingBuilder: (context) => const Text('Trailing'),
          placeholderData: placeholderData,
        ),
      );
      expect(find.text('Leading'), findsOneWidget);
      expect(find.text('Trailing'), findsOneWidget);
      final leading = tester.getTopLeft(find.text('Leading')).dy;
      final first = tester.getTopLeft(find.text('Item 1 at 0')).dy;
      final last = tester.getTopLeft(find.text('Item 2 at 1')).dy;
      final trailing = tester.getTopLeft(find.text('Trailing')).dy;
      expect(leading, lessThan(first));
      expect(last, lessThan(trailing));
    });

    testWidgets('spacing is added between the items', (tester) async {
      await pumpSized(
        tester,
        ImpaktfullUiListView<int>.builder(
          items: const [1, 2],
          spacing: 12,
          itemBuilder: itemBuilder,
          placeholderData: placeholderData,
        ),
      );
      final firstBottom = tester.getBottomLeft(find.text('Item 1 at 0')).dy;
      final secondTop = tester.getTopLeft(find.text('Item 2 at 1')).dy;
      expect(secondTop - firstBottom, 12);
    });

    testWidgets(
      'horizontal: spacing is added between the items',
      (tester) async {
        await pumpSized(
          tester,
          ImpaktfullUiListView<int>.builder(
            items: const [1, 2],
            spacing: 12,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, item, index) =>
                SizedBox(width: 40, child: Text('$item')),
            placeholderData: placeholderData,
          ),
          size: const Size(400, 100),
        );
        final firstRight = tester.getTopRight(find.text('1')).dx;
        final secondLeft = tester.getTopLeft(find.text('2')).dx;
        expect(secondLeft - firstRight, 12);
      },
    );

    testWidgets('uses the controller that is passed', (tester) async {
      final controller = ScrollController();
      addTearDown(controller.dispose);
      await pumpSized(
        tester,
        ImpaktfullUiListView<int>.builder(
          items: [for (var i = 0; i < 100; i++) i],
          controller: controller,
          itemBuilder: itemBuilder,
          placeholderData: placeholderData,
        ),
      );
      controller.jumpTo(400);
      await tester.pump();
      expect(find.text('Item 10 at 10'), findsOneWidget);
      expect(find.text('Item 0 at 0'), findsNothing);
    });
  });

  group('separated', () {
    testWidgets('the separator builder gets the item and index before it',
        (tester) async {
      final separators = <String>[];
      await pumpSized(
        tester,
        ImpaktfullUiListView<String>.separated(
          items: const ['a', 'b', 'c'],
          itemBuilder: (context, item, index) => Text(item),
          separatorBuilder: (context, item, index) {
            separators.add('$item$index');
            return const SizedBox(height: 1);
          },
          placeholderData: placeholderData,
        ),
      );
      expect(separators, ['a0', 'b1']);
    });
  });

  group('children', () {
    testWidgets('shows every child with leading and trailing', (tester) async {
      await pumpSized(
        tester,
        ImpaktfullUiListView(
          leadingBuilder: (context) => const Text('Leading'),
          trailingBuilder: (context) => const Text('Trailing'),
          children: const [Text('A'), Text('B')],
        ),
      );
      for (final text in ['Leading', 'A', 'B', 'Trailing']) {
        expect(find.text(text), findsOneWidget);
      }
    });

    testWidgets('child constructor shows the child', (tester) async {
      await pumpSized(
        tester,
        const ImpaktfullUiListView.child(child: Text('Child')),
      );
      expect(find.text('Child'), findsOneWidget);
    });
  });

  group('states', () {
    testWidgets('loading shows a loading indicator instead of the items',
        (tester) async {
      await pumpSized(
        tester,
        ImpaktfullUiListView<int>.builder(
          items: const [1],
          isLoading: true,
          itemBuilder: itemBuilder,
          placeholderData: placeholderData,
        ),
        settle: false,
      );
      expect(find.byType(ImpaktfullUiLoadingIndicator), findsOneWidget);
      expect(find.text('Item 1 at 0'), findsNothing);
    });

    testWidgets('loading with shrinkWrap has a fixed size', (tester) async {
      await pumpSized(
        tester,
        Align(
          alignment: Alignment.topLeft,
          child: ImpaktfullUiListView<int>.builder(
            items: const [1],
            isLoading: true,
            shrinkWrap: true,
            itemBuilder: itemBuilder,
            placeholderData: placeholderData,
          ),
        ),
        settle: false,
      );
      expect(
        tester.getSize(find.byType(ImpaktfullUiLoadingIndicator)),
        const Size(50, 50),
      );
    });

    testWidgets('empty shows the placeholder without a refresh button',
        (tester) async {
      await pumpSized(
        tester,
        ImpaktfullUiListView<int>.builder(
          items: const [],
          itemBuilder: itemBuilder,
          placeholderData: const ImpaktfullUiListViewPlaceholderData(
            title: 'Empty',
            subtitle: 'Nothing here',
          ),
        ),
      );
      expect(find.byType(ImpaktfullUiPlaceholder), findsOneWidget);
      expect(find.text('Empty'), findsOneWidget);
      expect(find.text('Nothing here'), findsOneWidget);
      expect(find.byType(ImpaktfullUiButton), findsNothing);
    });

    testWidgets('empty with onRefresh: the refresh button refreshes',
        (tester) async {
      var refreshes = 0;
      await pumpSized(
        tester,
        ImpaktfullUiListView<int>.builder(
          items: const [],
          itemBuilder: itemBuilder,
          onRefresh: () async => refreshes++,
          placeholderData: placeholderData,
        ),
      );
      await tester.tap(find.text('Refresh'));
      await tester.pumpAndSettle();
      expect(refreshes, 1);
    });

    testWidgets('empty: showRefreshBtn false hides the refresh button',
        (tester) async {
      await pumpSized(
        tester,
        ImpaktfullUiListView<int>.builder(
          items: const [],
          itemBuilder: itemBuilder,
          onRefresh: () async {},
          placeholderData: const ImpaktfullUiListViewPlaceholderData(
            title: 'Empty',
            showRefreshBtn: false,
          ),
        ),
      );
      expect(find.text('Refresh'), findsNothing);
    });

    testWidgets(
      'empty: showAsset false hides the asset',
      (tester) async {
        await pumpSized(
          tester,
          ImpaktfullUiListView<int>.builder(
            items: const [],
            itemBuilder: itemBuilder,
            placeholderData: ImpaktfullUiListViewPlaceholderData(
              title: 'Empty',
              asset: testIcon,
              showAsset: false,
            ),
          ),
        );
        expect(findAsset(testIcon), findsNothing);
      },
    );

    testWidgets(
      'empty: a placeholder taller than the list does not overflow',
      (tester) async {
        await pumpSized(
          tester,
          ImpaktfullUiListView<int>.builder(
            items: const [],
            itemBuilder: itemBuilder,
            placeholderData: const ImpaktfullUiListViewPlaceholderData(
              title: longText,
              subtitle: longText,
            ),
          ),
          size: const Size(200, 150),
        );
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets('empty shows the new items passed by the parent',
        (tester) async {
      var items = <int>[];
      late StateSetter setState;
      await pumpSized(
        tester,
        StatefulBuilder(
          builder: (context, setter) {
            setState = setter;
            return ImpaktfullUiListView<int>.builder(
              items: items,
              itemBuilder: itemBuilder,
              placeholderData: placeholderData,
            );
          },
        ),
      );
      expect(find.text('Empty'), findsOneWidget);
      setState(() => items = [1]);
      await tester.pumpAndSettle();
      expect(find.text('Empty'), findsNothing);
      expect(find.text('Item 1 at 0'), findsOneWidget);
    });
  });

  group('refresh', () {
    Future<void> pullToRefresh(WidgetTester tester) async {
      await tester.fling(
        find.byType(ListView),
        const Offset(0, 300),
        1000,
      );
      await tester.pump();
      // Finish the scroll and the refresh indicator animation.
      await tester.pump(const Duration(seconds: 1));
      await tester.pump(const Duration(seconds: 1));
    }

    testWidgets('pull to refresh calls onRefresh', (tester) async {
      final completer = Completer<void>();
      var refreshes = 0;
      await pumpSized(
        tester,
        ImpaktfullUiListView<int>.builder(
          items: [for (var i = 0; i < 40; i++) i],
          itemBuilder: itemBuilder,
          onRefresh: () {
            refreshes++;
            return completer.future;
          },
          placeholderData: placeholderData,
        ),
      );
      await pullToRefresh(tester);
      expect(refreshes, 1);
      expect(find.byType(RefreshProgressIndicator), findsOneWidget);

      completer.complete();
      await tester.pumpAndSettle();
      expect(find.byType(RefreshProgressIndicator), findsNothing);
    });

    testWidgets(
      'pull to refresh works when the items do not fill the list',
      (tester) async {
        var refreshes = 0;
        await pumpSized(
          tester,
          ImpaktfullUiListView<int>.builder(
            items: const [1, 2, 3],
            itemBuilder: itemBuilder,
            onRefresh: () async => refreshes++,
            placeholderData: placeholderData,
          ),
        );
        await pullToRefresh(tester);
        await tester.pumpAndSettle();
        expect(refreshes, 1);
      },
    );

    testWidgets('pull to refresh works on an empty list', (tester) async {
      var refreshes = 0;
      await pumpSized(
        tester,
        ImpaktfullUiListView<int>.builder(
          items: const [],
          itemBuilder: itemBuilder,
          onRefresh: () async => refreshes++,
          placeholderData: placeholderData,
        ),
      );
      await pullToRefresh(tester);
      await tester.pumpAndSettle();
      expect(refreshes, 1);
    });

    testWidgets('without onRefresh there is no refresh indicator',
        (tester) async {
      await pumpSized(
        tester,
        ImpaktfullUiListView<int>.builder(
          items: const [1],
          itemBuilder: itemBuilder,
          placeholderData: placeholderData,
        ),
      );
      expect(find.byType(RefreshIndicator), findsNothing);
    });
  });

  testWidgets('localizations of the component are used for the refresh button',
      (tester) async {
    await pumpSized(
      tester,
      ImpaktfullUiListView<int>.builder(
        items: const [],
        itemBuilder: itemBuilder,
        onRefresh: () async {},
        localizations: const ImpaktfullUiListViewLocalizations(
          refreshBtnLabel: 'Reload',
        ),
        placeholderData: placeholderData,
      ),
    );
    expect(find.text('Reload'), findsOneWidget);
  });
}
