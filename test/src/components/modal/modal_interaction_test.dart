import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/font_loader.dart';
import '../../../util/navigator_test_util.dart';
import '../_overlays_test_helpers.dart';

Finder get _closeButton => find.descendant(
      of: find.byType(ImpaktfullUiModal),
      matching: find.byType(ImpaktfullUiIconButton),
    );

/// Keeps track of the result of a route future.
class _Result<T> {
  var isCompleted = false;
  T? value;

  void track(Future<T?> future) => unawaited(future.then((result) {
        isCompleted = true;
        value = result;
      }));
}

void main() {
  setUpAll(() async => loadImpaktfullUiFonts());

  group('show', () {
    testWidgets('returns the value the modal is popped with', (tester) async {
      final context = await pumpOverlayApp(tester);
      final result = _Result<String>()
        ..track(ImpaktfullUiModal.show<String>(
          context: context,
          builder: (context) => ImpaktfullUiModal(
            title: 'Pick',
            primaryActionLabel: 'Yes',
            primaryActionOnTap: () => Navigator.of(context).pop('yes'),
          ),
        ));
      await tester.pumpAndSettle();

      await tapAndSettle(tester, find.text('Yes'));
      expect(result.isCompleted, isTrue);
      expect(result.value, 'yes');
      expect(find.text('Pick'), findsNothing);
    });

    testWidgets('the close button returns null', (tester) async {
      final context = await pumpOverlayApp(tester);
      final result = _Result<String>()
        ..track(ImpaktfullUiModal.showSimple<String>(
          context: context,
          title: 'Title',
        ));
      await tester.pumpAndSettle();

      await tapAndSettle(tester, _closeButton);
      expect(result.isCompleted, isTrue);
      expect(result.value, isNull);
    });

    testWidgets('passes the route settings', (tester) async {
      final context = await pumpOverlayApp(tester);
      String? routeName;
      unawaited(ImpaktfullUiModal.show<void>(
        context: context,
        routeSettings: const RouteSettings(name: 'my-modal'),
        builder: (context) {
          routeName = ModalRoute.of(context)?.settings.name;
          return const ImpaktfullUiModal(title: 'Title');
        },
      ));
      await tester.pumpAndSettle();
      expect(routeName, 'my-modal');
    });

    testWidgets('rootNavigator shows it on the root navigator', (tester) async {
      final context = await pumpNestedNavigator(tester);
      final result = _Result<void>()
        ..track(ImpaktfullUiModal.showSimple<void>(
          context: context,
          title: 'Root',
          rootNavigator: true,
        ));
      await tester.pumpAndSettle();
      final rootNavigator = tester.state<NavigatorState>(
        find.byType(Navigator).first,
      );
      final modalNavigator = Navigator.of(tester.element(find.text('Root')));
      expect(modalNavigator, rootNavigator);

      await tapAndSettle(tester, _closeButton);
      expect(result.isCompleted, isTrue);
      expect(find.text('Second page'), findsOneWidget);
    });

    testWidgets('the future completes after the closing animation',
        (tester) async {
      final context = await pumpOverlayApp(tester);
      final result = _Result<void>()
        ..track(ImpaktfullUiModal.showSimple<void>(
          context: context,
          title: 'Title',
        ));
      await tester.pumpAndSettle();

      await tester.tap(_closeButton);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));
      // The modal is still fading out.
      expect(find.text('Title'), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.text('Title'), findsNothing);
      expect(result.isCompleted, isTrue);
    });

    testWidgets('hasBlurredBackground blurs the page below', (tester) async {
      final context = await pumpOverlayApp(tester);
      unawaited(ImpaktfullUiModal.showSimple<void>(
        context: context,
        title: 'Title',
        hasBlurredBackground: true,
      ));
      await tester.pumpAndSettle();
      final filter = tester.widget<BackdropFilter>(find.byType(BackdropFilter));
      expect(filter.filter, ImageFilter.blur(sigmaX: 8, sigmaY: 8));
    });

    testWidgets('no blur by default', (tester) async {
      final context = await pumpOverlayApp(tester);
      unawaited(
          ImpaktfullUiModal.showSimple<void>(context: context, title: 'T'));
      await tester.pumpAndSettle();
      expect(find.byType(BackdropFilter), findsNothing);
    });
  });

  group('onCloseTapped', () {
    testWidgets('true closes the modal', (tester) async {
      final context = await pumpOverlayApp(tester);
      var calls = 0;
      final result = _Result<void>()
        ..track(ImpaktfullUiModal.showSimple<void>(
          context: context,
          title: 'Title',
          onCloseTapped: () async {
            calls++;
            return true;
          },
        ));
      await tester.pumpAndSettle();

      await tapAndSettle(tester, _closeButton);
      expect(calls, 1);
      expect(result.isCompleted, isTrue);
    });

    testWidgets('false keeps the modal open', (tester) async {
      final context = await pumpOverlayApp(tester);
      var calls = 0;
      unawaited(ImpaktfullUiModal.showSimple<void>(
        context: context,
        title: 'Title',
        onCloseTapped: () async {
          calls++;
          return false;
        },
      ));
      await tester.pumpAndSettle();

      await tapAndSettle(tester, _closeButton);
      await tapAndSettle(tester, _closeButton);
      expect(calls, 2);
      expect(find.text('Title'), findsOneWidget);
    });

    testWidgets('shows the close button even when hasClose is false',
        (tester) async {
      final context = await pumpOverlayApp(tester);
      unawaited(ImpaktfullUiModal.showSimple<void>(
        context: context,
        title: 'Title',
        hasClose: false,
        onCloseTapped: () async => true,
      ));
      await tester.pumpAndSettle();
      expect(_closeButton, findsOneWidget);
    });

    testWidgets('no close button with hasClose false', (tester) async {
      final context = await pumpOverlayApp(tester);
      unawaited(ImpaktfullUiModal.showSimple<void>(
        context: context,
        title: 'Title',
        hasClose: false,
      ));
      await tester.pumpAndSettle();
      expect(_closeButton, findsNothing);
    });
  });

  group('Keyboard', () {
    testWidgets('escape closes a dismissible modal', (tester) async {
      final context = await pumpOverlayApp(tester);
      final result = _Result<void>()
        ..track(ImpaktfullUiModal.showSimple<void>(
          context: context,
          title: 'Title',
        ));
      await tester.pumpAndSettle();

      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await tester.pumpAndSettle();
      expect(find.text('Title'), findsNothing);
      expect(result.isCompleted, isTrue);
    });

    testWidgets('escape does not close a modal that is not dismissible',
        (tester) async {
      final context = await pumpOverlayApp(tester);
      unawaited(ImpaktfullUiModal.showSimple<void>(
        context: context,
        title: 'Title',
        isDismissible: false,
      ));
      await tester.pumpAndSettle();

      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await tester.pumpAndSettle();
      expect(find.text('Title'), findsOneWidget);
    });

    testWidgets('escape does not close it with barrierDismissible false',
        (tester) async {
      final context = await pumpOverlayApp(tester);
      unawaited(ImpaktfullUiModal.show<void>(
        context: context,
        barrierDismissible: false,
        builder: (context) => const ImpaktfullUiModal(title: 'Title'),
      ));
      await tester.pumpAndSettle();

      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await tester.pumpAndSettle();
      expect(find.text('Title'), findsOneWidget);
    });
  });

  group('Actions', () {
    Future<void> pumpModal(WidgetTester tester, ImpaktfullUiModal modal) =>
        pumpOverlayApp(tester, home: modal);

    testWidgets('2 actions in a small modal are next to each other',
        (tester) async {
      await pumpModal(
        tester,
        ImpaktfullUiModal.simple(
          title: 'Title',
          secondaryActionLabel: 'Cancel',
          secondaryActionOnTap: () {},
          primaryActionLabel: 'Ok',
          primaryActionOnTap: () {},
        ),
      );
      final cancel = tester.getRect(find.text('Cancel'));
      final ok = tester.getRect(find.text('Ok'));
      expect(cancel.center.dy, closeTo(ok.center.dy, 1));
      expect(cancel.center.dx, lessThan(ok.center.dx));
    });

    testWidgets('actions of a wide modal are below each other', (tester) async {
      await pumpModal(
        tester,
        ImpaktfullUiModal.simple(
          width: 500,
          title: 'Title',
          secondaryActionLabel: 'Cancel',
          secondaryActionOnTap: () {},
          primaryActionLabel: 'Ok',
          primaryActionOnTap: () {},
        ),
      );
      final cancel = tester.getRect(find.text('Cancel'));
      final ok = tester.getRect(find.text('Ok'));
      expect(cancel.center.dx, closeTo(ok.center.dx, 1));
      expect(cancel.center.dy, lessThan(ok.center.dy));
    });

    testWidgets('the danger type uses a destructive primary button',
        (tester) async {
      await pumpModal(
        tester,
        ImpaktfullUiModal.simple(
          type: ImpaktfullUiModalType.danger,
          title: 'Title',
          primaryActionLabel: 'Delete',
          primaryActionOnTap: () {},
        ),
      );
      final button = tester.widget<ImpaktfullUiButton>(
        find.ancestor(
          of: find.text('Delete'),
          matching: find.byType(ImpaktfullUiButton),
        ),
      );
      expect(button.type, ImpaktfullUiButtonType.destructivePrimary);
    });

    testWidgets('the simple constructor shows the content', (tester) async {
      await pumpModal(
        tester,
        const ImpaktfullUiModal.simple(
          title: 'Title',
          subtitle: 'Subtitle',
          content: 'Content',
        ),
      );
      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Subtitle'), findsOneWidget);
      expect(find.text('Content'), findsOneWidget);
    });
  });
}
