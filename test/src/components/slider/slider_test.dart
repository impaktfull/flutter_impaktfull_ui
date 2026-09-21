import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  Widget wrap(Widget child) =>
      Center(child: SizedBox(width: 400, child: child));

  double activeTrackFactor(WidgetTester tester) => tester
      .widget<FractionallySizedBox>(find.descendant(
        of: find.byType(ImpaktfullUiSlider),
        matching: find.byType(FractionallySizedBox),
      ))
      .widthFactor!;

  testWidgets('the thumb does not move when the slider is disabled',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      wrap(const ImpaktfullUiSlider(value: 0, min: 0, max: 100)),
    );
    expect(activeTrackFactor(tester), 0);

    await tester.tap(find.byType(ImpaktfullUiSlider));
    await tester.pumpAndSettle();
    expect(activeTrackFactor(tester), 0);

    await tester.drag(find.byType(ImpaktfullUiSlider), const Offset(150, 0));
    await tester.pumpAndSettle();
    expect(activeTrackFactor(tester), 0);
  });

  testWidgets('the thumb moves when the slider is enabled', (tester) async {
    final values = <double>[];
    await pumpAndSettleComponent(
      tester,
      wrap(ImpaktfullUiSlider(
          value: 0, min: 0, max: 100, onChanged: values.add)),
    );
    await tester.tap(find.byType(ImpaktfullUiSlider));
    await tester.pumpAndSettle();
    expect(values, hasLength(1));
    expect(activeTrackFactor(tester), closeTo(0.5, 0.01));
  });

  testWidgets('min equal to max does not throw', (tester) async {
    final values = <double>[];
    await pumpAndSettleComponent(
      tester,
      wrap(ImpaktfullUiSlider(value: 5, min: 5, max: 5, onChanged: values.add)),
    );
    expect(tester.takeException(), isNull);
    expect(activeTrackFactor(tester), 0);

    await tester.tap(find.byType(ImpaktfullUiSlider));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });
}
