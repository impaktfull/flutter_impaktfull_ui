import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

void main() {
  Future<void> pump(WidgetTester tester, ImpaktfullUiWrap wrap) =>
      tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Align(
          alignment: Alignment.topLeft,
          child: SizedBox(width: 100, child: wrap),
        ),
      ));

  List<Widget> children() => [
        for (var i = 0; i < 4; i++)
          SizedBox(width: 40, height: 10, key: Key('$i')),
      ];

  Offset topLeft(WidgetTester tester, int index) =>
      tester.getTopLeft(find.byKey(Key('$index')));

  testWidgets('passes the spacing to the Wrap', (tester) async {
    await pump(
      tester,
      ImpaktfullUiWrap(spacing: 4, runSpacing: 6, children: children()),
    );
    final wrap = tester.widget<Wrap>(find.byType(Wrap));
    expect(wrap.spacing, 4);
    expect(wrap.runSpacing, 6);
    expect(wrap.direction, Axis.horizontal);
    expect(wrap.children.length, 4);
  });

  testWidgets('no spacing by default', (tester) async {
    await pump(tester, ImpaktfullUiWrap(children: children()));
    expect(topLeft(tester, 0), Offset.zero);
    expect(topLeft(tester, 1), const Offset(40, 0));
    // 3 * 40 > 100: the third child starts a new run.
    expect(topLeft(tester, 2), const Offset(0, 10));
    expect(topLeft(tester, 3), const Offset(40, 10));
  });

  testWidgets('spacing and runSpacing', (tester) async {
    await pump(
      tester,
      ImpaktfullUiWrap(spacing: 20, runSpacing: 5, children: children()),
    );
    expect(topLeft(tester, 0), Offset.zero);
    // 40 + 20 + 40 = 100 fits.
    expect(topLeft(tester, 1), const Offset(60, 0));
    expect(topLeft(tester, 2), const Offset(0, 15));
    expect(topLeft(tester, 3), const Offset(60, 15));
  });

  testWidgets('spacing that does not fit starts a new run', (tester) async {
    await pump(
      tester,
      ImpaktfullUiWrap(spacing: 21, children: children()),
    );
    // 40 + 21 + 40 > 100: every child has its own run.
    for (var i = 0; i < 4; i++) {
      expect(topLeft(tester, i), Offset(0, i * 10.0));
    }
  });
}
