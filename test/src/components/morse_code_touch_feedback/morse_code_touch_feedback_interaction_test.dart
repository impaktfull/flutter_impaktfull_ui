import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

const _child = SizedBox(width: 100, height: 100, child: Text('Child'));

/// The widget measures the presses with the real clock (not the fake clock of
/// the test): use a long "short duration" so a busy machine can not turn a
/// dot into a dash.
const _shortDuration = Duration(seconds: 1);

Future<List<int>> _pump(
  WidgetTester tester, {
  required String text,
  Widget child = _child,
  bool ignoreChildPointerEvents = true,
}) async {
  final calls = <int>[];
  await pumpAndSettleComponent(
    tester,
    Center(
      child: ImpaktfullUiMorseCodeTouchFeedback(
        text: text,
        ignoreChildPointerEvents: ignoreChildPointerEvents,
        shortDuration: _shortDuration,
        onTap: () => calls.add(1),
        child: child,
      ),
    ),
  );
  return calls;
}

/// A short press (a dot).
Future<void> _dot(WidgetTester tester) async {
  await tester.tap(find.text('Child'), warnIfMissed: false);
  await tester.pump(const Duration(milliseconds: 50));
}

/// A long press (a dash): hold the pointer down in real time.
Future<void> _dash(WidgetTester tester) async {
  final gesture = await tester.startGesture(
    tester.getCenter(find.byType(ImpaktfullUiMorseCodeTouchFeedback)),
  );
  await tester.runAsync(
    () => Future<void>.delayed(_shortDuration * 1.2),
  );
  await gesture.up();
  await tester.pump(const Duration(milliseconds: 50));
}

void main() {
  testWidgets('a matching code of dots calls onTap', (tester) async {
    // s = ...
    final calls = await _pump(tester, text: 's');

    await _dot(tester);
    await _dot(tester);
    expect(calls, isEmpty);
    await _dot(tester);
    expect(calls, hasLength(1));
  });

  testWidgets('a code with dots and dashes calls onTap', (tester) async {
    // a = .-
    final calls = await _pump(tester, text: 'A');

    await _dot(tester);
    await _dash(tester);
    expect(calls, hasLength(1));
  });

  testWidgets('a wrong code does not call onTap', (tester) async {
    // a = .-
    final calls = await _pump(tester, text: 'a');

    await _dash(tester);
    await _dot(tester);
    expect(calls, isEmpty);
  });

  testWidgets('starts over after a wrong code', (tester) async {
    // n = -.
    final calls = await _pump(tester, text: 'n');

    // Wrong: 2 dots.
    await _dot(tester);
    await _dot(tester);
    // Right
    await _dash(tester);
    await _dot(tester);
    expect(calls, hasLength(1));
  });

  testWidgets('forgets the taps after a second without taps', (tester) async {
    // i = ..
    final calls = await _pump(tester, text: 'i');

    await _dot(tester);
    await tester.pump(const Duration(seconds: 1));
    await _dot(tester);
    expect(calls, isEmpty);
    await _dot(tester);
    expect(calls, hasLength(1));
  });

  testWidgets('the child does not get the taps by default', (tester) async {
    var childTaps = 0;
    await _pump(
      tester,
      text: 'e',
      child: GestureDetector(onTap: () => childTaps++, child: _child),
    );

    await _dot(tester);
    await tester.pump(const Duration(seconds: 1));
    expect(childTaps, 0);
  });

  testWidgets('the child gets the taps with ignoreChildPointerEvents false',
      (tester) async {
    var childTaps = 0;
    await _pump(
      tester,
      text: 'e',
      ignoreChildPointerEvents: false,
      child: GestureDetector(onTap: () => childTaps++, child: _child),
    );

    await _dot(tester);
    await tester.pump(const Duration(seconds: 1));
    expect(childTaps, 1);
  });
}
