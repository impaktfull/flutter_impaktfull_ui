import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/font_loader.dart';
import '../../../util/test_util.dart';

const _child = SizedBox(width: 100, height: 40, child: Text('Child'));

Future<void> _pump(WidgetTester tester, Widget widget) =>
    pumpAndSettleComponent(tester, Center(child: widget));

ImpaktfullUiFocusFeedback _focusFeedback(WidgetTester tester) =>
    tester.widget<ImpaktfullUiFocusFeedback>(
      find.byType(ImpaktfullUiFocusFeedback),
    );

void main() {
  setUpAll(() async => loadImpaktfullUiFonts());

  group('ImpaktfullUiTouchFeedback', () {
    testWidgets('calls the tap callbacks', (tester) async {
      final events = <String>[];
      await _pump(
        tester,
        ImpaktfullUiTouchFeedback(
          onTap: () => events.add('tap'),
          onTapDown: (_) => events.add('down'),
          onTapUp: (_) => events.add('up'),
          child: _child,
        ),
      );

      await tester.tap(find.text('Child'));
      await tester.pumpAndSettle();
      expect(events, ['down', 'up', 'tap']);
    });

    testWidgets('calls onTapCancel when the pointer moves away',
        (tester) async {
      final events = <String>[];
      await _pump(
        tester,
        ImpaktfullUiTouchFeedback(
          onTap: () => events.add('tap'),
          onTapCancel: () => events.add('cancel'),
          child: _child,
        ),
      );

      final gesture = await tester.startGesture(
        tester.getCenter(find.text('Child')),
      );
      await tester.pump(const Duration(milliseconds: 50));
      await gesture.moveBy(const Offset(0, 300));
      await gesture.up();
      await tester.pumpAndSettle();
      expect(events, ['cancel']);
    });

    testWidgets('calls onDoubleTap', (tester) async {
      var doubleTaps = 0;
      await _pump(
        tester,
        ImpaktfullUiTouchFeedback(
          onTap: () {},
          onDoubleTap: () => doubleTaps++,
          child: _child,
        ),
      );

      await tester.tap(find.text('Child'));
      await tester.pump(const Duration(milliseconds: 50));
      await tester.tap(find.text('Child'));
      await tester.pumpAndSettle();
      expect(doubleTaps, 1);
    });

    testWidgets('calls onLongTap', (tester) async {
      var longTaps = 0;
      var taps = 0;
      await _pump(
        tester,
        ImpaktfullUiTouchFeedback(
          onTap: () => taps++,
          onLongTap: () => longTaps++,
          child: _child,
        ),
      );

      await tester.longPress(find.text('Child'));
      await tester.pumpAndSettle();
      expect(longTaps, 1);
      expect(taps, 0);
    });

    testWidgets('without tap callbacks it is not interactive', (tester) async {
      await _pump(
        tester,
        const ImpaktfullUiTouchFeedback(onTap: null, child: _child),
      );
      expect(find.byType(InkWell), findsNothing);
      expect(find.byType(ImpaktfullUiFocusFeedback), findsNothing);
    });

    testWidgets('onTapDown alone keeps it interactive', (tester) async {
      var downs = 0;
      await _pump(
        tester,
        ImpaktfullUiTouchFeedback(
          onTap: null,
          onTapDown: (_) => downs++,
          child: _child,
        ),
      );

      await tester.tap(find.text('Child'));
      await tester.pumpAndSettle();
      expect(downs, 1);
    });

    testWidgets('shows the tooltip on a long press', (tester) async {
      await _pump(
        tester,
        ImpaktfullUiTouchFeedback(
          onTap: () {},
          tooltip: 'Tooltip',
          child: _child,
        ),
      );

      await tester.longPress(find.text('Child'));
      await tester.pumpAndSettle();
      expect(find.text('Tooltip'), findsOneWidget);
      await tester.pump(const Duration(seconds: 2));
      await tester.pumpAndSettle();
    });

    group('Keyboard', () {
      testWidgets('tab focuses it and calls onFocus', (tester) async {
        var focusCalls = 0;
        await _pump(
          tester,
          ImpaktfullUiTouchFeedback(
            onTap: () {},
            onFocus: () => focusCalls++,
            child: _child,
          ),
        );
        expect(_focusFeedback(tester).hasFocus, isFalse);

        await tester.sendKeyEvent(LogicalKeyboardKey.tab);
        await tester.pumpAndSettle();
        expect(focusCalls, 1);
        expect(_focusFeedback(tester).hasFocus, isTrue);
      });

      testWidgets('enter and space call onTap when it has focus',
          (tester) async {
        var taps = 0;
        await _pump(
          tester,
          ImpaktfullUiTouchFeedback(
            onTap: () => taps++,
            autofocus: true,
            child: _child,
          ),
        );

        await tester.sendKeyEvent(LogicalKeyboardKey.enter);
        await tester.pumpAndSettle();
        await tester.sendKeyEvent(LogicalKeyboardKey.space);
        await tester.pumpAndSettle();
        expect(taps, 2);
      });

      testWidgets('tab moves the focus to the next one', (tester) async {
        await _pump(
          tester,
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ImpaktfullUiTouchFeedback(
                onTap: () {},
                child: const SizedBox(width: 100, height: 40),
              ),
              ImpaktfullUiTouchFeedback(
                onTap: () {},
                child: const SizedBox(width: 100, height: 40),
              ),
            ],
          ),
        );
        List<bool> focused() => tester
            .widgetList<ImpaktfullUiFocusFeedback>(
              find.byType(ImpaktfullUiFocusFeedback),
            )
            .map((feedback) => feedback.hasFocus)
            .toList();

        await tester.sendKeyEvent(LogicalKeyboardKey.tab);
        await tester.pumpAndSettle();
        expect(focused(), [true, false]);

        await tester.sendKeyEvent(LogicalKeyboardKey.tab);
        await tester.pumpAndSettle();
        expect(focused(), [false, true]);
      });

      testWidgets('canRequestFocus false skips it', (tester) async {
        var focusCalls = 0;
        await _pump(
          tester,
          ImpaktfullUiTouchFeedback(
            onTap: () {},
            canRequestFocus: false,
            onFocus: () => focusCalls++,
            child: _child,
          ),
        );

        await tester.sendKeyEvent(LogicalKeyboardKey.tab);
        await tester.pumpAndSettle();
        expect(focusCalls, 0);
        expect(_focusFeedback(tester).hasFocus, isFalse);
      });

      testWidgets('no focus ring after focusing it with a touch',
          (tester) async {
        final focusNode = FocusNode();
        addTearDown(focusNode.dispose);
        await _pump(
          tester,
          ImpaktfullUiTouchFeedback(
            onTap: focusNode.requestFocus,
            focusNode: focusNode,
            child: _child,
          ),
        );

        await tester.tap(find.text('Child'));
        await tester.pumpAndSettle();
        expect(focusNode.hasFocus, isTrue);
        expect(_focusFeedback(tester).hasFocus, isFalse);

        // Switching to the keyboard shows the ring.
        await tester.sendKeyEvent(LogicalKeyboardKey.shiftLeft);
        await tester.pumpAndSettle();
        expect(_focusFeedback(tester).hasFocus, isTrue);
      });
    });
  });

  group('ImpaktfullUiHoverFeedback', () {
    testWidgets('builds with the hover state of the mouse', (tester) async {
      final states = <bool>[];
      await _pump(
        tester,
        ImpaktfullUiHoverFeedback(
          builder: (context, isHovered) {
            states.add(isHovered);
            return const SizedBox(width: 100, height: 40);
          },
        ),
      );
      expect(states.last, isFalse);

      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);
      await gesture.moveTo(tester.getCenter(find.byType(SizedBox).last));
      await tester.pumpAndSettle();
      expect(states.last, isTrue);

      await gesture.moveTo(Offset.zero);
      await tester.pumpAndSettle();
      expect(states.last, isFalse);
    });

    testWidgets('uses the cursor', (tester) async {
      await _pump(
        tester,
        ImpaktfullUiHoverFeedback(
          cursor: SystemMouseCursors.help,
          builder: (context, isHovered) =>
              const SizedBox(width: 100, height: 40),
        ),
      );
      final region = tester.widget<MouseRegion>(
        find
            .descendant(
              of: find.byType(ImpaktfullUiHoverFeedback),
              matching: find.byType(MouseRegion),
            )
            .first,
      );
      expect(region.cursor, SystemMouseCursors.help);
    });
  });

  group('ImpaktfullUiTouchFeedbackSequence', () {
    Future<List<int>> pumpSequence(
      WidgetTester tester, {
      int requiredTaps = 2,
    }) async {
      final calls = <int>[];
      await _pump(
        tester,
        ImpaktfullUiTouchFeedbackSequence(
          requiredTaps: requiredTaps,
          onTap: () => calls.add(1),
          child: _child,
        ),
      );
      return calls;
    }

    Future<void> tap(WidgetTester tester) async {
      // The child ignores the pointer events by default.
      await tester.tap(find.text('Child'), warnIfMissed: false);
      await tester.pump(const Duration(milliseconds: 100));
    }

    testWidgets('calls onTap after the required taps', (tester) async {
      final calls = await pumpSequence(tester);

      await tap(tester);
      expect(calls, isEmpty);
      await tap(tester);
      expect(calls, hasLength(1));
    });

    testWidgets('counts again after onTap was called', (tester) async {
      final calls = await pumpSequence(tester, requiredTaps: 3);

      for (var i = 0; i < 5; i++) {
        await tap(tester);
      }
      expect(calls, hasLength(1));
      await tap(tester);
      expect(calls, hasLength(2));
    });

    testWidgets('resets the count after a second without taps', (tester) async {
      final calls = await pumpSequence(tester);

      await tap(tester);
      await tester.pump(const Duration(seconds: 1));
      await tap(tester);
      expect(calls, isEmpty);
      await tap(tester);
      expect(calls, hasLength(1));
    });

    testWidgets('the child does not get the taps by default', (tester) async {
      var childTaps = 0;
      await _pump(
        tester,
        ImpaktfullUiTouchFeedbackSequence(
          onTap: () {},
          child: GestureDetector(
            onTap: () => childTaps++,
            child: _child,
          ),
        ),
      );

      await tap(tester);
      await tester.pump(const Duration(seconds: 1));
      expect(childTaps, 0);
    });

    testWidgets('the child gets the taps with ignoreChildPointerEvents false',
        (tester) async {
      var childTaps = 0;
      await _pump(
        tester,
        ImpaktfullUiTouchFeedbackSequence(
          onTap: () {},
          ignoreChildPointerEvents: false,
          child: GestureDetector(
            onTap: () => childTaps++,
            child: _child,
          ),
        ),
      );

      await tap(tester);
      await tester.pump(const Duration(seconds: 1));
      expect(childTaps, 1);
    });

    test('requires at least 2 taps', () {
      expect(
        () => ImpaktfullUiTouchFeedbackSequence(
          requiredTaps: 1,
          onTap: () {},
          child: _child,
        ),
        throwsAssertionError,
      );
    });
  });
}
