import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../_overlays_test_helpers.dart';

void main() {
  group('ImpaktfullUiDesktopPageRoute', () {
    testWidgets('shows the page without a transition', (tester) async {
      final context = await pumpOverlayApp(
        tester,
        home: const Text('First page'),
      );
      unawaited(Navigator.of(context).push(
        ImpaktfullUiDesktopPageRoute<void>(
          builder: (context) => const Text('Second page'),
        ),
      ));
      await tester.pump();
      // At its final position after one frame: no animation.
      expect(find.text('Second page'), findsOneWidget);
      final afterOneFrame = tester.getRect(find.text('Second page'));
      await tester.pumpAndSettle();
      expect(tester.getRect(find.text('Second page')), afterOneFrame);
      expect(find.text('First page'), findsNothing);
    });

    testWidgets('pops without a transition and returns the result',
        (tester) async {
      final context = await pumpOverlayApp(
        tester,
        home: const Text('First page'),
      );
      String? result;
      unawaited(Navigator.of(context)
          .push(
            ImpaktfullUiDesktopPageRoute<String>(
              builder: (context) => const Text('Second page'),
            ),
          )
          .then((value) => result = value));
      await tester.pump();

      Navigator.of(tester.element(find.text('Second page'))).pop('done');
      await tester.pump();
      expect(find.text('Second page'), findsNothing);
      expect(result, 'done');
    });

    test('passes the settings and fullscreenDialog', () {
      final route = ImpaktfullUiDesktopPageRoute<void>(
        builder: (context) => const SizedBox(),
        settings: const RouteSettings(name: 'details'),
        fullscreenDialog: true,
      );
      expect(route.settings.name, 'details');
      expect(route.fullscreenDialog, isTrue);
      expect(route.transitionDuration, Duration.zero);
      expect(route.reverseTransitionDuration, Duration.zero);
    });
  });

  group('ImpaktfullUiAdaptivePageRoute', () {
    test('passes the settings and fullscreenDialog', () {
      final route = ImpaktfullUiAdaptivePageRoute.create<void>(
        builder: (context) => const SizedBox(),
        settings: const RouteSettings(name: 'details'),
        fullscreenDialog: true,
      );
      expect(route.settings.name, 'details');
      expect(route.fullscreenDialog, isTrue);
    });

    testWidgets('shows the page of the builder and returns the result',
        (tester) async {
      final context = await pumpOverlayApp(
        tester,
        home: const Text('First page'),
      );
      int? result;
      unawaited(Navigator.of(context)
          .push(
            ImpaktfullUiAdaptivePageRoute.create<int>(
              builder: (context) => const Text('Second page'),
            ),
          )
          .then((value) => result = value));
      await tester.pumpAndSettle();
      expect(find.text('Second page'), findsOneWidget);

      Navigator.of(tester.element(find.text('Second page'))).pop(42);
      await tester.pumpAndSettle();
      expect(find.text('First page'), findsOneWidget);
      expect(result, 42);
    });
  });
}
