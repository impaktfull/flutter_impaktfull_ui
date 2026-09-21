import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

class _Aware with RouteAware {
  final events = <String>[];

  @override
  void didPush() => events.add('didPush');

  @override
  void didPop() => events.add('didPop');

  @override
  void didPushNext() => events.add('didPushNext');

  @override
  void didPopNext() => events.add('didPopNext');
}

Route<void> _route(String name) => MaterialPageRoute<void>(
      settings: RouteSettings(name: name),
      builder: (context) => Text(name),
    );

void main() {
  late List<String> logs;
  late ImpaktfullUiPathRouteObserver observer;
  late GlobalKey<NavigatorState> navigatorKey;

  Future<NavigatorState> pumpNavigator(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: navigatorKey,
        navigatorObservers: [observer],
        onGenerateRoute: (settings) => _route(settings.name ?? '/'),
      ),
    );
    return navigatorKey.currentState!;
  }

  setUp(() {
    logs = [];
    observer = ImpaktfullUiPathRouteObserver(logCallback: logs.add);
    navigatorKey = GlobalKey<NavigatorState>();
  });

  testWidgets('logs the initial route', (tester) async {
    await pumpNavigator(tester);
    expect(logs, ['didPush: /']);
  });

  testWidgets('logs push and pop with the route name', (tester) async {
    final navigator = await pumpNavigator(tester);
    unawaited(navigator.pushNamed('/detail'));
    await tester.pumpAndSettle();
    navigator.pop();
    await tester.pumpAndSettle();
    expect(logs, ['didPush: /', 'didPush: /detail', 'didPop: /detail']);
  });

  testWidgets('logs replace with the new route name', (tester) async {
    final navigator = await pumpNavigator(tester);
    unawaited(navigator.pushReplacementNamed('/other'));
    await tester.pumpAndSettle();
    expect(logs, ['didPush: /', 'didReplace: /other']);
  });

  testWidgets('logs remove', (tester) async {
    final navigator = await pumpNavigator(tester);
    unawaited(navigator.pushNamed('/a'));
    await tester.pumpAndSettle();
    unawaited(navigator.pushNamedAndRemoveUntil('/b', (route) => false));
    await tester.pumpAndSettle();
    expect(logs, [
      'didPush: /',
      'didPush: /a',
      'didPush: /b',
      'didRemove: /a',
      'didRemove: /',
    ]);
  });

  testWidgets('still notifies RouteAware subscribers', (tester) async {
    final navigator = await pumpNavigator(tester);
    final aware = _Aware();
    observer.subscribe(
        aware, ModalRoute.of(tester.element(find.text('/')))! as PageRoute);
    expect(aware.events, ['didPush']);

    unawaited(navigator.pushNamed('/detail'));
    await tester.pumpAndSettle();
    navigator.pop();
    await tester.pumpAndSettle();
    expect(aware.events, ['didPush', 'didPushNext', 'didPopNext']);

    observer.unsubscribe(aware);
  });

  testWidgets('works as a navigator observer of ImpaktfullUiApp',
      (tester) async {
    await tester.pumpWidget(
      ImpaktfullUiApp(
        showDebugFlag: false,
        title: 'test',
        navigatorKey: navigatorKey,
        navigatorObservers: [observer],
        onGenerateRoute: (settings) => _route(settings.name ?? '/'),
      ),
    );
    await tester.pumpAndSettle();
    unawaited(navigatorKey.currentState!.pushNamed('/detail'));
    await tester.pumpAndSettle();
    expect(logs, containsAllInOrder(['didPush: /', 'didPush: /detail']));
  });

  test('prints with debugPrint without a logCallback', () {
    final printed = <String?>[];
    final original = debugPrint;
    debugPrint = (message, {wrapWidth}) => printed.add(message);
    addTearDown(() => debugPrint = original);

    ImpaktfullUiPathRouteObserver().log('message');
    expect(printed, ['message']);
  });
}
