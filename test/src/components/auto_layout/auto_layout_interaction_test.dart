import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

// The Wrap mapping is tested in auto_layout_test.dart.
void main() {
  Future<void> pump(WidgetTester tester, Widget child) =>
      tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Align(alignment: Alignment.topLeft, child: child),
      ));

  Rect rect(WidgetTester tester, String key) =>
      tester.getRect(find.byKey(Key(key)));

  const children = [
    SizedBox(width: 10, height: 10, key: Key('a')),
    SizedBox(width: 20, height: 20, key: Key('b')),
    SizedBox(width: 30, height: 30, key: Key('c')),
  ];

  testWidgets('horizontal spacing between the children', (tester) async {
    await pump(
      tester,
      const ImpaktfullUiAutoLayout.horizontal(
        spacing: 5,
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
    expect(rect(tester, 'a'), const Rect.fromLTWH(0, 0, 10, 10));
    expect(rect(tester, 'b'), const Rect.fromLTWH(15, 0, 20, 20));
    expect(rect(tester, 'c'), const Rect.fromLTWH(40, 0, 30, 30));
    // No spacing before the first or after the last child.
    expect(
      tester.getSize(find.byType(ImpaktfullUiAutoLayout)),
      const Size(70, 30),
    );
  });

  testWidgets('vertical spacing between the children', (tester) async {
    await pump(
      tester,
      const ImpaktfullUiAutoLayout.vertical(
        spacing: 5,
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
    expect(rect(tester, 'a'), const Rect.fromLTWH(0, 0, 10, 10));
    expect(rect(tester, 'b'), const Rect.fromLTWH(0, 15, 20, 20));
    expect(rect(tester, 'c'), const Rect.fromLTWH(0, 40, 30, 30));
    expect(
      tester.getSize(find.byType(ImpaktfullUiAutoLayout)),
      const Size(30, 70),
    );
  });

  testWidgets('the default constructor uses the orientation', (tester) async {
    await pump(
      tester,
      const ImpaktfullUiAutoLayout(
        orientation: ImpaktfullUiAutoLayoutOrientation.vertical,
        spacing: 5,
        children: children,
      ),
    );
    expect(find.byType(Column), findsOneWidget);
    expect(rect(tester, 'b').top, 15);
  });

  testWidgets('the cross axis starts at the start by default', (tester) async {
    await pump(
      tester,
      const SizedBox(
        width: 100,
        height: 100,
        child: ImpaktfullUiAutoLayout.horizontal(children: children),
      ),
    );
    expect(rect(tester, 'a').top, 0);
    expect(rect(tester, 'c').top, 0);
  });

  testWidgets('passes the alignments to the row', (tester) async {
    await pump(
      tester,
      const SizedBox(
        width: 100,
        height: 100,
        child: ImpaktfullUiAutoLayout.horizontal(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      ),
    );
    expect(rect(tester, 'c').right, 100);
    expect(rect(tester, 'b').right, 100 - 30 - 5);
    expect(rect(tester, 'a').center.dy, 50);
  });

  testWidgets('spaceBetween with spacing', (tester) async {
    await pump(
      tester,
      const SizedBox(
        width: 100,
        child: ImpaktfullUiAutoLayout.horizontal(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
    expect(rect(tester, 'a').left, 0);
    expect(rect(tester, 'c').right, 100);
    // The spacing is the minimum: (100 - 60 - 10) / 4 extra between each.
    expect(rect(tester, 'b').left - rect(tester, 'a').right, greaterThan(5));
  });

  testWidgets('no spacer for a single child or no children', (tester) async {
    await pump(
      tester,
      const ImpaktfullUiAutoLayout.horizontal(
        spacing: 10,
        children: [SizedBox()],
      ),
    );
    expect(tester.widget<Row>(find.byType(Row)).children.length, 1);

    await pump(
      tester,
      const ImpaktfullUiAutoLayout.vertical(spacing: 10, children: []),
    );
    expect(tester.widget<Column>(find.byType(Column)).children, isEmpty);
  });

  testWidgets('mainAxisSize max takes the available space', (tester) async {
    await pump(
      tester,
      const SizedBox(
        width: 100,
        child: ImpaktfullUiAutoLayout.horizontal(children: children),
      ),
    );
    expect(tester.getSize(find.byType(ImpaktfullUiAutoLayout)).width, 100);
  });

  testWidgets('vertical wrap starts a new column', (tester) async {
    await pump(
      tester,
      const SizedBox(
        height: 45,
        child: ImpaktfullUiAutoLayout.vertical(
          wrap: true,
          spacing: 5,
          children: children,
        ),
      ),
    );
    expect(rect(tester, 'a'), const Rect.fromLTWH(0, 0, 10, 10));
    expect(rect(tester, 'b'), const Rect.fromLTWH(0, 15, 20, 20));
    // 15 + 20 + 5 + 30 > 45: the third child starts the next run.
    expect(rect(tester, 'c'), const Rect.fromLTWH(25, 0, 30, 30));
  });
}
