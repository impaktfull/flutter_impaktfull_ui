import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/font_loader.dart';
import '../../../util/test_util.dart';

final _hoursField = find.byType(EditableText).first;
final _minutesField = find.byType(EditableText).last;

String _text(WidgetTester tester, Finder finder) =>
    tester.widget<EditableText>(finder).controller.text;

Future<List<TimeOfDay>> _pump(
  WidgetTester tester, {
  TimeOfDay value = const TimeOfDay(hour: 10, minute: 15),
  String? label,
}) async {
  final changes = <TimeOfDay>[];
  var current = value;
  await pumpAndSettleComponent(
    tester,
    Center(
      child: SizedBox(
        width: 280,
        child: StatefulBuilder(
          builder: (context, setState) => ImpaktfullUiTimePicker(
            label: label,
            value: current,
            onChanged: (newValue) => setState(() {
              changes.add(newValue);
              current = newValue;
            }),
          ),
        ),
      ),
    ),
  );
  return changes;
}

void main() {
  setUpAll(() async => loadImpaktfullUiFonts());

  testWidgets('shows the label', (tester) async {
    await _pump(tester, label: 'Start time');
    expect(find.text('Start time'), findsOneWidget);
  });

  testWidgets('typing the hours keeps the minutes', (tester) async {
    final changes = await _pump(tester);

    await tester.enterText(_hoursField, '18');
    await tester.pumpAndSettle();
    expect(changes, [const TimeOfDay(hour: 18, minute: 15)]);
    expect(_text(tester, _hoursField), '18');
    expect(_text(tester, _minutesField), '15');
  });

  testWidgets('typing the minutes keeps the hours', (tester) async {
    final changes = await _pump(tester);

    await tester.enterText(_minutesField, '45');
    await tester.pumpAndSettle();
    expect(changes, [const TimeOfDay(hour: 10, minute: 45)]);
    expect(_text(tester, _hoursField), '10');
  });

  testWidgets('hours above 23 are clamped to 23', (tester) async {
    final changes = await _pump(tester);

    await tester.enterText(_hoursField, '80');
    await tester.pumpAndSettle();
    expect(changes.last, const TimeOfDay(hour: 23, minute: 15));
    expect(_text(tester, _hoursField), '23');
  });

  testWidgets('minutes above 59 are clamped to 59', (tester) async {
    final changes = await _pump(tester);

    await tester.enterText(_minutesField, '75');
    await tester.pumpAndSettle();
    expect(changes.last, const TimeOfDay(hour: 10, minute: 59));
    expect(_text(tester, _minutesField), '59');
  });

  testWidgets('an empty minutes field is 0 and stays empty', (tester) async {
    final changes = await _pump(tester);

    await tester.enterText(_minutesField, '');
    await tester.pumpAndSettle();
    expect(changes.last, const TimeOfDay(hour: 10, minute: 0));
    expect(_text(tester, _minutesField), '');
  });

  testWidgets('a leading zero in the minutes is kept', (tester) async {
    final changes = await _pump(tester);

    await tester.enterText(_minutesField, '05');
    await tester.pumpAndSettle();
    expect(changes.last, const TimeOfDay(hour: 10, minute: 5));
    expect(_text(tester, _minutesField), '05');
  });

  testWidgets('letters are filtered out', (tester) async {
    final changes = await _pump(tester);

    await tester.enterText(_hoursField, 'ab');
    await tester.pumpAndSettle();
    expect(_text(tester, _hoursField), isNot(contains('a')));
    expect(changes.every((time) => time.minute == 15), isTrue);
  });

  testWidgets('the value is not changed without input', (tester) async {
    final changes = await _pump(tester);
    await tester.pumpAndSettle();
    expect(changes, isEmpty);
  });
}
