import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/src/util/extension/datetime_extensions.dart';

void main() {
  // Wednesday 12 June 2024, 14:30:15.250. UTC, so the results do not depend
  // on the daylight saving time of the machine that runs the tests.
  final date = DateTime.utc(2024, 6, 12, 14, 30, 15, 250);

  group('start and end of the day', () {
    test('startOfTheDay resets the time', () {
      expect(date.startOfTheDay, DateTime(2024, 6, 12));
    });

    test('endOfTheDay is 23:59:59', () {
      expect(date.endOfTheDay, DateTime(2024, 6, 12, 23, 59, 59));
    });

    test('dateOnly resets the time and keeps utc', () {
      final result = date.dateOnly();
      expect(result, DateTime.utc(2024, 6, 12));
      expect(result.isUtc, isTrue);
    });

    test('setTime keeps the date and sets the time', () {
      expect(date.setTime(8, 5), DateTime(2024, 6, 12, 8, 5));
      expect(date.setTime(8, 5, 3, 7), DateTime(2024, 6, 12, 8, 5, 3, 7));
    });
  });

  group('relative days', () {
    test('tomorrow and yesterday', () {
      expect(date.tomorrow, DateTime.utc(2024, 6, 13, 14, 30, 15, 250));
      expect(date.yesterday, DateTime.utc(2024, 6, 11, 14, 30, 15, 250));
    });

    test('nextWeek and previousWeek', () {
      expect(date.nextWeek, DateTime.utc(2024, 6, 19, 14, 30, 15, 250));
      expect(date.previousWeek, DateTime.utc(2024, 6, 5, 14, 30, 15, 250));
    });

    test('tomorrow crosses the end of the month and year', () {
      expect(DateTime.utc(2024, 12, 31).tomorrow, DateTime.utc(2025, 1, 1));
      expect(DateTime.utc(2025, 1, 1).yesterday, DateTime.utc(2024, 12, 31));
    });
  });

  group('week', () {
    test('beginningOfTheWeek is the monday of the week', () {
      expect(
          date.beginningOfTheWeek, DateTime.utc(2024, 6, 10, 14, 30, 15, 250));
    });

    test('endOfTheWeek is the sunday of the week', () {
      expect(date.endOfTheWeek, DateTime.utc(2024, 6, 16, 14, 30, 15, 250));
    });

    test('beginning and end of the week of a monday and a sunday', () {
      final monday = DateTime.utc(2024, 6, 10);
      final sunday = DateTime.utc(2024, 6, 16);
      expect(monday.beginningOfTheWeek, monday);
      expect(monday.endOfTheWeek, sunday);
      expect(sunday.beginningOfTheWeek, monday);
      expect(sunday.endOfTheWeek, sunday);
    });

    test('a week that spans two months and two years', () {
      // Wednesday 1 January 2025
      final newYear = DateTime.utc(2025, 1, 1);
      expect(newYear.beginningOfTheWeek, DateTime.utc(2024, 12, 30));
      expect(newYear.endOfTheWeek, DateTime.utc(2025, 1, 5));
    });

    test('thisWeek<Day> returns every day of the week', () {
      final days = [
        date.thisWeekMonday,
        date.thisWeekTuesday,
        date.thisWeekWednesday,
        date.thisWeekThursday,
        date.thisWeekFriday,
        date.thisWeekSaturday,
        date.thisWeekSunday,
      ];
      expect(days.map((e) => e.weekday), [1, 2, 3, 4, 5, 6, 7]);
      expect(days.map((e) => e.day), [10, 11, 12, 13, 14, 15, 16]);
    });

    test('every day of a year has its week from monday to sunday (utc)', () {
      var day = DateTime.utc(2024, 1, 1, 0, 30);
      while (day.year == 2024) {
        expect(day.beginningOfTheWeek.weekday, DateTime.monday, reason: '$day');
        expect(day.endOfTheWeek.weekday, DateTime.sunday, reason: '$day');
        day = day.tomorrow;
      }
    });

    test('every day of a year has its week from monday to sunday (local time)',
        () {
      // Local time crosses the daylight saving time switch, where a day is
      // 23 or 25 hours long.
      var day = DateTime(2024, 1, 1, 23, 30);
      while (day.year == 2024) {
        expect(day.beginningOfTheWeek.weekday, DateTime.monday, reason: '$day');
        expect(day.endOfTheWeek.weekday, DateTime.sunday, reason: '$day');
        day = DateTime(day.year, day.month, day.day + 1, 23, 30);
      }
    });
  });

  group('month and year', () {
    test('getNextMonth and getPreviousMonth', () {
      expect(date.getNextMonth(), DateTime.utc(2024, 7, 12, 14, 30, 15, 250));
      expect(
          date.getPreviousMonth(), DateTime.utc(2024, 5, 12, 14, 30, 15, 250));
    });

    test('getNextMonth and getPreviousMonth roll over the year', () {
      expect(DateTime.utc(2024, 12, 1).getNextMonth(), DateTime.utc(2025, 1));
      expect(
          DateTime.utc(2024, 1, 1).getPreviousMonth(), DateTime.utc(2023, 12));
    });

    test('getNextMonth and getPreviousMonth stay in the next/previous month',
        () {
      expect(DateTime.utc(2024, 1, 31).getNextMonth().month, 2);
      expect(DateTime.utc(2024, 3, 31).getPreviousMonth().month, 2);
      expect(DateTime.utc(2024, 5, 31).getNextMonth().month, 6);
    });

    test('getNextMonth and getPreviousMonth clamp to the last day', () {
      expect(DateTime.utc(2024, 1, 31, 10, 5).getNextMonth(),
          DateTime.utc(2024, 2, 29, 10, 5));
      expect(
          DateTime.utc(2023, 1, 31).getNextMonth(), DateTime.utc(2023, 2, 28));
      expect(DateTime.utc(2024, 3, 31).getPreviousMonth(),
          DateTime.utc(2024, 2, 29));
      expect(
          DateTime.utc(2024, 12, 31).getNextMonth(), DateTime.utc(2025, 1, 31));
      expect(DateTime.utc(2025, 1, 31).getPreviousMonth(),
          DateTime.utc(2024, 12, 31));
      expect(DateTime(2024, 10, 31).getNextMonth(), DateTime(2024, 11, 30));
      expect(DateTime.utc(2024, 1, 31).getNextMonth().isUtc, isTrue);
    });

    test('beginning and end of the week keep the time in local time', () {
      // Monday 25 March 2024, the week of the daylight saving time switch in
      // Europe.
      final monday = DateTime(2024, 3, 25, 23, 30);
      expect(monday.endOfTheWeek, DateTime(2024, 3, 31, 23, 30));
      expect(DateTime(2024, 3, 31, 0, 30).beginningOfTheWeek,
          DateTime(2024, 3, 25, 0, 30));
    });

    test('getNextYear and getPreviousYear', () {
      expect(date.getNextYear(), DateTime.utc(2025, 6, 12, 14, 30, 15, 250));
      expect(
          date.getPreviousYear(), DateTime.utc(2023, 6, 12, 14, 30, 15, 250));
    });

    test('getDaysInMonth for every month of a non leap year', () {
      final days = [
        for (var month = 1; month <= 12; month++)
          DateTime(2023, month).getDaysInMonth(),
      ];
      expect(days, [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]);
    });

    test('getDaysInMonth of february in leap years', () {
      expect(DateTime(2024, 2).getDaysInMonth(), 29);
      expect(DateTime(2000, 2).getDaysInMonth(), 29);
      expect(DateTime(1900, 2).getDaysInMonth(), 28);
      expect(DateTime(2100, 2).getDaysInMonth(), 28);
    });

    test('dayForMonthWithFallback clamps to the last day of the month', () {
      expect(dayForMonthWithFallback(2024, 2, 31), 29);
      expect(dayForMonthWithFallback(2023, 2, 31), 28);
      expect(dayForMonthWithFallback(2024, 4, 31), 30);
      expect(dayForMonthWithFallback(2024, 1, 31), 31);
      expect(dayForMonthWithFallback(2024, 6, 12), 12);
    });
  });

  group('comparisons', () {
    test('isSameDay ignores the time', () {
      expect(date.isSameDay(DateTime.utc(2024, 6, 12)), isTrue);
      expect(date.isSameDay(DateTime.utc(2024, 6, 12, 23, 59, 59)), isTrue);
    });

    test('isSameDay is false for another day, month or year', () {
      expect(date.isSameDay(DateTime.utc(2024, 6, 13)), isFalse);
      expect(date.isSameDay(DateTime.utc(2024, 7, 12)), isFalse);
      expect(date.isSameDay(DateTime.utc(2023, 6, 12)), isFalse);
    });

    test('isSameMonth', () {
      expect(date.isSameMonth(DateTime.utc(2024, 6, 1)), isTrue);
      expect(date.isSameMonth(DateTime.utc(2024, 7, 12)), isFalse);
      expect(date.isSameMonth(DateTime.utc(2023, 6, 12)), isFalse);
    });

    test('isSameYear', () {
      expect(date.isSameYear(DateTime.utc(2024, 1, 1)), isTrue);
      expect(date.isSameYear(DateTime.utc(2025, 6, 12)), isFalse);
    });
  });

  group('format', () {
    test('formats with an intl pattern', () {
      expect(date.format('yyyy-MM-dd'), '2024-06-12');
      expect(date.format('dd/MM/yyyy HH:mm:ss'), '12/06/2024 14:30:15');
      expect(date.format('EEEE d MMMM'), 'Wednesday 12 June');
    });
  });
}
