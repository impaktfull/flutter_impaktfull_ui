import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_inputs_test_helpers.dart';

void main() {
  const width = 400.0;

  Widget wrap(Widget child) =>
      Center(child: SizedBox(width: width, child: child));

  double activeTrackFactor(WidgetTester tester) => tester
      .widget<FractionallySizedBox>(find.descendant(
        of: find.byType(ImpaktfullUiSlider),
        matching: find.byType(FractionallySizedBox),
      ))
      .widthFactor!;

  Offset atFraction(WidgetTester tester, double fraction) {
    final topLeft = tester.getTopLeft(find.byType(ImpaktfullUiSlider));
    final size = tester.getSize(find.byType(ImpaktfullUiSlider));
    return Offset(topLeft.dx + size.width * fraction, topLeft.dy + 24);
  }

  testWidgets('tapping emits the value at the tapped position', (tester) async {
    final values = <double>[];
    await pumpAndSettleComponent(
      tester,
      wrap(ImpaktfullUiSlider(
        value: 0,
        min: 10,
        max: 20,
        onChanged: values.add,
      )),
    );
    await tester.tapAt(atFraction(tester, 0.25));
    await tester.pump();
    expect(values.single, closeTo(12.5, 0.01));
  });

  testWidgets('dragging emits values within min and max', (tester) async {
    final values = <double>[];
    await pumpAndSettleComponent(
      tester,
      wrap(ImpaktfullUiSlider(
        value: 50,
        min: 0,
        max: 100,
        onChanged: values.add,
      )),
    );
    final gesture = await tester.startGesture(atFraction(tester, 0.5));
    for (var i = 0; i < 10; i++) {
      await gesture.moveBy(const Offset(width / 10, 0));
      await tester.pump();
    }
    for (var i = 0; i < 20; i++) {
      await gesture.moveBy(const Offset(-width / 10, 0));
      await tester.pump();
    }
    await gesture.up();
    await tester.pump();
    expect(values, isNotEmpty);
    expect(values.every((value) => value >= 0 && value <= 100), isTrue);
    expect(values.last, 0);
    expect(values.reduce((a, b) => a > b ? a : b), 100);
  });

  testWidgets('a value outside min and max is clamped in the track',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      wrap(ImpaktfullUiSlider(value: 150, min: 0, max: 100, onChanged: (_) {})),
    );
    expect(activeTrackFactor(tester), 1);
  });

  testWidgets('a new value from the parent moves the thumb', (tester) async {
    final value = ValueNotifier<double>(0);
    await pumpAndSettleComponent(
      tester,
      wrap(ValueListenableBuilder<double>(
        valueListenable: value,
        builder: (context, current, child) => ImpaktfullUiSlider(
          value: current,
          min: 0,
          max: 100,
          onChanged: (newValue) => value.value = newValue,
        ),
      )),
    );
    expect(activeTrackFactor(tester), 0);
    value.value = 75;
    await tester.pumpAndSettle();
    expect(activeTrackFactor(tester), closeTo(0.75, 0.001));
  });

  testWidgets('the legend is built with the current value', (tester) async {
    await pumpAndSettleComponent(
      tester,
      wrap(SizedBox(
        height: 72,
        child: ImpaktfullUiSlider(
          value: 0,
          min: 0,
          max: 100,
          legendBuilder: (context, value) => Text(value.toStringAsFixed(0)),
          onChanged: (_) {},
        ),
      )),
    );
    expect(find.text('0'), findsOneWidget);
    await tester.tapAt(atFraction(tester, 0.5));
    await tester.pump();
    expect(find.text('50'), findsOneWidget);
  });

  testWidgets('without legendAlignment no legend is shown', (tester) async {
    await pumpAndSettleComponent(
      tester,
      wrap(ImpaktfullUiSlider(
        value: 0,
        min: 0,
        max: 100,
        legendAlignment: null,
        legendBuilder: (context, value) => const Text('Legend'),
        onChanged: (_) {},
      )),
    );
    expect(find.text('Legend'), findsNothing);
  });

  testWidgets('the theme override is used', (tester) async {
    final theme = defaultComponentsTheme.slider;
    await pumpAndSettleComponent(
      tester,
      wrap(ImpaktfullUiSlider(
        value: 50,
        min: 0,
        max: 100,
        onChanged: (_) {},
        theme: theme.copyWith(
          colors: theme.colors.copyWith(activeTrack: customTestColor),
        ),
      )),
    );
    final activeTrack = tester.widget<Container>(find.descendant(
      of: find.byType(FractionallySizedBox),
      matching: find.byType(Container),
    ));
    expect((activeTrack.decoration as BoxDecoration).color, customTestColor);
  });
}
