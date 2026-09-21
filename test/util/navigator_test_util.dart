import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

/// Pumps an app with a nested navigator that has 2 pages and returns the
/// context of the second (top) page of the nested navigator.
Future<BuildContext> pumpNestedNavigator(WidgetTester tester) async {
  late BuildContext secondPageContext;
  await tester.pumpWidget(
    ImpaktfullUiApp(
      showDebugFlag: false,
      title: 'test',
      home: Navigator(
        onGenerateRoute: (settings) => MaterialPageRoute<void>(
          builder: (context) => const Text('First page'),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
  final nestedNavigator = tester.state<NavigatorState>(
    find.byType(Navigator).last,
  );
  unawaited(nestedNavigator.push(
    MaterialPageRoute<void>(
      builder: (context) {
        secondPageContext = context;
        return const Text('Second page');
      },
    ),
  ));
  await tester.pumpAndSettle();
  return secondPageContext;
}
