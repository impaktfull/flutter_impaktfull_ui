import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../_layout_test_helpers.dart';

void main() {
  const center = Key('center');

  // Default theme: 16 padding, 50% of the width, clamped between 500 and 700.
  final widthCases = <double, double>{
    400: 400 - 32, // min width 500 does not fit
    1100: (1100 - 32) * 0.5,
    largeScreenSize.width: 700,
  };
  for (final entry in widthCases.entries) {
    testWidgets('center width at screen width ${entry.key}', (tester) async {
      await pumpLayoutApp(
        tester,
        const ImpaktfullUiUnifiedScreenLayout(
          centerChild:
              SizedBox(width: double.infinity, height: 10, key: center),
        ),
        size: Size(entry.key, 800),
      );
      final rect = tester.getRect(find.byKey(center));
      expect(rect.width, entry.value);
      // Horizontally centered.
      expect(rect.center.dx, entry.key / 2);
    });
  }

  testWidgets('top and bottom builders share the remaining height',
      (tester) async {
    await pumpLayoutApp(
      tester,
      ImpaktfullUiUnifiedScreenLayout(
        topBuilder: (context) => const SizedBox.expand(key: Key('top')),
        bottomBuilder: (context) => const SizedBox.expand(key: Key('bottom')),
        centerChild:
            const SizedBox(width: double.infinity, height: 100, key: center),
      ),
    );
    final top = tester.getRect(find.byKey(const Key('top')));
    final middle = tester.getRect(find.byKey(center));
    final bottom = tester.getRect(find.byKey(const Key('bottom')));
    expect(top.height, bottom.height);
    expect(top.top, 16);
    expect(middle.top, top.bottom);
    expect(bottom.top, middle.bottom);
    expect(bottom.bottom, smallScreenSize.height - 16);
  });

  testWidgets('start and end builders are next to the center', (tester) async {
    await pumpLayoutApp(
      tester,
      ImpaktfullUiUnifiedScreenLayout(
        startBuilder: (context) => const SizedBox(width: 50, key: Key('start')),
        endBuilder: (context) => const SizedBox(width: 60, key: Key('end')),
        centerChild:
            const SizedBox(width: double.infinity, height: 10, key: center),
      ),
    );
    final start = tester.getRect(find.byKey(const Key('start')));
    final end = tester.getRect(find.byKey(const Key('end')));
    final middle = tester.getRect(find.byKey(center));
    expect(start.left, 0);
    expect(end.right, smallScreenSize.width);
    expect(middle.left, 50 + 16);
    expect(middle.right, smallScreenSize.width - 60 - 16);
  });

  testWidgets('start and end builders can return null', (tester) async {
    await pumpLayoutApp(
      tester,
      ImpaktfullUiUnifiedScreenLayout(
        startBuilder: (context) => null,
        endBuilder: (context) => null,
        centerChild:
            const SizedBox(width: double.infinity, height: 10, key: center),
      ),
    );
    expect(tester.getRect(find.byKey(center)).left, 16);
  });

  testWidgets('adds the safe area to the padding', (tester) async {
    await pumpLayoutApp(
      tester,
      Builder(
        builder: (context) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
            padding: const EdgeInsets.only(top: 40, bottom: 30),
          ),
          child: const ImpaktfullUiUnifiedScreenLayout(
            alignment: Alignment.topCenter,
            centerChild:
                SizedBox(width: double.infinity, height: 10, key: center),
          ),
        ),
      ),
    );
    expect(tester.getRect(find.byKey(center)).top, 16 + 40);
  });
}
