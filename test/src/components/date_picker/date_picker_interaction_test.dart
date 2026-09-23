import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/date_picker/widgets/date_picker_cell.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

import '../../../util/font_loader.dart';
import '../../../util/test_util.dart';
import '../_overlays_test_helpers.dart';

/// The cell of [day] in the month that is shown (not the days of the
/// previous/next month that fill the grid).
Finder _dayCell(String day) => find.byWidgetPredicate(
      (widget) =>
          widget is ImpaktfullUiDatePickerCell &&
          widget.value == day &&
          widget.active,
    );

ImpaktfullUiDatePickerCell _cell(WidgetTester tester, String day) =>
    tester.widget<ImpaktfullUiDatePickerCell>(_dayCell(day));

Finder get _next => find.byIcon(PhosphorIcons.arrowRight);

Finder get _previous => find.byIcon(PhosphorIcons.arrowLeft);

/// The picker has a fixed size: center it so it does not get the tight
/// constraints of the screen.
Future<void> _pumpPicker(WidgetTester tester, Widget picker) =>
    pumpAndSettleComponent(tester, Center(child: picker));

class _RangeState {
  DateTime? start;
  DateTime? end;
  final startChanges = <DateTime?>[];
  final endChanges = <DateTime?>[];
}

Future<_RangeState> _pumpRange(
  WidgetTester tester, {
  DateTime? start,
  DateTime? end,
}) async {
  final state = _RangeState()
    ..start = start
    ..end = end;
  await _pumpPicker(
    tester,
    StatefulBuilder(
      builder: (context, setState) => ImpaktfullUiDatePicker.range(
        selectedStartDate: state.start,
        selectedEndDate: state.end,
        onStartDateChanged: (value) => setState(() {
          state.startChanges.add(value);
          state.start = value;
        }),
        onEndDateChanged: (value) => setState(() {
          state.endChanges.add(value);
          state.end = value;
        }),
      ),
    ),
  );
  return state;
}

