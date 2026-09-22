import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/font_loader.dart';
import '../../../util/test_util.dart';
import '../_overlays_test_helpers.dart';

/// The show duration of the notifications that are closed before it ends.
const _longDuration = Duration(seconds: 5);

/// Removes the active snacky of the global controller, so the next test
/// starts without a visible notification.
///
/// Snacky does not cancel the timer of the show duration when a snacky is
/// closed early: wait until it ended, the test fails with a pending timer.
Future<void> _cancelAll(WidgetTester tester) async {
  SnackyController.instance.cancelAll();
  await tester.pumpAndSettle();
  await tester.pump(_longDuration);
  await tester.pumpAndSettle();
}

void main() {
  setUpAll(() async => loadImpaktfullUiFonts());

  group('Widget', () {
    testWidgets('without onTap and close there is no button or chevron',
        (tester) async {
      await pumpAndSettleComponent(
        tester,
        const Center(
          child: ImpaktfullUiNotification(title: 'Title', width: 300),
        ),
      );
      expect(find.byType(ImpaktfullUiIconButton), findsNothing);
      expect(find.byType(ImpaktfullUiTouchFeedback), findsNothing);
    });

    testWidgets('the builders get the color of the type', (tester) async {
      final colors = <Color>[];
      late ImpaktfullUiNotificationTheme theme;
      await pumpAndSettleComponent(
        tester,
        Center(
          child: Builder(
            builder: (context) {
              theme = ImpaktfullUiNotificationTheme.of(context);
              return ImpaktfullUiNotification(
                title: 'Title',
                width: 300,
                type: ImpaktfullUiNotificationType.error,
                leadingWidgetBuilder: (context, config) {
                  colors.add(config.color);
                  return const Text('Leading');
                },
                trailingWidgetBuilder: (context, config) {
                  colors.add(config.color);
                  return const Text('Trailing');
                },
                centerWidgetBuilder: (context, config) {
                  colors.add(config.color);
                  return const Text('Center');
                },
                bottomWidgetBuilder: (context, config) {
                  colors.add(config.color);
                  return const Text('Bottom');
                },
              );
            },
          ),
        ),
      );
      for (final text in ['Leading', 'Trailing', 'Center', 'Bottom']) {
        expect(find.text(text), findsOneWidget);
      }
      expect(colors, hasLength(4));
      expect(colors.toSet(), {theme.colors.error});
    });

    testWidgets('the bottom widget is below the title', (tester) async {
      await pumpAndSettleComponent(
        tester,
        Center(
          child: ImpaktfullUiNotification(
            title: 'Title',
            width: 300,
            bottomWidgetBuilder: (context, config) => const Text('Bottom'),
          ),
        ),
      );
      expect(
        tester.getTopLeft(find.text('Bottom')).dy,
        greaterThan(tester.getBottomLeft(find.text('Title')).dy),
      );
    });
  });

  group('show', () {
    testWidgets('shows a notification that hides after the duration',
        (tester) async {
      await pumpOverlayApp(tester);

      ImpaktfullUiNotification.show(
        title: 'Saved',
        subtitle: 'Your changes are saved',
        showDuration: const Duration(seconds: 2),
      );
      await tester.pumpAndSettle();
      expect(find.text('Saved'), findsOneWidget);
      expect(find.text('Your changes are saved'), findsOneWidget);
      final notification = tester.widget<ImpaktfullUiNotification>(
        find.byType(ImpaktfullUiNotification),
      );
      expect(notification.type, ImpaktfullUiNotificationType.success);

      await tester.pump(const Duration(seconds: 1));
      expect(find.text('Saved'), findsOneWidget);

      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(find.text('Saved'), findsNothing);
      expect(SnackyController.instance.activeSnacky.value, isNull);
    });

    testWidgets('the close button hides the notification', (tester) async {
      await pumpOverlayApp(tester);

      ImpaktfullUiNotification.show(
        title: 'Saved',
        type: ImpaktfullUiNotificationType.error,
        showDuration: _longDuration,
      );
      await tester.pumpAndSettle();
      final notification = tester.widget<ImpaktfullUiNotification>(
        find.byType(ImpaktfullUiNotification),
      );
      expect(notification.type, ImpaktfullUiNotificationType.error);

      await tester.tap(find.descendant(
        of: find.byType(ImpaktfullUiNotification),
        matching: find.byType(ImpaktfullUiIconButton),
      ));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(find.text('Saved'), findsNothing);

      await _cancelAll(tester);
    });

    testWidgets('a new notification replaces the active one by default',
        (tester) async {
      await pumpOverlayApp(tester);

      ImpaktfullUiNotification.show(
        title: 'First',
        showDuration: _longDuration,
      );
      await tester.pumpAndSettle();
      ImpaktfullUiNotification.show(
        title: 'Second',
        showDuration: _longDuration,
      );
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(find.text('First'), findsNothing);
      expect(find.text('Second'), findsOneWidget);

      await _cancelAll(tester);
    });

    testWidgets('without cancelAll the notifications are queued',
        (tester) async {
      await pumpOverlayApp(tester);

      ImpaktfullUiNotification.show(
        title: 'First',
        showDuration: const Duration(seconds: 2),
      );
      await tester.pumpAndSettle();
      ImpaktfullUiNotification.show(
        title: 'Second',
        cancelAll: false,
        showDuration: const Duration(seconds: 2),
      );
      await tester.pumpAndSettle();
      expect(find.text('First'), findsOneWidget);
      expect(find.text('Second'), findsNothing);

      await tester.pump(const Duration(seconds: 2));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(find.text('First'), findsNothing);
      expect(find.text('Second'), findsOneWidget);

      await _cancelAll(tester);
    });

    testWidgets('with a context it uses the snackyController of the app',
        (tester) async {
      final controller = SnackyController();
      final context =
          await pumpOverlayApp(tester, snackyController: controller);

      ImpaktfullUiNotification.show(
        context: context,
        title: 'Custom controller',
        showDuration: _longDuration,
      );
      await tester.pumpAndSettle();
      expect(find.text('Custom controller'), findsOneWidget);
      expect(controller.activeSnacky.value, isNotNull);
      expect(SnackyController.instance.activeSnacky.value, isNull);

      controller.cancelAll();
      await tester.pumpAndSettle();
      await tester.pump(_longDuration);
      await tester.pumpAndSettle();
      expect(find.text('Custom controller'), findsNothing);
    });

    testWidgets('without a context it uses SnackyController.instance',
        (tester) async {
      final controller = SnackyController();
      await pumpOverlayApp(tester, snackyController: controller);

      ImpaktfullUiNotification.show(
        title: 'Global controller',
        showDuration: _longDuration,
      );
      await tester.pumpAndSettle();
      // The global controller is not attached to the app, so nothing shows.
      expect(find.text('Global controller'), findsNothing);
      expect(controller.activeSnacky.value, isNull);
    });

    testWidgets('the controller argument is used without a context',
        (tester) async {
      final controller = SnackyController();
      await pumpOverlayApp(tester, snackyController: controller);

      ImpaktfullUiNotification.show(
        controller: controller,
        title: 'Explicit controller',
        showDuration: _longDuration,
      );
      await tester.pumpAndSettle();
      expect(find.text('Explicit controller'), findsOneWidget);
      expect(controller.activeSnacky.value, isNotNull);

      controller.cancelAll();
      await tester.pumpAndSettle();
      await tester.pump(_longDuration);
      await tester.pumpAndSettle();
    });

    testWidgets('onTap, leading, trailing and width are passed',
        (tester) async {
      final context = await pumpOverlayApp(tester);
      var taps = 0;

      ImpaktfullUiNotification.show(
        context: context,
        title: 'Rich',
        type: ImpaktfullUiNotificationType.warning,
        showDuration: _longDuration,
        onTap: () => taps++,
        leading: const Text('Leading'),
        trailing: const Text('Trailing'),
        width: 280,
      );
      await tester.pumpAndSettle();
      final notification = tester.widget<ImpaktfullUiNotification>(
        find.byType(ImpaktfullUiNotification),
      );
      expect(notification.width, 280);
      expect(notification.type, ImpaktfullUiNotificationType.warning);
      expect(notification.onCloseTapped, isNotNull);
      expect(find.text('Leading'), findsOneWidget);
      expect(find.text('Trailing'), findsOneWidget);
      expect(
        tester.getSize(find.byType(ImpaktfullUiNotification)).width,
        280,
      );

      await tester.tap(find.text('Rich'));
      await tester.pumpAndSettle();
      expect(taps, 1);

      // The close button closes it and does not call onTap.
      await tester.tap(find.descendant(
        of: find.byType(ImpaktfullUiNotification),
        matching: find.byType(ImpaktfullUiIconButton),
      ));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(taps, 1);
      expect(find.text('Rich'), findsNothing);

      await _cancelAll(tester);
    });

    testWidgets('without width it takes the width of the snacky layout',
        (tester) async {
      final context = await pumpOverlayApp(tester);

      ImpaktfullUiNotification.show(
        context: context,
        title: 'Tappable',
        showDuration: _longDuration,
        onTap: () {},
      );
      await tester.pumpAndSettle();
      final notification = tester.widget<ImpaktfullUiNotification>(
        find.byType(ImpaktfullUiNotification),
      );
      expect(notification.width, isNull);
      expect(notification.onTap, isNotNull);
      expect(tester.getSize(find.byType(ImpaktfullUiNotification)).width,
          greaterThan(0));

      await _cancelAll(tester);
    });
  });
}
