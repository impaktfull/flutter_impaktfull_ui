import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  String fieldText(WidgetTester tester, Finder finder) =>
      tester.widget<EditableText>(finder).controller.text;
  final hoursField = find.byType(EditableText).first;
  final minutesField = find.byType(EditableText).last;

  testWidgets('a new value from the parent updates the fields', (tester) async {
    var value = const TimeOfDay(hour: 10, minute: 15);
    late StateSetter setState;
    await pumpAndSettleComponent(
      tester,
      StatefulBuilder(
        builder: (context, setter) {
          setState = setter;
          return ImpaktfullUiTimePicker(
            value: value,
            onChanged: (newValue) => setState(() => value = newValue),
          );
        },
      ),
    );
    expect(fieldText(tester, hoursField), '10');
    expect(fieldText(tester, minutesField), '15');

    setState(() => value = const TimeOfDay(hour: 18, minute: 45));
    await tester.pumpAndSettle();
    expect(fieldText(tester, hoursField), '18');
    expect(fieldText(tester, minutesField), '45');
  });

  testWidgets('typed text is kept when the parent echoes the value',
      (tester) async {
    var value = const TimeOfDay(hour: 10, minute: 15);
    await pumpAndSettleComponent(
      tester,
      StatefulBuilder(
        builder: (context, setState) => ImpaktfullUiTimePicker(
          value: value,
          onChanged: (newValue) => setState(() => value = newValue),
        ),
      ),
    );

    await tester.enterText(hoursField, '07');
    await tester.pumpAndSettle();
    expect(value, const TimeOfDay(hour: 7, minute: 15));
    expect(fieldText(tester, hoursField), '07');

    await tester.enterText(hoursField, '');
    await tester.pumpAndSettle();
    expect(value, const TimeOfDay(hour: 0, minute: 15));
    expect(fieldText(tester, hoursField), '');
  });
}
