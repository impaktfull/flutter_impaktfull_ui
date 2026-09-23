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

/// The cell with [value] on the months or years page.
ImpaktfullUiDatePickerCell _namedCell(WidgetTester tester, String value) =>
    tester.widget<ImpaktfullUiDatePickerCell>(
      find.byWidgetPredicate((widget) =>
          widget is ImpaktfullUiDatePickerCell && widget.value == value),
    );

Finder get _next => find.byIcon(PhosphorIcons.arrowRight);

Finder get _previous => find.byIcon(PhosphorIcons.arrowLeft);

/// The header/navigation button that holds [icon].
ImpaktfullUiButton _arrow(WidgetTester tester, Finder icon) =>
    tester.widget<ImpaktfullUiButton>(
      find.ancestor(of: icon, matching: find.byType(ImpaktfullUiButton)).first,
    );

bool _isArrowDisabled(WidgetTester tester, Finder icon) =>
    _arrow(tester, icon).onTap == null;

/// The picker has a fixed size: center it so it does not get the tight
/// constraints of the screen.
Future<void> _pumpPicker(WidgetTester tester, Widget picker) =>
    pumpAndSettleComponent(tester, Center(child: picker));

void main() {
  setUpAll(() async => loadImpaktfullUiFonts());

  group('Disabled days', () {
    testWidgets('a day before firstDate is disabled and not tappable',
        (tester) async {
      final changes = <DateTime?>[];
      await _pumpPicker(
        tester,
        ImpaktfullUiDatePicker(
          selectedDate: DateTime(2023, 7, 10),
          firstDate: DateTime(2023, 7, 5),
          onDateChanged: changes.add,
        ),
      );

      expect(_cell(tester, '4').isDisabled, true);
      expect(_cell(tester, '5').isDisabled, false);

      await tapAndSettle(tester, _dayCell('4'));
      expect(changes, isEmpty);

      await tapAndSettle(tester, _dayCell('5'));
      expect(changes, [DateTime(2023, 7, 5)]);
    });

    testWidgets('a day after lastDate is disabled and not tappable',
        (tester) async {
      final changes = <DateTime?>[];
      await _pumpPicker(
        tester,
        ImpaktfullUiDatePicker(
          selectedDate: DateTime(2023, 7, 10),
          lastDate: DateTime(2023, 7, 20),
          onDateChanged: changes.add,
        ),
      );

      expect(_cell(tester, '21').isDisabled, true);
      expect(_cell(tester, '20').isDisabled, false);

      await tapAndSettle(tester, _dayCell('21'));
      expect(changes, isEmpty);

      await tapAndSettle(tester, _dayCell('20'));
      expect(changes, [DateTime(2023, 7, 20)]);
    });

    testWidgets('the time of day of lastDate does not disable its own day',
        (tester) async {
      final changes = <DateTime?>[];
      await _pumpPicker(
        tester,
        ImpaktfullUiDatePicker(
          selectedDate: DateTime(2026, 9, 10),
          firstDate: DateTime(2026, 9, 5, 16, 30),
          lastDate: DateTime(2026, 9, 23, 10),
          onDateChanged: changes.add,
        ),
      );

      expect(_cell(tester, '23').isDisabled, false);
      expect(_cell(tester, '24').isDisabled, true);
      expect(_cell(tester, '5').isDisabled, false);
      expect(_cell(tester, '4').isDisabled, true);

      await tapAndSettle(tester, _dayCell('23'));
      expect(changes, [DateTime(2026, 9, 23)]);
    });

    testWidgets('a disabled day is not focusable, so the keyboard skips it',
        (tester) async {
      await _pumpPicker(
        tester,
        ImpaktfullUiDatePicker(
          selectedDate: DateTime(2023, 7, 10),
          firstDate: DateTime(2023, 7, 5),
          lastDate: DateTime(2023, 7, 20),
          onDateChanged: (_) {},
        ),
      );

      // Every focusable day cell is a day inside the bounds: an InkWell is
      // only built for a cell with an onTap.
      final focusableDays = tester
          .widgetList<ImpaktfullUiDatePickerCell>(
              find.byType(ImpaktfullUiDatePickerCell))
          .where((cell) => cell.onTap != null)
          .toList();
      expect(focusableDays, isNotEmpty);
      expect(focusableDays.every((cell) => !cell.isDisabled), true);

      final disabled = tester
          .widgetList<ImpaktfullUiDatePickerCell>(
              find.byType(ImpaktfullUiDatePickerCell))
          .where((cell) => cell.isDisabled);
      expect(disabled, isNotEmpty);
      expect(disabled.every((cell) => cell.onTap == null), true);
    });

    testWidgets('without bounds no day is disabled', (tester) async {
      await _pumpPicker(
        tester,
        ImpaktfullUiDatePicker(
          selectedDate: DateTime(2023, 7, 10),
          onDateChanged: (_) {},
        ),
      );

      final cells = tester.widgetList<ImpaktfullUiDatePickerCell>(
          find.byType(ImpaktfullUiDatePickerCell));
      expect(cells.every((cell) => !cell.isDisabled), true);
    });
  });

  group('Semantics', () {
    testWidgets('a disabled day announces as a disabled button',
        (tester) async {
      final handle = tester.ensureSemantics();
      await _pumpPicker(
        tester,
        ImpaktfullUiDatePicker(
          selectedDate: DateTime(2023, 7, 10),
          firstDate: DateTime(2023, 7, 5),
          onDateChanged: (_) {},
        ),
      );

      final disabled = find.semantics.byPredicate(
        (node) => node.tooltip == 'Unavailable',
      );
      expect(disabled, findsAtLeast(1));
      for (final node in disabled.evaluate()) {
        expect(
          node,
          isSemantics(
            isButton: true,
            hasEnabledState: true,
            isEnabled: false,
          ),
        );
      }
      handle.dispose();
    });

    testWidgets('the announcement comes from the localizations',
        (tester) async {
      final handle = tester.ensureSemantics();
      await tester.pumpWidget(
        ImpaktfullUiApp(
          showDebugFlag: false,
          title: 'test',
          localizations: const ImpaktfullUiLocalizations(
            accessibility: ImpaktfullUiAccessibilityLocalizations(
              unavailableDate: 'Niet beschikbaar',
            ),
          ),
          home: Center(
            child: ImpaktfullUiDatePicker(
              selectedDate: DateTime(2023, 7, 10),
              firstDate: DateTime(2023, 7, 5),
              onDateChanged: (_) {},
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(
        find.semantics
            .byPredicate((node) => node.tooltip == 'Niet beschikbaar'),
        findsAtLeast(1),
      );
      handle.dispose();
    });
  });

  group('Navigation', () {
    testWidgets('the previous arrow is disabled on the first month',
        (tester) async {
      await _pumpPicker(
        tester,
        ImpaktfullUiDatePicker(
          selectedDate: DateTime(2023, 7, 10),
          firstDate: DateTime(2023, 7, 1),
          lastDate: DateTime(2023, 9, 30),
          onDateChanged: (_) {},
        ),
      );

      expect(find.text('July 2023'), findsOneWidget);
      expect(_isArrowDisabled(tester, _previous), true);
      expect(_isArrowDisabled(tester, _next), false);

      await tapAndSettle(tester, _next);
      expect(find.text('August 2023'), findsOneWidget);
      expect(_isArrowDisabled(tester, _previous), false);
    });

    testWidgets('the next arrow is disabled on the last month', (tester) async {
      await _pumpPicker(
        tester,
        ImpaktfullUiDatePicker(
          selectedDate: DateTime(2023, 9, 10),
          firstDate: DateTime(2023, 7, 1),
          lastDate: DateTime(2023, 9, 30),
          onDateChanged: (_) {},
        ),
      );

      expect(find.text('September 2023'), findsOneWidget);
      expect(_isArrowDisabled(tester, _next), true);

      // Tapping a disabled arrow does not move the month.
      await tapAndSettle(tester, _next);
      expect(find.text('September 2023'), findsOneWidget);
    });

    testWidgets('a single allowed month disables both arrows', (tester) async {
      await _pumpPicker(
        tester,
        ImpaktfullUiDatePicker(
          selectedDate: DateTime(2023, 7, 10),
          firstDate: DateTime(2023, 7, 4),
          lastDate: DateTime(2023, 7, 21),
          onDateChanged: (_) {},
        ),
      );

      expect(_isArrowDisabled(tester, _previous), true);
      expect(_isArrowDisabled(tester, _next), true);
      expect(find.text('July 2023'), findsOneWidget);
    });

    testWidgets('swiping can not go past the first or the last month',
        (tester) async {
      await _pumpPicker(
        tester,
        ImpaktfullUiDatePicker(
          selectedDate: DateTime(2023, 7, 10),
          firstDate: DateTime(2023, 7, 1),
          lastDate: DateTime(2023, 8, 31),
          onDateChanged: (_) {},
        ),
      );

      await tester.drag(find.byType(PageView), const Offset(400, 0));
      await tester.pumpAndSettle();
      expect(find.text('July 2023'), findsOneWidget);

      await tester.drag(find.byType(PageView), const Offset(-400, 0));
      await tester.pumpAndSettle();
      expect(find.text('August 2023'), findsOneWidget);

      await tester.drag(find.byType(PageView), const Offset(-400, 0));
      await tester.pumpAndSettle();
      expect(find.text('August 2023'), findsOneWidget);
    });

    testWidgets('a month outside the bounds is disabled on the months page',
        (tester) async {
      await _pumpPicker(
        tester,
        ImpaktfullUiDatePicker(
          selectedDate: DateTime(2023, 7, 10),
          firstDate: DateTime(2023, 5, 20),
          lastDate: DateTime(2023, 9, 3),
          onDateChanged: (_) {},
        ),
      );

      await tapAndSettle(tester, find.text('July 2023'));

      expect(_namedCell(tester, 'April').isDisabled, true);
      expect(_namedCell(tester, 'May').isDisabled, false);
      expect(_namedCell(tester, 'September').isDisabled, false);
      expect(_namedCell(tester, 'October').isDisabled, true);

      // A disabled month does not open its days.
      await tapAndSettle(tester, find.text('October'));
      expect(find.text('October'), findsOneWidget);

      await tapAndSettle(tester, find.text('September'));
      expect(find.text('September 2023'), findsOneWidget);
    });

    testWidgets('the years page only shows the years inside the bounds',
        (tester) async {
      await _pumpPicker(
        tester,
        ImpaktfullUiDatePicker(
          selectedDate: DateTime(2023, 7, 10),
          firstDate: DateTime(2022, 1, 1),
          lastDate: DateTime(2025, 12, 31),
          onDateChanged: (_) {},
        ),
      );

      await tapAndSettle(tester, find.text('July 2023'));
      await tapAndSettle(tester, find.text('2023'));

      for (final year in ['2022', '2023', '2024', '2025']) {
        expect(find.text(year), findsOneWidget, reason: year);
      }
      for (final year in ['2020', '2021', '2026', '2027', '2028', '2029']) {
        expect(find.text(year), findsNothing, reason: year);
      }
    });

    testWidgets('the arrows of the years page stay inside the bounds',
        (tester) async {
      await _pumpPicker(
        tester,
        ImpaktfullUiDatePicker(
          selectedDate: DateTime(2023, 7, 10),
          firstDate: DateTime(2022, 1, 1),
          lastDate: DateTime(2025, 12, 31),
          onDateChanged: (_) {},
        ),
      );

      await tapAndSettle(tester, find.text('July 2023'));
      // The months page of the only years inside the bounds.
      expect(_isArrowDisabled(tester, _previous), false);
      await tapAndSettle(tester, _previous);
      expect(find.text('2022'), findsOneWidget);
      expect(_isArrowDisabled(tester, _previous), true);

      await tapAndSettle(tester, find.text('2022'));
      // Only one decade holds 2022 - 2025.
      expect(_isArrowDisabled(tester, _previous), true);
      expect(_isArrowDisabled(tester, _next), true);
    });

    testWidgets('picking a year and a month keeps working with bounds',
        (tester) async {
      final changes = <DateTime?>[];
      await _pumpPicker(
        tester,
        ImpaktfullUiDatePicker(
          selectedDate: DateTime(2023, 7, 10),
          firstDate: DateTime(2022, 2, 1),
          lastDate: DateTime(2025, 12, 31),
          onDateChanged: changes.add,
        ),
      );

      await tapAndSettle(tester, find.text('July 2023'));
      await tapAndSettle(tester, find.text('2023'));
      await tapAndSettle(tester, find.text('2022'));
      // February is the first month of 2022 inside the bounds.
      expect(_namedCell(tester, 'January').isDisabled, true);
      expect(_namedCell(tester, 'February').isDisabled, false);
      await tapAndSettle(tester, find.text('March'));
      expect(find.text('March 2022'), findsOneWidget);

      await tapAndSettle(tester, _dayCell('3'));
      expect(changes, [DateTime(2022, 3, 3)]);
    });
  });

  group('Range', () {
    testWidgets('a range can not start or end outside the bounds',
        (tester) async {
      DateTime? start;
      DateTime? end;
      await _pumpPicker(
        tester,
        StatefulBuilder(
          builder: (context, setState) => ImpaktfullUiDatePicker.range(
            selectedStartDate: start,
            selectedEndDate: end,
            firstDate: DateTime(2023, 7, 5),
            lastDate: DateTime(2023, 7, 20),
            onStartDateChanged: (value) => setState(() => start = value),
            onEndDateChanged: (value) => setState(() => end = value),
          ),
        ),
      );

      await tapAndSettle(tester, _dayCell('3'));
      expect(start, isNull);

      await tapAndSettle(tester, _dayCell('6'));
      expect(start, DateTime(2023, 7, 6));

      await tapAndSettle(tester, _dayCell('25'));
      expect(end, isNull);

      await tapAndSettle(tester, _dayCell('18'));
      expect(end, DateTime(2023, 7, 18));
      expect(start, DateTime(2023, 7, 6));
    });

    testWidgets('the days between the range stay highlighted', (tester) async {
      await _pumpPicker(
        tester,
        ImpaktfullUiDatePicker.range(
          selectedStartDate: DateTime(2023, 7, 6),
          selectedEndDate: DateTime(2023, 7, 12),
          firstDate: DateTime(2023, 7, 5),
          lastDate: DateTime(2023, 7, 20),
          onStartDateChanged: (_) {},
          onEndDateChanged: (_) {},
        ),
      );

      expect(_cell(tester, '9').type, ImpaktfullUiDatePickerCellType.between);
      expect(_cell(tester, '6').type, ImpaktfullUiDatePickerCellType.start);
      expect(_cell(tester, '12').type, ImpaktfullUiDatePickerCellType.end);
    });
  });

  group('A value outside the bounds', () {
    testWidgets(
        'opens on the closest month inside the bounds and shows no '
        'selection', (tester) async {
      await _pumpPicker(
        tester,
        ImpaktfullUiDatePicker(
          selectedDate: DateTime(2020, 1, 15),
          firstDate: DateTime(2023, 7, 5),
          lastDate: DateTime(2023, 9, 30),
          onDateChanged: (_) {},
        ),
      );

      expect(find.text('July 2023'), findsOneWidget);
      final selected = tester
          .widgetList<ImpaktfullUiDatePickerCell>(
              find.byType(ImpaktfullUiDatePickerCell))
          .where((cell) => cell.isSelected);
      expect(selected, isEmpty);
    });

    testWidgets('after lastDate opens on the last month', (tester) async {
      await _pumpPicker(
        tester,
        ImpaktfullUiDatePicker(
          selectedDate: DateTime(2030, 1, 15),
          firstDate: DateTime(2023, 7, 5),
          lastDate: DateTime(2023, 9, 30),
          onDateChanged: (_) {},
        ),
      );

      expect(find.text('September 2023'), findsOneWidget);
      expect(_isArrowDisabled(tester, _next), true);
    });

    testWidgets('a range outside the bounds does not crash', (tester) async {
      await _pumpPicker(
        tester,
        ImpaktfullUiDatePicker.range(
          selectedStartDate: DateTime(2019, 1, 1),
          selectedEndDate: DateTime(2030, 1, 1),
          firstDate: DateTime(2023, 7, 5),
          lastDate: DateTime(2023, 9, 30),
          onStartDateChanged: (_) {},
          onEndDateChanged: (_) {},
        ),
      );

      expect(tester.takeException(), isNull);
      expect(find.text('July 2023'), findsOneWidget);
    });
  });

  group('Changing the bounds', () {
    testWidgets('moves the picker inside the new bounds', (tester) async {
      var lastDate = DateTime(2023, 12, 31);
      await _pumpPicker(
        tester,
        StatefulBuilder(
          builder: (context, setState) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ImpaktfullUiDatePicker(
                selectedDate: DateTime(2023, 10, 10),
                firstDate: DateTime(2023, 1, 1),
                lastDate: lastDate,
                onDateChanged: (_) {},
              ),
              ImpaktfullUiButton(
                type: ImpaktfullUiButtonType.primary,
                title: 'shrink',
                onTap: () => setState(() => lastDate = DateTime(2023, 8, 31)),
              ),
            ],
          ),
        ),
      );

      expect(find.text('October 2023'), findsOneWidget);
      await tapAndSettle(tester, find.text('shrink'));
      expect(find.text('August 2023'), findsOneWidget);
      expect(_isArrowDisabled(tester, _next), true);
      expect(tester.takeException(), isNull);
    });
  });

  group('Asserts', () {
    testWidgets('firstDate after lastDate fails', (tester) async {
      await _pumpPicker(
        tester,
        ImpaktfullUiDatePicker(
          selectedDate: DateTime(2023, 7, 10),
          firstDate: DateTime(2023, 7, 20),
          lastDate: DateTime(2023, 7, 5),
          onDateChanged: (_) {},
        ),
      );

      expect(tester.takeException(), isA<AssertionError>());
    });

    testWidgets('firstDate and lastDate on the same day is allowed',
        (tester) async {
      await _pumpPicker(
        tester,
        ImpaktfullUiDatePicker(
          selectedDate: DateTime(2023, 7, 10),
          firstDate: DateTime(2023, 7, 10, 16),
          lastDate: DateTime(2023, 7, 10, 8),
          onDateChanged: (_) {},
        ),
      );

      expect(tester.takeException(), isNull);
      expect(_cell(tester, '10').isDisabled, false);
      expect(_cell(tester, '11').isDisabled, true);
    });

    testWidgets('the date time picker asserts too', (tester) async {
      await _pumpPicker(
        tester,
        ImpaktfullUiDateTimePicker(
          value: DateTime(2023, 7, 10),
          firstDate: DateTime(2023, 7, 20),
          lastDate: DateTime(2023, 7, 5),
          onChanged: (_) {},
        ),
      );

      expect(tester.takeException(), isA<AssertionError>());
    });

    testWidgets('the date input field asserts too', (tester) async {
      await _pumpPicker(
        tester,
        ImpaktfullUiDateInputField(
          value: DateTime(2023, 7, 10),
          firstDate: DateTime(2023, 7, 20),
          lastDate: DateTime(2023, 7, 5),
          onChanged: (_) {},
        ),
      );

      expect(tester.takeException(), isA<AssertionError>());
    });
  });

  group('Every entry point', () {
    testWidgets('showModal disables the days outside the bounds',
        (tester) async {
      final context = await pumpOverlayApp(tester);
      DateTime? result;
      unawaited(ImpaktfullUiDatePicker.showModal(
        context: context,
        selectedDate: DateTime(2023, 7, 6),
        firstDate: DateTime(2023, 7, 5),
        lastDate: DateTime(2023, 7, 20),
      ).then((value) => result = value));
      await tester.pumpAndSettle();

      expect(_cell(tester, '21').isDisabled, true);
      await tapAndSettle(tester, _dayCell('21'));
      await tapAndSettle(tester, _dayCell('19'));
      await tapAndSettle(tester, find.text('Apply'));
      expect(result, DateTime(2023, 7, 19));
    });

    testWidgets('showRangeModal disables the days outside the bounds',
        (tester) async {
      final context = await pumpOverlayApp(tester);
      DateTimeRange? result;
      unawaited(ImpaktfullUiDatePicker.showRangeModal(
        context: context,
        selectedStartDate: null,
        selectedEndDate: null,
        firstDate: DateTime(2023, 7, 5),
        lastDate: DateTime(2023, 7, 20),
      ).then((value) => result = value));
      await tester.pumpAndSettle();

      expect(_cell(tester, '4').isDisabled, true);
      await tapAndSettle(tester, _dayCell('4'));
      await tapAndSettle(tester, _dayCell('6'));
      await tapAndSettle(tester, _dayCell('25'));
      await tapAndSettle(tester, _dayCell('12'));
      await tapAndSettle(tester, find.text('Apply'));
      expect(result?.start, DateTime(2023, 7, 6));
      expect(result?.end, DateTime(2023, 7, 12));
    });

    testWidgets('the date time picker disables the days outside the bounds',
        (tester) async {
      final changes = <DateTime>[];
      await _pumpPicker(
        tester,
        SingleChildScrollView(
          child: ImpaktfullUiDateTimePicker(
            value: DateTime(2023, 7, 10, 14, 30),
            firstDate: DateTime(2023, 7, 5),
            lastDate: DateTime(2023, 7, 20, 10),
            onChanged: changes.add,
          ),
        ),
      );

      expect(_cell(tester, '4').isDisabled, true);
      expect(_cell(tester, '21').isDisabled, true);
      // The bounds only limit the day: the last day keeps every time of day.
      expect(_cell(tester, '20').isDisabled, false);

      await tapAndSettle(tester, _dayCell('20'));
      expect(changes, [DateTime(2023, 7, 20, 14, 30)]);
    });

    testWidgets('the date time picker modal passes the bounds on',
        (tester) async {
      final context = await pumpOverlayApp(tester);
      unawaited(ImpaktfullUiDateTimePicker.showModal(
        context: context,
        value: DateTime(2023, 7, 10, 14, 30),
        firstDate: DateTime(2023, 7, 5),
        lastDate: DateTime(2023, 7, 20),
      ));
      await tester.pumpAndSettle();

      expect(_cell(tester, '4').isDisabled, true);
      expect(_cell(tester, '21').isDisabled, true);
      expect(_isArrowDisabled(tester, _previous), true);
      expect(_isArrowDisabled(tester, _next), true);
    });

    testWidgets('the date input field passes the bounds to its picker',
        (tester) async {
      final changes = <DateTime?>[];
      await pumpOverlayApp(
        tester,
        home: Center(
          child: ImpaktfullUiDateInputField(
            value: DateTime(2023, 7, 10),
            firstDate: DateTime(2023, 7, 5),
            lastDate: DateTime(2023, 7, 20),
            onChanged: changes.add,
          ),
        ),
      );

      await tapAndSettle(tester, find.byType(ImpaktfullUiCard));
      expect(_cell(tester, '21').isDisabled, true);
      expect(_cell(tester, '4').isDisabled, true);

      await tapAndSettle(tester, _dayCell('21'));
      await tapAndSettle(tester, _dayCell('18'));
      await tapAndSettle(tester, find.text('Apply'));
      expect(changes, [DateTime(2023, 7, 18)]);
    });
  });
}
