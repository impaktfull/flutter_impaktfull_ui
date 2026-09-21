import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

Future<void> _pump(WidgetTester tester, Widget child) => tester.pumpWidget(
      ImpaktfullUiApp(
        showDebugFlag: false,
        title: 'test',
        home: child,
      ),
    );

void main() {
  testWidgets('does not block taps on the widgets below', (tester) async {
    var taps = 0;
    await _pump(
      tester,
      Stack(
        children: [
          Center(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => taps++,
              child: const SizedBox(
                key: ValueKey('target'),
                width: 100,
                height: 100,
              ),
            ),
          ),
          const Positioned.fill(
            child: ImpaktfullUiConfetti(type: ImpaktfullUiConfettiType.circle),
          ),
        ],
      ),
    );
    await tester.pump(const Duration(milliseconds: 200));

    await tester.tapAt(tester.getCenter(find.byKey(const ValueKey('target'))));
    expect(taps, 1);

    await _pump(tester, const SizedBox());
  });

  testWidgets('removing it during the initial delay does not throw',
      (tester) async {
    await _pump(
      tester,
      const ImpaktfullUiConfetti(
        type: ImpaktfullUiConfettiType.circle,
        initialDelay: Duration(seconds: 1),
      ),
    );
    await tester.pump(const Duration(milliseconds: 200));

    await _pump(tester, const SizedBox());
    await tester.pump(const Duration(seconds: 2));
    expect(tester.takeException(), isNull);
  });

  testWidgets('removing it right after a resize leaves no pending timer',
      (tester) async {
    await _pump(
      tester,
      const ImpaktfullUiConfetti(type: ImpaktfullUiConfettiType.circle),
    );
    // Flush the zero initial delay, the resize debounce timer is still pending.
    await tester.pump(const Duration(milliseconds: 10));

    await _pump(tester, const SizedBox());
    // The test framework fails the test when a timer is still pending.
  });
}
