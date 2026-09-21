import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

void main() {
  const child = Key('child');

  Future<Rect> pump(
    WidgetTester tester, {
    double width = 400,
    double widthFactor = 1,
    double? minWidth,
    double? maxWidth,
    Alignment alignment = Alignment.center,
  }) async {
    await tester.pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: width,
          height: 50,
          child: ImpaktfullUiClampedFractionallySizedBox(
            widthFactor: widthFactor,
            minWidth: minWidth,
            maxWidth: maxWidth,
            alignment: alignment,
            child: const SizedBox.expand(key: child),
          ),
        ),
      ),
    ));
    return tester.getRect(find.byKey(child));
  }

  testWidgets('full width by default', (tester) async {
    expect((await pump(tester)).width, 400);
  });

  testWidgets('uses the width factor', (tester) async {
    final rect = await pump(tester, widthFactor: 0.25);
    expect(rect.width, 100);
    // Centered by default.
    expect(rect.left, 150);
  });

  testWidgets('clamps to the min width', (tester) async {
    expect((await pump(tester, widthFactor: 0.1, minWidth: 200)).width, 200);
  });

  testWidgets('clamps to the max width', (tester) async {
    expect((await pump(tester, widthFactor: 0.9, maxWidth: 150)).width, 150);
  });

  testWidgets('a min width bigger than the available width fits',
      (tester) async {
    final rect = await pump(tester, width: 300, minWidth: 500);
    expect(rect.width, 300);
    expect(tester.takeException(), isNull);
  });

  testWidgets('uses the alignment', (tester) async {
    final start = await pump(
      tester,
      widthFactor: 0.5,
      alignment: Alignment.centerLeft,
    );
    expect(start.left, 0);
    final end = await pump(
      tester,
      widthFactor: 0.5,
      alignment: Alignment.centerRight,
    );
    expect(end.right, 400);
  });

  testWidgets('follows the available width', (tester) async {
    expect((await pump(tester, width: 200, widthFactor: 0.5)).width, 100);
    expect((await pump(tester, width: 600, widthFactor: 0.5)).width, 300);
  });
}
