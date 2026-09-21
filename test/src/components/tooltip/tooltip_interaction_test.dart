import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/font_loader.dart';
import '../../../util/test_util.dart';

Future<void> _pump(
  WidgetTester tester, {
  String? message = 'Message',
  ImpaktfullUiTooltipTriggerMode? triggerMode,
  VoidCallback? onTap,
}) =>
    pumpAndSettleComponent(
      tester,
      Center(
        child: triggerMode == null
            ? ImpaktfullUiTooltip(
                message: message,
                child: GestureDetector(
                  onTap: onTap,
                  child: const Text('Target'),
                ),
              )
            : ImpaktfullUiTooltip(
                message: message,
                triggerMode: triggerMode,
                child: GestureDetector(
                  onTap: onTap,
                  child: const Text('Target'),
                ),
              ),
      ),
    );

void main() {
  setUpAll(() async => loadImpaktfullUiFonts());

  testWidgets('without a message there is no tooltip', (tester) async {
    await _pump(tester, message: null);
    expect(find.byType(Tooltip), findsNothing);
    expect(find.text('Target'), findsOneWidget);
  });

  testWidgets('uses the colors and wait duration of the theme', (tester) async {
    await _pump(tester);
    final theme = ImpaktfullUiTooltipTheme.of(
      tester.element(find.byType(ImpaktfullUiTooltip)),
    );
    final tooltip = tester.widget<Tooltip>(find.byType(Tooltip));
    expect(tooltip.waitDuration, theme.durations.wait);
    expect(
      (tooltip.decoration as BoxDecoration?)?.color,
      theme.colors.background,
    );
  });

  group('longTap (default)', () {
    testWidgets('a long press shows the message', (tester) async {
      await _pump(tester);

      await tester.longPress(find.text('Target'));
      await tester.pumpAndSettle();
      expect(find.text('Message'), findsOneWidget);

      // The tooltip hides again after the show duration.
      await tester.pump(const Duration(seconds: 2));
      await tester.pumpAndSettle();
      expect(find.text('Message'), findsNothing);
    });

    testWidgets('a tap does not show the message', (tester) async {
      await _pump(tester);

      await tester.tap(find.text('Target'));
      await tester.pumpAndSettle();
      expect(find.text('Message'), findsNothing);
    });
  });

  group('tap', () {
    testWidgets('a tap shows the message and it hides again', (tester) async {
      await _pump(tester, triggerMode: ImpaktfullUiTooltipTriggerMode.tap);

      await tester.tap(find.text('Target'));
      await tester.pumpAndSettle();
      expect(find.text('Message'), findsOneWidget);

      await tester.pump(const Duration(seconds: 2));
      await tester.pumpAndSettle();
      expect(find.text('Message'), findsNothing);
    });

    testWidgets('the child still gets the tap', (tester) async {
      var taps = 0;
      await _pump(
        tester,
        triggerMode: ImpaktfullUiTooltipTriggerMode.tap,
        onTap: () => taps++,
      );

      await tester.tap(find.text('Target'));
      await tester.pumpAndSettle();
      expect(taps, 1);
    });
  });

  testWidgets('hovering shows the message after the wait duration',
      (tester) async {
    await _pump(tester);
    final wait = ImpaktfullUiTooltipTheme.of(
      tester.element(find.byType(ImpaktfullUiTooltip)),
    ).durations.wait;

    final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
    await gesture.addPointer(location: Offset.zero);
    addTearDown(gesture.removePointer);
    await gesture.moveTo(tester.getCenter(find.text('Target')));
    await tester.pump();
    expect(find.text('Message'), findsNothing);

    await tester.pump(wait + const Duration(milliseconds: 10));
    await tester.pumpAndSettle();
    expect(find.text('Message'), findsOneWidget);

    await gesture.moveTo(Offset.zero);
    await tester.pumpAndSettle(const Duration(milliseconds: 200));
    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();
    expect(find.text('Message'), findsNothing);
  });
}
