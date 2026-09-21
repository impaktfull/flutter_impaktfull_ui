import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

// The borders are tested in container_test.dart.
void main() {
  const child = Key('child');

  Future<void> pump(WidgetTester tester, ImpaktfullUiContainer container) =>
      tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Align(alignment: Alignment.topLeft, child: container),
      ));

  testWidgets('applies the margin outside and the padding inside',
      (tester) async {
    await pump(
      tester,
      const ImpaktfullUiContainer(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(5),
        child: SizedBox(width: 20, height: 20, key: child),
      ),
    );
    expect(
        tester.getRect(find.byKey(child)), const Rect.fromLTWH(15, 15, 20, 20));
    expect(
      tester.getSize(find.byType(ImpaktfullUiContainer)),
      const Size(50, 50),
    );
  });

  testWidgets('uses the width and height', (tester) async {
    await pump(
      tester,
      const ImpaktfullUiContainer(
        width: 100,
        height: 40,
        child: SizedBox.expand(key: child),
      ),
    );
    expect(tester.getSize(find.byKey(child)), const Size(100, 40));
  });

  testWidgets('transparent by default', (tester) async {
    await pump(tester, const ImpaktfullUiContainer(child: SizedBox()));
    expect(tester.widget<Material>(find.byType(Material)).color,
        Colors.transparent);
  });

  testWidgets('uses the color, shadow and border radius', (tester) async {
    const shadow = [BoxShadow(color: Colors.black, blurRadius: 4)];
    final borderRadius = BorderRadius.circular(8);
    await pump(
      tester,
      ImpaktfullUiContainer(
        color: Colors.red,
        shadow: shadow,
        borderRadius: borderRadius,
        child: const SizedBox(),
      ),
    );
    final material = tester.widget<Material>(find.byType(Material));
    expect(material.color, Colors.red);
    expect(material.borderRadius, borderRadius);
    final decoration = tester
        .widget<Container>(find.descendant(
          of: find.byType(ImpaktfullUiContainer),
          matching: find.byType(Container),
        ))
        .decoration as BoxDecoration;
    expect(decoration.boxShadow, shadow);
    expect(decoration.borderRadius, borderRadius);
  });

  testWidgets('taps reach the child', (tester) async {
    var taps = 0;
    await pump(
      tester,
      ImpaktfullUiContainer(
        color: Colors.red,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => taps++,
          child: const SizedBox(width: 20, height: 20, key: child),
        ),
      ),
    );
    await tester.tap(find.byKey(child));
    expect(taps, 1);
  });

  testWidgets('non uniform colors with a borderRadius', (tester) async {
    await pump(
      tester,
      ImpaktfullUiContainer(
        borderRadius: BorderRadius.circular(8),
        border: const Border(
          top: BorderSide(color: Colors.red),
          bottom: BorderSide(color: Colors.blue),
        ),
        child: const SizedBox(width: 10, height: 10),
      ),
    );
    expect(tester.takeException(), isNull);
    // The border is drawn with square corners, the background keeps the
    // border radius.
    final foreground = tester
        .widget<Container>(find.descendant(
          of: find.byType(ImpaktfullUiContainer),
          matching: find.byType(Container),
        ))
        .foregroundDecoration as BoxDecoration;
    expect(foreground.borderRadius, isNull);
    expect(
      tester.widget<Material>(find.byType(Material)).borderRadius,
      BorderRadius.circular(8),
    );
  });

  testWidgets('non uniform widths with one color keep the border radius',
      (tester) async {
    final borderRadius = BorderRadius.circular(8);
    await pump(
      tester,
      ImpaktfullUiContainer(
        borderRadius: borderRadius,
        border: const Border(
          top: BorderSide(color: Colors.red),
          bottom: BorderSide(color: Colors.red, width: 3),
        ),
        child: const SizedBox(width: 10, height: 10),
      ),
    );
    expect(tester.takeException(), isNull);
    final foreground = tester
        .widget<Container>(find.descendant(
          of: find.byType(ImpaktfullUiContainer),
          matching: find.byType(Container),
        ))
        .foregroundDecoration as BoxDecoration;
    expect(foreground.borderRadius, borderRadius);
  });
}
