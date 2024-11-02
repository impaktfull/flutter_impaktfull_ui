import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/date_picker/widgets/date_picker_cell.dart';
import 'package:impaktfull_ui/src/util/extension/list_extension.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../util/test_util.dart';

void main() {
  final testDate = DateTime(2023, 07, 06);
  group('Smoke test', () {
    testWidgets('Data picker smoke without start date', (tester) async {
      smokeTest(tester, null);
    });
    testWidgets('Data picker smoke without start date', (tester) async {
      smokeTest(tester, testDate);
    });
  });

  group('Header actions', () {
    group('Days View', () {
      testWidgets('Tap on title (to months view)', (tester) async {
        final sut = ImpaktfullUiDatePicker(
          selectedDate: testDate,
          onDateChanged: (date) {},
        );
        await pumpAndSettleComponent(tester, sut);

        // Tap to go see all the months of the current year
        await tester.tap(find.text('July 2023'));
        await tester.pumpAndSettle();
        validateMonths();

        // Validate if 2023 is the only selected cell
        final selectedCells = find.findWidgets<ImpaktfullUiDatePickerCell>(
          tester,
          ImpaktfullUiDatePickerCell,
          (cell) => cell.isSelected,
        );
        expect(selectedCells.length, 1);
        expect(selectedCells.all((cell) => cell.value == 'July'), true);
        final unselectedCells = find.findWidgets<ImpaktfullUiDatePickerCell>(
          tester,
          ImpaktfullUiDatePickerCell,
          (cell) => !cell.isSelected,
        );
        expect(unselectedCells.length, 11);
        expect(unselectedCells.all((cell) => cell.value != 'July'), true);
      });
      testWidgets('Right actions', (tester) async {
        final sut = ImpaktfullUiDatePicker(
          selectedDate: testDate,
          onDateChanged: (date) {},
        );
        await pumpAndSettleComponent(tester, sut);

        expect(find.text('July 2023'), findsOneWidget);
        await tester.tap(find.byIcon(PhosphorIcons.arrowRight()));
        await tester.pumpAndSettle();

        expect(find.text('August 2023'), findsOneWidget);
      });
    });
    group('Months View', () {
      testWidgets('Tap on title (to years view)', (tester) async {
        final sut = ImpaktfullUiDatePicker(
          selectedDate: testDate,
          onDateChanged: (date) {},
        );
        await pumpAndSettleComponent(tester, sut);

        // Tap to go see all the months of the current year
        await tester.tap(find.text('July 2023'));
        await tester.pumpAndSettle();
        validateMonths();

        // Tap to go see all the years of the current decade
        await tester.tap(find.text('2023'));
        await tester.pumpAndSettle();
        validateYears(2020);

        // Validate if 2023 is the only selected cell
        final selectedCells = find.findWidgets<ImpaktfullUiDatePickerCell>(
          tester,
          ImpaktfullUiDatePickerCell,
          (cell) => cell.isSelected,
        );
        expect(selectedCells.length, 1);
        expect(selectedCells.all((cell) => cell.value == '2023'), true);
        final unselectedCells = find.findWidgets<ImpaktfullUiDatePickerCell>(
          tester,
          ImpaktfullUiDatePickerCell,
          (cell) => !cell.isSelected,
        );
        expect(unselectedCells.length, 9);
        expect(unselectedCells.all((cell) => cell.value != '2023'), true);
      });
      testWidgets('Right actions', (tester) async {
        final sut = ImpaktfullUiDatePicker(
          selectedDate: testDate,
          onDateChanged: (date) {},
        );
        await pumpAndSettleComponent(tester, sut);

        // Tap to go see all the months of the current year
        await tester.tap(find.text('July 2023'));
        await tester.pumpAndSettle();
        validateMonths();

        // Tap to go see all the years of the current decade
        expect(find.text('2023'), findsOneWidget);
        await tester.tap(find.byIcon(PhosphorIcons.arrowRight()));
        await tester.pumpAndSettle();
        expect(find.text('2024'), findsOneWidget);
      });
    });
    group('Years View', () {
      testWidgets('Tap on title (to years view and to months view)', (tester) async {
        final sut = ImpaktfullUiDatePicker(
          selectedDate: testDate,
          onDateChanged: (date) {},
        );
        await pumpAndSettleComponent(tester, sut);

        // Tap to go see all the months of the current year
        await tester.tap(find.text('July 2023'));
        await tester.pumpAndSettle();
        validateMonths();

        // Tap to go see all the years of the current decade
        await tester.tap(find.text('2023'));
        await tester.pumpAndSettle();
        validateYears(2020);

        // Tap to go back to the months of the current year
        await tester.tap(find.text('Select a year'));
        await tester.pumpAndSettle();
        expect(find.text('2023'), findsOneWidget);
      });
      testWidgets('Right actions', (tester) async {
        final sut = ImpaktfullUiDatePicker(
          selectedDate: testDate,
          onDateChanged: (date) {},
        );
        await pumpAndSettleComponent(tester, sut);

        // Tap to go see all the months of the current year
        await tester.tap(find.text('July 2023'));
        await tester.pumpAndSettle();
        validateMonths();

        // Tap to go see all the years of the current decade
        await tester.tap(find.text('2023'));
        await tester.pumpAndSettle();
        validateYears(2020);
        await tester.tap(find.byIcon(PhosphorIcons.arrowRight()));
        await tester.pumpAndSettle();
        validateYears(2030);
      });
    });
  });

  group('E2E', () {
    testWidgets('Monkey test', (tester) async {
      final sut = ImpaktfullUiDatePicker(
        selectedDate: testDate,
        onDateChanged: (date) {},
      );
      await pumpAndSettleComponent(tester, sut);

      // Tap to go see all the months of the current year
      await tester.tap(find.text('July 2023'));
      await tester.pumpAndSettle();

      // Tap to go see all the years of the current decade
      await tester.tap(find.text('2023'));
      await tester.pumpAndSettle();
      validateYears(2020);
      await tester.tap(find.text('2022'));
      await tester.pumpAndSettle();
      validateMonths();
      await tester.tap(find.text('July'));
      await tester.pumpAndSettle();
      expect(find.text('July 2022'), findsOneWidget);
      await tester.tap(find.text('6'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('July 2022'));
      await tester.pumpAndSettle();
      expect(find.text('2022'), findsOneWidget);
      await tester.tap(find.byIcon(PhosphorIcons.arrowLeft()));
      await tester.pumpAndSettle();
      expect(find.text('2010'), findsNothing);
      expect(find.text('2021'), findsOneWidget);
      await tester.tap(find.byIcon(PhosphorIcons.arrowLeft()));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(PhosphorIcons.arrowLeft()));
      await tester.pumpAndSettle();
      await tester.tap(find.text('2019'));
      await tester.pumpAndSettle();
      validateYears(2010);
    });
  });
}

