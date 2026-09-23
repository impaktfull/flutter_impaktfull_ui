import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/date_picker/widgets/date_picker_cell.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

import '../../../util/font_loader.dart';
import '../../../util/test_util.dart';
import '../_overlays_test_helpers.dart';

final _hoursField = find.byType(EditableText).first;
final _minutesField = find.byType(EditableText).last;

String _text(WidgetTester tester, Finder finder) =>
    tester.widget<EditableText>(finder).controller.text;

Finder _dayCell(String day) => find.byWidgetPredicate(
      (widget) =>
          widget is ImpaktfullUiDatePickerCell &&
          widget.value == day &&
          widget.active,
    );

ImpaktfullUiDatePickerCell _cell(WidgetTester tester, String day) =>
    tester.widget<ImpaktfullUiDatePickerCell>(_dayCell(day));

void main() {
  setUpAll(() async => loadImpaktfullUiFonts());

  Future<List<DateTime>> pump(WidgetTester tester, DateTime? value) async {
    final changes = <DateTime>[];
    await pumpAndSettleComponent(
      tester,
      Center(
        child: ImpaktfullUiDateTimePicker(
          value: value,
          onChanged: changes.add,
        ),
      ),
    );
    return changes;
  }

  testWidgets('tapping a day keeps the time', (tester) async {
    final changes = await pump(tester, DateTime(2023, 7, 6, 14, 30));

    await tapAndSettle(tester, _dayCell('20'));
    expect(changes, [DateTime(2023, 7, 20, 14, 30)]);
  });

  testWidgets('changing the minutes keeps the date', (tester) async {
    final changes = await pump(tester, DateTime(2023, 7, 6, 14, 30));

    await tester.enterText(_minutesField, '45');
    await tester.pumpAndSettle();
    expect(changes, [DateTime(2023, 7, 6, 14, 45)]);
  });

  testWidgets('a date of another month after paging', (tester) async {
    final changes = await pump(tester, DateTime(2023, 7, 6, 14, 30));

    await tapAndSettle(tester, find.byIcon(PhosphorIcons.arrowRight));
    await tapAndSettle(tester, _dayCell('2'));
    expect(changes, [DateTime(2023, 8, 2, 14, 30)]);
  });

  testWidgets('a new value of the parent updates the date and the time',
      (tester) async {
    var value = DateTime(2023, 7, 6, 14, 30);
    late StateSetter setState;
    await pumpAndSettleComponent(
      tester,
      Center(
        child: StatefulBuilder(
          builder: (context, setter) {
            setState = setter;
            return ImpaktfullUiDateTimePicker(
              value: value,
              onChanged: (_) {},
            );
          },
        ),
      ),
    );

    setState(() => value = DateTime(2024, 3, 12, 8, 5));
    await tester.pumpAndSettle();
    expect(find.text('March 2024'), findsOneWidget);
    expect(_cell(tester, '12').isSelected, isTrue);
    expect(_text(tester, _hoursField), '8');
    expect(_text(tester, _minutesField), '5');
  });

  testWidgets('selecting a date and a time through the parent', (tester) async {
    DateTime? value = DateTime(2023, 7, 6, 14, 30);
    await pumpAndSettleComponent(
      tester,
      Center(
        child: StatefulBuilder(
          builder: (context, setState) => ImpaktfullUiDateTimePicker(
            value: value,
            onChanged: (newValue) => setState(() => value = newValue),
          ),
        ),
      ),
    );

    await tapAndSettle(tester, _dayCell('9'));
    await tester.enterText(_hoursField, '7');
    await tester.pumpAndSettle();
    expect(value, DateTime(2023, 7, 9, 7, 30));
    expect(_cell(tester, '9').isSelected, isTrue);
    expect(_text(tester, _hoursField), '7');
  });

  group(
    'without a value',
    () {
      testWidgets('selecting a date uses the time that is shown',
          (tester) async {
        final changes = await pump(tester, null);
        final shownHour = int.parse(_text(tester, _hoursField));
        final shownMinute = int.parse(_text(tester, _minutesField));

        await tapAndSettle(tester, _dayCell('15'));
        expect(changes.single.hour, shownHour);
        expect(changes.single.minute, shownMinute);
      });
    },
  );

  group('showModal', () {
    testWidgets('Apply returns the edited date and time', (tester) async {
      final context = await pumpOverlayApp(tester);
      DateTime? result;
      unawaited(ImpaktfullUiDateTimePicker.showModal(
        context: context,
        value: DateTime(2023, 7, 6, 14, 30),
      ).then((value) => result = value));
      await tester.pumpAndSettle();

      await tapAndSettle(tester, _dayCell('10'));
      await tester.enterText(_minutesField, '5');
      await tester.pumpAndSettle();
      await tapAndSettle(tester, find.text('Apply'));
      expect(result, DateTime(2023, 7, 10, 14, 5));
    });

    testWidgets('Cancel returns null', (tester) async {
      final context = await pumpOverlayApp(tester);
      var completed = false;
      DateTime? result;
      unawaited(ImpaktfullUiDateTimePicker.showModal(
        context: context,
        value: DateTime(2023, 7, 6, 14, 30),
      ).then((value) {
        completed = true;
        result = value;
      }));
      await tester.pumpAndSettle();

      await tapAndSettle(tester, _dayCell('10'));
      await tapAndSettle(tester, find.text('Cancel'));
      expect(completed, isTrue);
      expect(result, isNull);
    });

    testWidgets('isDismissible closes it with a tap outside', (tester) async {
      final context = await pumpOverlayApp(tester);
      var completed = false;
      unawaited(ImpaktfullUiDateTimePicker.showModal(
        context: context,
        value: DateTime(2023, 7, 6, 14, 30),
        isDismissible: true,
      ).then((_) => completed = true));
      await tester.pumpAndSettle();

      await tester.tapAt(const Offset(5, 5));
      await tester.pumpAndSettle();
      expect(completed, isTrue);
    });
  });
}
