import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

// The material themes are tested in app_test.dart.
void main() {
  testWidgets('shows home and its title', (tester) async {
    await tester.pumpWidget(const ImpaktfullUiApp(
      title: 'My app',
      showDebugFlag: false,
      home: Text('home'),
    ));
    expect(find.text('home'), findsOneWidget);
    expect(
        tester.widget<MaterialApp>(find.byType(MaterialApp)).title, 'My app');
  });

  testWidgets('of and maybeOf find the app', (tester) async {
    late BuildContext context;
    await tester.pumpWidget(ImpaktfullUiApp(
      title: 'app',
      showDebugFlag: false,
      home: Builder(builder: (c) {
        context = c;
        return const SizedBox();
      }),
    ));
    expect(ImpaktfullUiApp.of(context).title, 'app');
    expect(ImpaktfullUiApp.maybeOf(context), isNotNull);
  });

  testWidgets('maybeOf is null outside an app', (tester) async {
    late BuildContext context;
    await tester.pumpWidget(Builder(builder: (c) {
      context = c;
      return const SizedBox();
    }));
    expect(ImpaktfullUiApp.maybeOf(context), isNull);
  });

  testWidgets('onGenerateRoute builds the initial route', (tester) async {
    final names = <String?>[];
    await tester.pumpWidget(ImpaktfullUiApp(
      title: 'app',
      showDebugFlag: false,
      initialRoute: '/start',
      onGenerateRoute: (settings) {
        names.add(settings.name);
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (context) => Text('route ${settings.name}'),
        );
      },
    ));
    await tester.pumpAndSettle();
    expect(find.text('route /start'), findsOneWidget);
    expect(names, ['/start']);
  });

  testWidgets('onGenerateRoute returning null throws', (tester) async {
    await tester.pumpWidget(ImpaktfullUiApp(
      title: 'app',
      showDebugFlag: false,
      onGenerateRoute: (settings) => null,
    ));
    expect(tester.takeException(), isException);
  });

  testWidgets('navigates with the navigatorKey and observers', (tester) async {
    final navigatorKey = GlobalKey<NavigatorState>();
    final observer = _RecordingObserver();
    await tester.pumpWidget(ImpaktfullUiApp(
      title: 'app',
      showDebugFlag: false,
      navigatorKey: navigatorKey,
      navigatorObservers: [observer],
      home: const Text('home'),
    ));
    unawaited(navigatorKey.currentState!.push(MaterialPageRoute<void>(
      builder: (context) => const Text('second'),
    )));
    await tester.pumpAndSettle();
    expect(find.text('second'), findsOneWidget);
    expect(observer.pushes, 2);

    navigatorKey.currentState!.pop();
    await tester.pumpAndSettle();
    expect(find.text('home'), findsOneWidget);
  });

  testWidgets('builder wraps the app', (tester) async {
    await tester.pumpWidget(ImpaktfullUiApp(
      title: 'app',
      showDebugFlag: false,
      home: const Text('home'),
      builder: (context, app) => Column(
        textDirection: TextDirection.ltr,
        children: [
          const Text('above', textDirection: TextDirection.ltr),
          Expanded(child: app),
        ],
      ),
    ));
    expect(find.text('above'), findsOneWidget);
    expect(find.text('home'), findsOneWidget);
  });

  testWidgets('provides the theme', (tester) async {
    final customTheme = ImpaktfullUiTheme.getDefault();
    late BuildContext context;
    await tester.pumpWidget(ImpaktfullUiApp(
      title: 'app',
      showDebugFlag: false,
      impaktfullUiTheme: customTheme,
      home: Builder(builder: (c) {
        context = c;
        return const SizedBox();
      }),
    ));
    expect(ImpaktfullUiTheme.of(context), same(customTheme));
  });

  testWidgets('provides the localizations', (tester) async {
    await tester.pumpWidget(ImpaktfullUiApp(
      title: 'app',
      showDebugFlag: false,
      localizations: const ImpaktfullUiLocalizations(
        navBar: ImpaktfullUiNavBarLocalizations(backTooltip: 'Terug'),
      ),
      home: ImpaktfullUiScreen(
        title: 'Title',
        onBackTapped: () {},
        child: const SizedBox(),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byTooltip('Terug'), findsOneWidget);
  });

  final bannerCases = <String, ({bool debug, String? flavor, int banners})>{
    'no banners': (debug: false, flavor: null, banners: 0),
    'debug banner': (debug: true, flavor: null, banners: 1),
    'flavor banner': (debug: false, flavor: 'DEV', banners: 1),
    'debug and flavor banner': (debug: true, flavor: 'DEV', banners: 2),
  };
  for (final entry in bannerCases.entries) {
    testWidgets(entry.key, (tester) async {
      await tester.pumpWidget(ImpaktfullUiApp(
        title: 'app',
        showDebugFlag: entry.value.debug,
        flavorBannerText: entry.value.flavor,
        home: const SizedBox(),
      ));
      final banners = tester
          .widgetList<Banner>(find.byType(Banner))
          .map((banner) => banner.message)
          // The checked mode banner of MaterialApp (debugShowCheckedModeBanner).
          .where((message) => message != 'DEBUG')
          .toList();
      expect(banners.length, entry.value.banners);
      if (entry.value.flavor != null) {
        expect(banners, contains(entry.value.flavor));
      }
      if (entry.value.debug) {
        expect(banners, contains('Debug'));
      }
    });
  }
}

class _RecordingObserver extends NavigatorObserver {
  var pushes = 0;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    pushes++;
  }
}
