import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

void main() {
  Future<Wrap> pumpWrap(
    WidgetTester tester,
    ImpaktfullUiAutoLayout autoLayout,
  ) async {
    await tester.pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: Align(
        alignment: Alignment.topLeft,
        child: SizedBox(width: 100, height: 100, child: autoLayout),
      ),
    ));
    return tester.widget<Wrap>(find.byType(Wrap));
  }

  testWidgets('wrap uses Wrap spacing instead of spacer children',
      (tester) async {
    final wrap = await pumpWrap(
      tester,
      const ImpaktfullUiAutoLayout.horizontal(
        wrap: true,
        spacing: 10,
        children: [
          SizedBox(width: 45, height: 10, key: Key('0')),
          SizedBox(width: 45, height: 10, key: Key('1')),
          SizedBox(width: 45, height: 10, key: Key('2')),
        ],
      ),
    );
    expect(wrap.children.length, 3);
    expect(wrap.direction, Axis.horizontal);
    expect(wrap.spacing, 10);
    expect(wrap.runSpacing, 10);

    // 45 + 10 + 45 = 100: the first run holds 2 children, the next run
    // starts with the third child (not with a spacer).
    expect(tester.getTopLeft(find.byKey(const Key('0'))), Offset.zero);
    expect(tester.getTopLeft(find.byKey(const Key('1'))), const Offset(55, 0));
    expect(tester.getTopLeft(find.byKey(const Key('2'))), const Offset(0, 20));
  });

  testWidgets('vertical wrap', (tester) async {
    final wrap = await pumpWrap(
      tester,
      const ImpaktfullUiAutoLayout.vertical(
        wrap: true,
        spacing: 4,
        children: [SizedBox(), SizedBox()],
      ),
    );
    expect(wrap.children.length, 2);
    expect(wrap.direction, Axis.vertical);
    expect(wrap.spacing, 4);
    expect(wrap.runSpacing, 4);
  });

  const mainAxisCases = <MainAxisAlignment, WrapAlignment>{
    MainAxisAlignment.start: WrapAlignment.start,
    MainAxisAlignment.end: WrapAlignment.end,
    MainAxisAlignment.center: WrapAlignment.center,
    MainAxisAlignment.spaceBetween: WrapAlignment.spaceBetween,
    MainAxisAlignment.spaceAround: WrapAlignment.spaceAround,
    MainAxisAlignment.spaceEvenly: WrapAlignment.spaceEvenly,
  };
  for (final entry in mainAxisCases.entries) {
    testWidgets('wrap mainAxisAlignment ${entry.key.name}', (tester) async {
      final wrap = await pumpWrap(
        tester,
        ImpaktfullUiAutoLayout.horizontal(
          wrap: true,
          mainAxisAlignment: entry.key,
          children: const [SizedBox()],
        ),
      );
      expect(wrap.alignment, entry.value);
    });
  }

  const crossAxisCases = <CrossAxisAlignment, WrapCrossAlignment>{
    CrossAxisAlignment.start: WrapCrossAlignment.start,
    CrossAxisAlignment.end: WrapCrossAlignment.end,
    CrossAxisAlignment.center: WrapCrossAlignment.center,
    CrossAxisAlignment.stretch: WrapCrossAlignment.start,
    CrossAxisAlignment.baseline: WrapCrossAlignment.start,
  };
  for (final entry in crossAxisCases.entries) {
    testWidgets('wrap crossAxisAlignment ${entry.key.name}', (tester) async {
      final wrap = await pumpWrap(
        tester,
        ImpaktfullUiAutoLayout.horizontal(
          wrap: true,
          crossAxisAlignment: entry.key,
          children: const [SizedBox()],
        ),
      );
      expect(wrap.crossAxisAlignment, entry.value);
    });
  }

  testWidgets('row keeps spacer children', (tester) async {
    await tester.pumpWidget(const Directionality(
      textDirection: TextDirection.ltr,
      child: ImpaktfullUiAutoLayout.horizontal(
        spacing: 10,
        children: [SizedBox(), SizedBox(), SizedBox()],
      ),
    ));
    expect(tester.widget<Row>(find.byType(Row)).children.length, 5);
  });
}