Future<void> smokeTest(WidgetTester tester, DateTime? dateTime) async {
  final activeDate = dateTime ?? DateTime.now();
  final sut = ImpaktfullUiDatePicker(
    selectedDate: dateTime,
    onDateChanged: (date) {},
  );
  await pumpAndSettleComponent(tester, sut);
  final arrowRight = find.byIcon(PhosphorIcons.arrowRight());
  final arrowLeft = find.byIcon(PhosphorIcons.arrowLeft());

  // Days view
  final daysViewTitle = find.text(DateFormat.yMMMM().format(activeDate));
  expect(daysViewTitle, findsOneWidget);
  expect(arrowRight, findsOneWidget);
  expect(arrowLeft, findsOneWidget);
  await tester.tap(daysViewTitle);
  await tester.pumpAndSettle();

  // Months view
  final monthsViewTitle = find.text(DateFormat.y().format(activeDate));
  expect(monthsViewTitle, findsOneWidget);
  expect(arrowRight, findsOneWidget);
  expect(arrowLeft, findsOneWidget);
  expect(find.text(DateFormat.MMMM().format(activeDate)), findsOneWidget);
  await tester.tap(monthsViewTitle);
  await tester.pumpAndSettle();

  // Years view
  final yearViewTitle = find.text('Select a year');
  expect(yearViewTitle, findsOneWidget);
  expect(arrowRight, findsOneWidget);
  expect(arrowLeft, findsOneWidget);
  expect(find.text(DateFormat.y().format(activeDate)), findsOneWidget);
  await tester.tap(yearViewTitle);
  await tester.pumpAndSettle();
  expect(monthsViewTitle, findsOneWidget);
}

void validateWeekDays() {
  // Weekdays
  final days = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];
  for (var day in days) {
    expect(find.text(day), findsOneWidget);
  }
}

void validateMonths() {
  // Months cells
  final months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  for (var month in months) {
    expect(find.text(month), findsOneWidget);
  }
}

void validateYears(int decade) {
  // Year cells
  for (var month in List.generate(10, (index) => decade + index)) {
    expect(find.text(month.toString()), findsOneWidget);
  }
}
