import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

Widget _list({required AsyncCallback? onRefresh}) =>
    ImpaktfullUiRefreshIndicator(
      onRefresh: onRefresh,
      child: ListView(
        children: [
          for (var i = 1; i <= 30; i++) ListTile(title: Text('Item $i')),
        ],
      ),
    );

Future<void> _pullToRefresh(WidgetTester tester) async {
  await tester.fling(find.text('Item 1'), const Offset(0, 300), 1000);
  await tester.pump();
  // Wait for the drag animation of the indicator.
  await tester.pump(const Duration(seconds: 1));
}

void main() {
  testWidgets('without onRefresh there is no refresh indicator',
      (tester) async {
    await pumpAndSettleComponent(tester, _list(onRefresh: null));
    expect(find.byType(RefreshIndicator), findsNothing);
    expect(find.text('Item 1'), findsOneWidget);
  });

  testWidgets('uses the colors of the theme', (tester) async {
    await pumpAndSettleComponent(tester, _list(onRefresh: () async {}));
    final theme = ImpaktfullUiRefreshIndicatorTheme.of(
      tester.element(find.byType(ImpaktfullUiRefreshIndicator)),
    );
    final indicator = tester.widget<RefreshIndicator>(
      find.byType(RefreshIndicator),
    );
    expect(indicator.color, theme.colors.loadingIndicator);
    expect(indicator.backgroundColor, theme.colors.backgroundColor);
  });

  testWidgets('pulling down calls onRefresh and waits for it', (tester) async {
    var refreshes = 0;
    final completer = Completer<void>();
    await pumpAndSettleComponent(
      tester,
      _list(
        onRefresh: () {
          refreshes++;
          return completer.future;
        },
      ),
    );

    await _pullToRefresh(tester);
    expect(refreshes, 1);
    expect(find.byType(RefreshProgressIndicator), findsOneWidget);

    completer.complete();
    await tester.pumpAndSettle();
    expect(find.byType(RefreshProgressIndicator), findsNothing);
  });

  testWidgets('a short pull does not refresh', (tester) async {
    var refreshes = 0;
    await pumpAndSettleComponent(
      tester,
      _list(onRefresh: () async => refreshes++),
    );

    await tester.drag(find.text('Item 1'), const Offset(0, 20));
    await tester.pumpAndSettle();
    expect(refreshes, 0);
  });

  testWidgets('scrolling up does not refresh', (tester) async {
    var refreshes = 0;
    await pumpAndSettleComponent(
      tester,
      _list(onRefresh: () async => refreshes++),
    );

    await tester.fling(find.text('Item 5'), const Offset(0, -300), 1000);
    await tester.pumpAndSettle();
    expect(refreshes, 0);
  });
}
