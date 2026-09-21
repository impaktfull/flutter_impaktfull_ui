import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/src/components/container/container.dart';

void main() {
  Future<void> pump(WidgetTester tester, ImpaktfullUiContainer container) =>
      tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Center(child: container),
      ));

  Material material(WidgetTester tester) =>
      tester.widget<Material>(find.descendant(
          of: find.byType(ImpaktfullUiContainer),
          matching: find.byType(Material)));

  Container container(WidgetTester tester) =>
      tester.widget<Container>(find.descendant(
          of: find.byType(ImpaktfullUiContainer),
          matching: find.byType(Container)));

  testWidgets('border without borderRadius is drawn', (tester) async {
    final border = Border.all(color: Colors.red, width: 2);
    await pump(
      tester,
      ImpaktfullUiContainer(
        border: border,
        child: const SizedBox(width: 10, height: 10),
      ),
    );
    final shape = material(tester).shape as RoundedRectangleBorder;
    expect(shape.side, border.top);
    expect(shape.borderRadius, BorderRadius.zero);
    expect(tester.takeException(), isNull);
  });

  testWidgets('uniform border with borderRadius', (tester) async {
    final border = Border.all(color: Colors.red, width: 2);
    const borderRadius = BorderRadius.all(Radius.circular(8));
    await pump(
      tester,
      ImpaktfullUiContainer(
        border: border,
        borderRadius: borderRadius,
        child: const SizedBox(width: 10, height: 10),
      ),
    );
    final shape = material(tester).shape as RoundedRectangleBorder;
    expect(shape.side, border.top);
    expect(shape.borderRadius, borderRadius);
    expect(container(tester).foregroundDecoration, isNull);
  });

  testWidgets('non uniform border keeps every side', (tester) async {
    const border = Border(
      top: BorderSide(color: Colors.red, width: 1),
      bottom: BorderSide(color: Colors.red, width: 3),
    );
    const borderRadius = BorderRadius.all(Radius.circular(8));
    await pump(
      tester,
      const ImpaktfullUiContainer(
        border: border,
        borderRadius: borderRadius,
        child: SizedBox(width: 10, height: 10),
      ),
    );
    expect(material(tester).shape, isNull);
    expect(material(tester).borderRadius, borderRadius);
    final foreground = container(tester).foregroundDecoration as BoxDecoration;
    expect(foreground.border, border);
    expect(foreground.borderRadius, borderRadius);
    expect(tester.takeException(), isNull);
  });

  testWidgets('no border', (tester) async {
    const borderRadius = BorderRadius.all(Radius.circular(8));
    await pump(
      tester,
      const ImpaktfullUiContainer(
        borderRadius: borderRadius,
        child: SizedBox(width: 10, height: 10),
      ),
    );
    expect(material(tester).shape, isNull);
    expect(material(tester).borderRadius, borderRadius);
    expect(container(tester).foregroundDecoration, isNull);
  });
}