void main() {
  setUpAll(() async => loadImpaktfullUiFonts());

  group('Single date', () {
    testWidgets('tapping a day calls onDateChanged with that day',
        (tester) async {
      final changes = <DateTime?>[];
      await _pumpPicker(
        tester,
        ImpaktfullUiDatePicker(
          selectedDate: DateTime(2023, 7, 6),
          onDateChanged: changes.add,
        ),
      );

      await tapAndSettle(tester, _dayCell('14'));
      expect(changes, [DateTime(2023, 7, 14)]);
    });

    testWidgets('tapping a day of the next month returns that date',
        (tester) async {
      final changes = <DateTime?>[];
      await _pumpPicker(
        tester,
        ImpaktfullUiDatePicker(
          selectedDate: DateTime(2023, 7, 6),
          onDateChanged: changes.add,
        ),
      );

      // July 2023 ends on a Monday, the grid is filled with days of August.
      final august3 = find.byWidgetPredicate(
        (widget) =>
            widget is ImpaktfullUiDatePickerCell &&
            widget.value == '3' &&
            !widget.active,
      );
      await tapAndSettle(tester, august3.last);
      expect(changes, [DateTime(2023, 8, 3)]);
    });

    testWidgets('only the selected day is selected', (tester) async {
      await _pumpPicker(
        tester,
        ImpaktfullUiDatePicker(
          selectedDate: DateTime(2023, 7, 6),
          onDateChanged: (_) {},
        ),
      );

      final selected = tester
          .widgetList<ImpaktfullUiDatePickerCell>(
            find.byType(ImpaktfullUiDatePickerCell),
          )
          .where((cell) => cell.isSelected);
      expect(selected.map((cell) => cell.value), ['6']);
    });
  });

  group('Month paging', () {
    testWidgets('previous goes back one month and over the year',
        (tester) async {
      await _pumpPicker(
        tester,
        ImpaktfullUiDatePicker(
          selectedDate: DateTime(2023, 2, 15),
          onDateChanged: (_) {},
        ),
      );
      expect(find.text('February 2023'), findsOneWidget);

      await tapAndSettle(tester, _previous);
      expect(find.text('January 2023'), findsOneWidget);

      await tapAndSettle(tester, _previous);
      expect(find.text('December 2022'), findsOneWidget);
    });

    testWidgets('next goes over the year', (tester) async {
      await _pumpPicker(
        tester,
        ImpaktfullUiDatePicker(
          selectedDate: DateTime(2023, 12, 15),
          onDateChanged: (_) {},
        ),
      );

      await tapAndSettle(tester, _next);
      expect(find.text('January 2024'), findsOneWidget);
    });

    testWidgets('swiping the page view changes the month', (tester) async {
      await _pumpPicker(
        tester,
        ImpaktfullUiDatePicker(
          selectedDate: DateTime(2023, 7, 6),
          onDateChanged: (_) {},
        ),
      );

      await tester.fling(find.byType(PageView), const Offset(-300, 0), 1000);
      await tester.pumpAndSettle();
      expect(find.text('August 2023'), findsOneWidget);
    });

    testWidgets('paging does not change the selected date', (tester) async {
      final changes = <DateTime?>[];
      await _pumpPicker(
        tester,
        ImpaktfullUiDatePicker(
          selectedDate: DateTime(2023, 7, 6),
          onDateChanged: changes.add,
        ),
      );

      await tapAndSettle(tester, _next);
      await tapAndSettle(tester, _previous);
      expect(changes, isEmpty);
      expect(_cell(tester, '6').isSelected, isTrue);
    });
  });

  group('Months & years view', () {
    testWidgets('picking a month shows the days of that month', (tester) async {
      await _pumpPicker(
        tester,
        ImpaktfullUiDatePicker(
          selectedDate: DateTime(2023, 7, 6),
          onDateChanged: (_) {},
        ),
      );

      await tapAndSettle(tester, find.text('July 2023'));
      await tapAndSettle(tester, find.text('February'));
      expect(find.text('February 2023'), findsOneWidget);
      expect(find.text('Mon'), findsOneWidget);
    });

    testWidgets('picking a year and a month of another decade', (tester) async {
      final changes = <DateTime?>[];
      await _pumpPicker(
        tester,
        ImpaktfullUiDatePicker(
          selectedDate: DateTime(2023, 7, 6),
          onDateChanged: changes.add,
        ),
      );

      await tapAndSettle(tester, find.text('July 2023'));
      await tapAndSettle(tester, find.text('2023'));
      await tapAndSettle(tester, _next);
      await tapAndSettle(tester, find.text('2031'));
      expect(find.text('2031'), findsOneWidget);
      await tapAndSettle(tester, find.text('March'));
      expect(find.text('March 2031'), findsOneWidget);

      await tapAndSettle(tester, _dayCell('12'));
      expect(changes, [DateTime(2031, 3, 12)]);
    });

    testWidgets('paging in the months view changes the year', (tester) async {
      await _pumpPicker(
        tester,
        ImpaktfullUiDatePicker(
          selectedDate: DateTime(2023, 7, 6),
          onDateChanged: (_) {},
        ),
      );

      await tapAndSettle(tester, find.text('July 2023'));
      await tapAndSettle(tester, _previous);
      expect(find.text('2022'), findsOneWidget);
      await tapAndSettle(tester, find.text('May'));
      expect(find.text('May 2022'), findsOneWidget);
    });
  });

  group('Controlled value', () {
    testWidgets('a new date of the parent shows its month', (tester) async {
      var date = DateTime(2023, 7, 6);
      late StateSetter setState;
      await _pumpPicker(
        tester,
        StatefulBuilder(
          builder: (context, setter) {
            setState = setter;
            return ImpaktfullUiDatePicker(
              selectedDate: date,
              onDateChanged: (_) {},
            );
          },
        ),
      );

      setState(() => date = DateTime(2024, 2, 10));
      await tester.pumpAndSettle();
      expect(find.text('February 2024'), findsOneWidget);
      expect(_cell(tester, '10').isSelected, isTrue);

      setState(() => date = DateTime(2021, 11, 3));
      await tester.pumpAndSettle();
      expect(find.text('November 2021'), findsOneWidget);
      expect(_cell(tester, '3').isSelected, isTrue);
    });

    testWidgets('selecting a day updates the selection through the parent',
        (tester) async {
      DateTime? date = DateTime(2023, 7, 6);
      await _pumpPicker(
        tester,
        StatefulBuilder(
          builder: (context, setState) => ImpaktfullUiDatePicker(
            selectedDate: date,
            onDateChanged: (value) => setState(() => date = value),
          ),
        ),
      );

      await tapAndSettle(tester, _dayCell('20'));
      expect(date, DateTime(2023, 7, 20));
      expect(_cell(tester, '20').isSelected, isTrue);
      expect(_cell(tester, '6').isSelected, isFalse);
      expect(find.text('July 2023'), findsOneWidget);
    });
  });

  group('Range selection', () {
    testWidgets('first tap sets the start, second tap the end', (tester) async {
      // Without a start date, the month of today is shown.
      final now = DateTime.now();
      final state = await _pumpRange(tester);

      await tapAndSettle(tester, _dayCell('10'));
      expect(state.start, DateTime(now.year, now.month, 10));
      expect(state.end, isNull);

      await tapAndSettle(tester, _dayCell('14'));
      expect(state.start, DateTime(now.year, now.month, 10));
      expect(state.end, DateTime(now.year, now.month, 14));
    });

    testWidgets('a day before the start replaces the start', (tester) async {
      final state = await _pumpRange(tester, start: DateTime(2023, 7, 10));

      await tapAndSettle(tester, _dayCell('5'));
      expect(state.start, DateTime(2023, 7, 5));
      expect(state.end, isNull);
      expect(state.endChanges, isEmpty);
    });

    testWidgets('the start day again does not set an end', (tester) async {
      final state = await _pumpRange(tester, start: DateTime(2023, 7, 10));

      await tapAndSettle(tester, _dayCell('10'));
      expect(state.start, DateTime(2023, 7, 10));
      expect(state.end, isNull);
    });

    testWidgets('a tap on a complete range starts a new range', (tester) async {
      final state = await _pumpRange(
        tester,
        start: DateTime(2023, 7, 10),
        end: DateTime(2023, 7, 14),
      );

      await tapAndSettle(tester, _dayCell('20'));
      expect(state.start, DateTime(2023, 7, 20));
      expect(state.end, isNull);
      expect(state.endChanges, [null]);
    });

    testWidgets('a range over 2 months', (tester) async {
      final state = await _pumpRange(tester, start: DateTime(2023, 7, 28));

      await tapAndSettle(tester, _next);
      await tapAndSettle(tester, _dayCell('2'));
      expect(state.end, DateTime(2023, 8, 2));
      expect(_cell(tester, '1').type, ImpaktfullUiDatePickerCellType.between);
      expect(_cell(tester, '2').type, ImpaktfullUiDatePickerCellType.end);
    });

    testWidgets('marks the start, the days in between and the end',
        (tester) async {
      await _pumpRange(
        tester,
        start: DateTime(2023, 7, 10),
        end: DateTime(2023, 7, 13),
      );

      expect(_cell(tester, '9').type, ImpaktfullUiDatePickerCellType.single);
      expect(_cell(tester, '10').type, ImpaktfullUiDatePickerCellType.start);
      expect(_cell(tester, '11').type, ImpaktfullUiDatePickerCellType.between);
      expect(_cell(tester, '12').type, ImpaktfullUiDatePickerCellType.between);
      expect(_cell(tester, '13').type, ImpaktfullUiDatePickerCellType.end);
      expect(_cell(tester, '14').type, ImpaktfullUiDatePickerCellType.single);
      expect(_cell(tester, '10').isSelected, isTrue);
      expect(_cell(tester, '11').isSelected, isFalse);
      expect(_cell(tester, '13').isSelected, isTrue);
    });

    group(
      'with times',
      () {
        testWidgets('the end day is marked as end when it has a time',
            (tester) async {
          await _pumpRange(
            tester,
            start: DateTime(2023, 7, 10, 9),
            end: DateTime(2023, 7, 13, 18),
          );

          expect(
            _cell(tester, '10').type,
            ImpaktfullUiDatePickerCellType.start,
          );
          expect(_cell(tester, '13').type, ImpaktfullUiDatePickerCellType.end);
        });
      },
    );
  });

  group('showModal', () {
    testWidgets('Apply returns the day that was tapped', (tester) async {
      final context = await pumpOverlayApp(tester);
      DateTime? result;
      unawaited(ImpaktfullUiDatePicker.showModal(
        context: context,
        selectedDate: DateTime(2023, 7, 6),
      ).then((value) => result = value));
      await tester.pumpAndSettle();

      await tapAndSettle(tester, _dayCell('21'));
      expect(_cell(tester, '21').isSelected, isTrue);
      await tapAndSettle(tester, find.text('Apply'));
      expect(result, DateTime(2023, 7, 21));
      expect(find.text('Apply'), findsNothing);
    });

    testWidgets('Cancel returns null even after tapping a day', (tester) async {
      final context = await pumpOverlayApp(tester);
      var result = DateTime(1);
      var completed = false;
      unawaited(ImpaktfullUiDatePicker.showModal(
        context: context,
        selectedDate: DateTime(2023, 7, 6),
      ).then((value) {
        completed = true;
        result = value ?? DateTime(2);
      }));
      await tester.pumpAndSettle();

      await tapAndSettle(tester, _dayCell('21'));
      await tapAndSettle(tester, find.text('Cancel'));
      expect(completed, isTrue);
      expect(result, DateTime(2));
    });

    testWidgets('is not dismissible by default', (tester) async {
      final context = await pumpOverlayApp(tester);
      unawaited(ImpaktfullUiDatePicker.showModal(
        context: context,
        selectedDate: DateTime(2023, 7, 6),
      ));
      await tester.pumpAndSettle();

      await tester.tapAt(const Offset(5, 5));
      await tester.pumpAndSettle();
      expect(find.text('Apply'), findsOneWidget);
    });

    testWidgets('isDismissible closes it with a tap outside', (tester) async {
      final context = await pumpOverlayApp(tester);
      var completed = false;
      DateTime? result;
      unawaited(ImpaktfullUiDatePicker.showModal(
        context: context,
        selectedDate: DateTime(2023, 7, 6),
        isDismissible: true,
      ).then((value) {
        completed = true;
        result = value;
      }));
      await tester.pumpAndSettle();

      await tester.tapAt(const Offset(5, 5));
      await tester.pumpAndSettle();
      expect(find.text('Apply'), findsNothing);
      expect(completed, isTrue);
      expect(result, isNull);
    });
  });

  group('showRangeModal', () {
    Future<DateTimeRange? Function()> open(
      WidgetTester tester, {
      DateTime? start,
      DateTime? end,
    }) async {
      final context = await pumpOverlayApp(tester);
      DateTimeRange? result;
      unawaited(ImpaktfullUiDatePicker.showRangeModal(
        context: context,
        selectedStartDate: start,
        selectedEndDate: end,
      ).then((value) => result = value));
      await tester.pumpAndSettle();
      return () => result;
    }

    testWidgets('Apply returns the selected range', (tester) async {
      final result = await open(tester, start: DateTime(2023, 7, 6));

      await tapAndSettle(tester, _dayCell('12'));
      await tapAndSettle(tester, find.text('Apply'));
      expect(
        result(),
        DateTimeRange(start: DateTime(2023, 7, 6), end: DateTime(2023, 7, 12)),
      );
    });

    testWidgets('Apply without an end date returns null and closes',
        (tester) async {
      final result = await open(tester, start: DateTime(2023, 7, 6));

      await tapAndSettle(tester, find.text('Apply'));
      expect(result(), isNull);
      expect(find.text('Apply'), findsNothing);
    });

    testWidgets('Apply returns the initial range when nothing changed',
        (tester) async {
      final result = await open(
        tester,
        start: DateTime(2023, 7, 6),
        end: DateTime(2023, 7, 8),
      );

      await tapAndSettle(tester, find.text('Apply'));
      expect(
        result(),
        DateTimeRange(start: DateTime(2023, 7, 6), end: DateTime(2023, 7, 8)),
      );
    });
  });
}
