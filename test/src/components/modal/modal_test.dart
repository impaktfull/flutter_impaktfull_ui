import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/util/device_util/device_util.dart';

Future<BuildContext> _pumpApp(WidgetTester tester, {Widget? home}) async {
  late BuildContext appContext;
  await tester.pumpWidget(
    ImpaktfullUiApp(
      showDebugFlag: false,
      title: 'test',
      home: Builder(
        builder: (context) {
          appContext = context;
          return home ?? const SizedBox.expand();
        },
      ),
    ),
  );
  await tester.pumpAndSettle();
  return appContext;
}

void main() {
  group('Dismiss', () {
    testWidgets('tap outside with barrierDismissible false keeps it open',
        (tester) async {
      final context = await _pumpApp(tester);
      unawaited(ImpaktfullUiModal.show<void>(
        context: context,
        barrierDismissible: false,
        builder: (context) => const ImpaktfullUiModal(title: 'Title'),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Title'), findsOneWidget);

      await tester.tapAt(const Offset(5, 5));
      await tester.pumpAndSettle();
      expect(find.text('Title'), findsOneWidget);
    });

    testWidgets('tap outside with isDismissible false keeps it open',
        (tester) async {
      final context = await _pumpApp(tester);
      unawaited(ImpaktfullUiModal.showSimple<void>(
        context: context,
        title: 'Title',
        isDismissible: false,
      ));
      await tester.pumpAndSettle();

      await tester.tapAt(const Offset(5, 5));
      await tester.pumpAndSettle();
      expect(find.text('Title'), findsOneWidget);
    });

    testWidgets('tap outside a dismissible modal closes it', (tester) async {
      final context = await _pumpApp(tester);
      unawaited(
          ImpaktfullUiModal.showSimple<void>(context: context, title: 'Title'));
      await tester.pumpAndSettle();

      await tester.tapAt(const Offset(5, 5));
      await tester.pumpAndSettle();
      expect(find.text('Title'), findsNothing);
    });

    testWidgets('tap on or around an inline modal does not pop the page',
        (tester) async {
      final context = await _pumpApp(tester);
      unawaited(Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (context) => const ImpaktfullUiModal(
            title: 'Inline',
            width: 200,
          ),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Inline'), findsOneWidget);

      await tester.tapAt(const Offset(5, 5));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Inline'));
      await tester.pumpAndSettle();
      expect(find.text('Inline'), findsOneWidget);
    });
  });

  group('Route transition', () {
    List<FadeTransition> fadeTransitions(WidgetTester tester) => tester
        .widgetList<FadeTransition>(
          find.ancestor(
            of: find.text('Title'),
            matching: find.byType(FadeTransition),
          ),
        )
        .toList();

    testWidgets('applies the curve once and reuses the animation',
        (tester) async {
      final context = await _pumpApp(tester);
      unawaited(ImpaktfullUiModal.show<void>(
        context: context,
        builder: (context) => const ImpaktfullUiModal(title: 'Title'),
      ));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 75));

      final halfway = fadeTransitions(tester);
      expect(halfway, hasLength(1));
      final curve = DeviceUtil.isApple() ? Curves.easeInOut : Curves.easeOut;
      expect(halfway.single.opacity.value, closeTo(curve.transform(0.5), 0.01));

      await tester.pump(const Duration(milliseconds: 30));
      final later = fadeTransitions(tester);
      expect(identical(later.single.opacity, halfway.single.opacity), isTrue);

      await tester.pumpAndSettle();
      expect(fadeTransitions(tester).single.opacity.value, 1);
    });
  });

  testWidgets('default constructor calls the action callbacks', (tester) async {
    var primaryTaps = 0;
    var secondaryTaps = 0;
    await _pumpApp(
      tester,
      home: ImpaktfullUiModal(
        title: 'Title',
        primaryActionLabel: 'Primary',
        primaryActionOnTap: () => primaryTaps++,
        secondaryActionLabel: 'Secondary',
        secondaryActionOnTap: () => secondaryTaps++,
      ),
    );

    await tester.tap(find.text('Primary'));
    await tester.tap(find.text('Secondary'));
    await tester.pumpAndSettle();
    expect(primaryTaps, 1);
    expect(secondaryTaps, 1);
  });
}
