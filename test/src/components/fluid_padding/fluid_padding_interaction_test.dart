import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../_layout_test_helpers.dart';

void main() {
  const child = Key('child');

  Future<Rect> pumpPadding(
    WidgetTester tester,
    double width, {
    List<ImpaktfullUiFluidPaddingBreakPoint>? breakPoints,
    double topPadding = 0,
    double bottomPadding = 0,
  }) async {
    await pumpLayoutApp(
      tester,
      Align(
        alignment: Alignment.topLeft,
        child: ImpaktfullUiFluidPadding(
          breakPoints: breakPoints,
          topPadding: topPadding,
          bottomPadding: bottomPadding,
          child: const SizedBox(width: double.infinity, height: 10, key: child),
        ),
      ),
      size: Size(width, 800),
    );
    return tester.getRect(find.byKey(child));
  }

  // Default theme: mobile < 600: 16, tablet 600-1024: 16-64,
  // desktop 1024-1400: 64-128, large desktop 1400-2000: 128-256,
  // ultra wide >= 2000: 256.
  final defaultCases = <double, double>{
    400: 16,
    599: 16,
    600: 16,
    812: 40,
    1024: 64,
    1212: 96,
    1400: 128,
    1700: 192,
    2000: 256,
    2500: 256,
  };
  for (final entry in defaultCases.entries) {
    testWidgets('default padding at width ${entry.key}', (tester) async {
      final rect = await pumpPadding(tester, entry.key);
      expect(rect.left, moreOrLessEquals(entry.value, epsilon: 0.001));
      expect(
        entry.key - rect.right,
        moreOrLessEquals(entry.value, epsilon: 0.001),
      );
    });
  }

  testWidgets('adds the top and bottom padding', (tester) async {
    await pumpPadding(tester, 400, topPadding: 12, bottomPadding: 20);
    expect(tester.getRect(find.byKey(child)).top, 12);
    expect(
      tester.getSize(find.byType(ImpaktfullUiFluidPadding)).height,
      12 + 10 + 20,
    );
  });

  testWidgets('without a matching breakpoint there is no padding',
      (tester) async {
    final rect = await pumpPadding(
      tester,
      400,
      topPadding: 12,
      breakPoints: const [
        ImpaktfullUiFluidPaddingBreakPoint(minWidth: 1000, padding: 50),
      ],
    );
    // The top padding is ignored as well.
    expect(rect, const Rect.fromLTWH(0, 0, 400, 10));
  });

  testWidgets('the first matching breakpoint wins', (tester) async {
    final rect = await pumpPadding(
      tester,
      400,
      breakPoints: const [
        ImpaktfullUiFluidPaddingBreakPoint(maxWidth: 500, padding: 10),
        ImpaktfullUiFluidPaddingBreakPoint(maxWidth: 1000, padding: 20),
      ],
    );
    expect(rect.left, 10);
  });

  group('ImpaktfullUiFluidPaddingBreakPoint', () {
    test('matchesWidth', () {
      const both = ImpaktfullUiFluidPaddingBreakPoint(
        minWidth: 100,
        maxWidth: 200,
      );
      expect(both.matchesWidth(99), isFalse);
      expect(both.matchesWidth(100), isTrue);
      expect(both.matchesWidth(199), isTrue);
      expect(both.matchesWidth(200), isFalse);
      const onlyMax = ImpaktfullUiFluidPaddingBreakPoint(maxWidth: 200);
      expect(onlyMax.matchesWidth(0), isTrue);
      expect(onlyMax.matchesWidth(200), isFalse);
      const onlyMin = ImpaktfullUiFluidPaddingBreakPoint(minWidth: 100);
      expect(onlyMin.matchesWidth(99), isFalse);
      expect(onlyMin.matchesWidth(10000), isTrue);
      const none = ImpaktfullUiFluidPaddingBreakPoint();
      expect(none.matchesWidth(100), isFalse);
    });

    test('getPadding', () {
      const fixed = ImpaktfullUiFluidPaddingBreakPoint(
        padding: 10,
        paddingMin: 20,
        paddingMax: 30,
      );
      expect(fixed.getPadding(0), 10);
      const fluid = ImpaktfullUiFluidPaddingBreakPoint(
        minWidth: 100,
        maxWidth: 200,
        paddingMin: 10,
        paddingMax: 20,
      );
      expect(fluid.getPadding(50), 10);
      expect(fluid.getPadding(100), 10);
      expect(fluid.getPadding(150), 15);
      expect(fluid.getPadding(200), 20);
      expect(fluid.getPadding(300), 20);
      expect(
        const ImpaktfullUiFluidPaddingBreakPoint().getPadding(100),
        isNull,
      );
      expect(
        const ImpaktfullUiFluidPaddingBreakPoint(paddingMax: 5).getPadding(1),
        5,
      );
      expect(
        const ImpaktfullUiFluidPaddingBreakPoint(paddingMin: 5).getPadding(1),
        5,
      );
      // Without a width range the minimum padding is used.
      expect(
        const ImpaktfullUiFluidPaddingBreakPoint(
          minWidth: 100,
          paddingMin: 5,
          paddingMax: 50,
        ).getPadding(1000),
        5,
      );
    });
  });
}
