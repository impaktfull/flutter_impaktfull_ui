import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../_data_display_test_helpers.dart';

void main() {
  const placeholderData = ImpaktfullUiGridViewPlaceholderData(title: 'Empty');

  Widget itemBuilder(BuildContext context, int item, int index) =>
      Text('Item $item at $index');

  testWidgets('builder builds every item with its index', (tester) async {
    await pumpSized(
      tester,
      ImpaktfullUiGridView<int>.builder(
        items: const [10, 20, 30],
        crossAxisCount: (context, config) => 3,
        itemBuilder: itemBuilder,
        placeholderData: placeholderData,
      ),
    );
    expect(find.text('Item 10 at 0'), findsOneWidget);
    expect(find.text('Item 20 at 1'), findsOneWidget);
    expect(find.text('Item 30 at 2'), findsOneWidget);
  });

  testWidgets('crossAxisCount and itemAspectRatio get the constraints',
      (tester) async {
    final configs = <ImpaktfullUiGridViewConfig>[];
    await pumpSized(
      tester,
      ImpaktfullUiGridView<int>.builder(
        items: const [1, 2, 3, 4],
        crossAxisCount: (context, config) {
          configs.add(config);
          return 2;
        },
        itemAspectRatio: (context, config) => 2,
        itemBuilder: (context, item, index) => SizedBox.expand(
          child: Text('$item'),
        ),
        placeholderData: placeholderData,
      ),
      size: const Size(400, 600),
    );
    expect(configs.last.maxWidth, 400);
    expect(configs.last.maxHeight, 600);
    // 2 columns of 200 wide with an aspect ratio of 2.
    expect(tester.getSize(find.text('1')), const Size(200, 100));
    expect(tester.getTopLeft(find.text('2')), const Offset(200, 0));
    expect(tester.getTopLeft(find.text('3')), const Offset(0, 100));
  });

  testWidgets('spacing is used between rows and columns', (tester) async {
    await pumpSized(
      tester,
      ImpaktfullUiGridView<int>.builder(
        items: const [1, 2, 3],
        spacing: 10,
        crossAxisCount: (context, config) => 2,
        itemBuilder: (context, item, index) => SizedBox.expand(
          child: Text('$item'),
        ),
        placeholderData: placeholderData,
      ),
      size: const Size(410, 600),
    );
    expect(tester.getSize(find.text('1')), const Size(200, 200));
    expect(tester.getTopLeft(find.text('2')), const Offset(210, 0));
    expect(tester.getTopLeft(find.text('3')), const Offset(0, 210));
  });

  testWidgets('children: widgets are shown without an item builder',
      (tester) async {
    await pumpSized(
      tester,
      ImpaktfullUiGridView<Widget>(
        crossAxisCount: (context, config) => 2,
        placeholderData: placeholderData,
        children: const [Text('A'), Text('B')],
      ),
    );
    expect(find.text('A'), findsOneWidget);
    expect(find.text('B'), findsOneWidget);
  });

  testWidgets('loading shows a loading indicator instead of the items',
      (tester) async {
    await pumpSized(
      tester,
      ImpaktfullUiGridView<int>.builder(
        items: const [1],
        isLoading: true,
        crossAxisCount: (context, config) => 2,
        itemBuilder: itemBuilder,
        placeholderData: placeholderData,
      ),
      settle: false,
    );
    expect(find.byType(ImpaktfullUiLoadingIndicator), findsOneWidget);
    expect(find.text('Item 1 at 0'), findsNothing);
  });

  testWidgets('empty shows the placeholder and the refresh button refreshes',
      (tester) async {
    var refreshes = 0;
    await pumpSized(
      tester,
      ImpaktfullUiGridView<int>.builder(
        items: const [],
        crossAxisCount: (context, config) => 2,
        itemBuilder: itemBuilder,
        onRefresh: () async => refreshes++,
        placeholderData: placeholderData,
      ),
    );
    expect(find.text('Empty'), findsOneWidget);
    await tester.tap(find.text('Refresh'));
    await tester.pumpAndSettle();
    expect(refreshes, 1);
  });

  testWidgets('pull to refresh calls onRefresh', (tester) async {
    final completer = Completer<void>();
    var refreshes = 0;
    await pumpSized(
      tester,
      ImpaktfullUiGridView<int>.builder(
        items: [for (var i = 0; i < 40; i++) i],
        crossAxisCount: (context, config) => 2,
        itemBuilder: itemBuilder,
        onRefresh: () {
          refreshes++;
          return completer.future;
        },
        placeholderData: placeholderData,
      ),
    );
    await tester.fling(find.byType(GridView), const Offset(0, 300), 1000);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    await tester.pump(const Duration(seconds: 1));
    expect(refreshes, 1);
    completer.complete();
    await tester.pumpAndSettle();
    expect(find.byType(RefreshProgressIndicator), findsNothing);
  });

  testWidgets(
    'pull to refresh works on an empty grid',
    (tester) async {
      var refreshes = 0;
      await pumpSized(
        tester,
        ImpaktfullUiGridView<int>.builder(
          items: const [],
          crossAxisCount: (context, config) => 2,
          itemBuilder: itemBuilder,
          onRefresh: () async => refreshes++,
          placeholderData: placeholderData,
        ),
      );
      await tester.fling(find.byType(ListView), const Offset(0, 300), 1000);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(refreshes, 1);
    },
  );

  testWidgets(
    'pull to refresh works when the items do not fill the grid',
    (tester) async {
      var refreshes = 0;
      await pumpSized(
        tester,
        ImpaktfullUiGridView<int>.builder(
          items: const [1, 2],
          crossAxisCount: (context, config) => 2,
          itemBuilder: itemBuilder,
          onRefresh: () async => refreshes++,
          placeholderData: placeholderData,
        ),
      );
      await tester.fling(find.byType(GridView), const Offset(0, 300), 1000);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(refreshes, 1);
    },
  );

  testWidgets('shows the new items passed by the parent', (tester) async {
    var items = [1];
    late StateSetter setState;
    await pumpSized(
      tester,
      StatefulBuilder(
        builder: (context, setter) {
          setState = setter;
          return ImpaktfullUiGridView<int>.builder(
            items: items,
            crossAxisCount: (context, config) => 2,
            itemBuilder: itemBuilder,
            placeholderData: placeholderData,
          );
        },
      ),
    );
    setState(() => items = [1, 2]);
    await tester.pumpAndSettle();
    expect(find.text('Item 2 at 1'), findsOneWidget);
  });
}
