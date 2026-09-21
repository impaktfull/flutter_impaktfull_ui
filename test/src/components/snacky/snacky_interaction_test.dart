import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/font_loader.dart';
import '../_overlays_test_helpers.dart';

ImpaktfullUiNotification _notification(WidgetTester tester) =>
    tester.widget<ImpaktfullUiNotification>(
      find.byType(ImpaktfullUiNotification),
    );

void main() {
  setUpAll(() async => loadImpaktfullUiFonts());

  late SnackyController controller;

  setUp(() => controller = SnackyController());

  Future<void> show(WidgetTester tester, Snacky snacky) async {
    await pumpOverlayApp(tester, snackyController: controller);
    controller.showMessage((context) => snacky);
    await tester.pumpAndSettle();
  }

  testWidgets('maps every snacky type to a notification type', (tester) async {
    final expected = {
      SnackyType.success: ImpaktfullUiNotificationType.success,
      SnackyType.error: ImpaktfullUiNotificationType.error,
      SnackyType.warning: ImpaktfullUiNotificationType.warning,
      SnackyType.info: ImpaktfullUiNotificationType.info,
      SnackyType.branded: ImpaktfullUiNotificationType.branded,
    };
    for (final entry in expected.entries) {
      // Start from a new app with a new controller for every type.
      await tester.pumpWidget(const SizedBox());
      controller = SnackyController();
      await show(
        tester,
        Snacky(title: entry.key.name, type: entry.key, openUntillClosed: true),
      );
      expect(_notification(tester).type, entry.value);
      expect(_notification(tester).title, entry.key.name);
    }
  });

  testWidgets('canBeClosed shows a close button that hides it', (tester) async {
    await show(
      tester,
      const Snacky(
          title: 'Closable', canBeClosed: true, openUntillClosed: true),
    );
    expect(_notification(tester).onCloseTapped, isNotNull);

    await tester.tap(find.descendant(
      of: find.byType(ImpaktfullUiNotification),
      matching: find.byType(ImpaktfullUiIconButton),
    ));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();
    expect(find.text('Closable'), findsNothing);
    expect(controller.activeSnacky.value, isNull);

    // Snacky does not cancel the timer of the show duration when a snacky is
    // closed early.
    await tester.pump(const Duration(seconds: 30));
  });

  testWidgets('without canBeClosed there is no close button', (tester) async {
    await show(
      tester,
      const Snacky(title: 'Not closable', openUntillClosed: true),
    );
    expect(_notification(tester).onCloseTapped, isNull);
  });

  testWidgets('onTap of the snacky is called', (tester) async {
    var taps = 0;
    await show(
      tester,
      Snacky(title: 'Tap', onTap: () => taps++, openUntillClosed: true),
    );

    await tester.tap(find.text('Tap'));
    await tester.pumpAndSettle();
    expect(taps, 1);
  });

  testWidgets('passes the widget builders of the snacky', (tester) async {
    await show(
      tester,
      Snacky(
        title: 'Builders',
        openUntillClosed: true,
        leadingWidgetBuilder: (context, snacky) => const Text('Leading'),
        trailingWidgetBuilder: (context, snacky) => const Text('Trailing'),
        bottomWidgetBuilder: (context, snacky) => const Text('Bottom'),
      ),
    );
    expect(find.text('Leading'), findsOneWidget);
    expect(find.text('Trailing'), findsOneWidget);
    expect(find.text('Bottom'), findsOneWidget);
  });

  testWidgets('a custom builder of the snacky is used', (tester) async {
    await show(
      tester,
      Snacky.widget(
        openUntillClosed: true,
        builder: (context, snacky) => const Text('Custom'),
      ),
    );
    expect(find.text('Custom'), findsOneWidget);
    expect(find.byType(ImpaktfullUiNotification), findsNothing);
  });

  testWidgets('hides after the show duration', (tester) async {
    await show(
      tester,
      const Snacky(title: 'Timed', showDuration: Duration(seconds: 3)),
    );
    expect(find.text('Timed'), findsOneWidget);

    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();
    expect(find.text('Timed'), findsNothing);
  });

  group('ImpaktfullUiSnackyConfigurator', () {
    Future<SnackyConfiguratorWidget> pumpConfigurator(
      WidgetTester tester, {
      Locale? locale,
    }) async {
      await tester.pumpWidget(
        ImpaktfullUiApp(
          showDebugFlag: false,
          title: 'test',
          locale: locale,
          home: const SizedBox(),
        ),
      );
      await tester.pumpAndSettle();
      return tester.widget<SnackyConfiguratorWidget>(
        find.byType(SnackyConfiguratorWidget),
      );
    }

    testWidgets('uses ltr by default', (tester) async {
      final configurator = await pumpConfigurator(tester);
      expect(configurator.textDirection, TextDirection.ltr);
    });

    testWidgets('uses rtl for a rtl locale', (tester) async {
      final configurator = await pumpConfigurator(
        tester,
        locale: const Locale('ar'),
      );
      expect(configurator.textDirection, TextDirection.rtl);
    });

    testWidgets('shows on top on mobile and at the top end on tablets',
        (tester) async {
      final configurator = await pumpConfigurator(tester);
      final breakpoints = configurator.layoutConfig!.breakpoints;
      expect(breakpoints.first.snackyLocation, SnackyLocation.top);
      expect(breakpoints.last.snackyLocation, SnackyLocation.topEnd);
    });
  });
}
