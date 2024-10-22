import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  DateTime get startOfTheDay => DateTime(year, month, day);

  DateTime get endOfTheDay => DateTime(year, month, day, 23, 59, 59);

  DateTime get tomorrow => add(const Duration(days: 1));

  DateTime get nextWeek => add(const Duration(days: 7));

  DateTime get yesterday => add(const Duration(days: -1));

  DateTime get previousWeek => add(const Duration(days: -7));

  DateTime get beginningOfTheWeek => add(Duration(days: weekday - 1));

  DateTime get endOfTheWeek => add(Duration(days: 7 - weekday));

  String format(String format) => DateFormat(format).format(this);

  DateTime getPreviousMonth() => copyWith(month: month - 1);

  DateTime getPreviousYear() => copyWith(year: year - 1);

  DateTime getNextYear() => copyWith(year: year + 1);

  DateTime getNextMonth() => copyWith(month: month + 1);

  bool isSameYear(DateTime date) => year == date.year;

  bool isSameMonth(DateTime date) => year == date.year && month == date.month;

  bool isSameDay(DateTime date) =>
      year == date.year && month == date.month && day == date.day;

  DateTime dateOnly() =>
      copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);

  int getDaysInMonth() => _getDaysForMonth(
        year: year,
        month: month,
      );

  DateTime setTime(int hour, int minute,
          [int second = 0, int millisecond = 0]) =>
      DateTime(
        year,
        month,
        day,
        hour,
        minute,
        second,
        millisecond,
      );
}

int getDayForMonthWithFallback(int year, int month, int day) {
  final daysInMonth = DateTime(year, month, 1).getDaysInMonth();
  return day > daysInMonth ? daysInMonth : day;
}

int _getDaysForMonth({
  required int year,
  required int month,
}) {
  // Map to hold the number of days in each month for non-leap years.
  Map<int, int> monthDays = {
    1: 31,
    2: 28,
    3: 31,
    4: 30,
    5: 31,
    6: 30,
    7: 31,
    8: 31,
    9: 30,
    10: 31,
    11: 30,
    12: 31,
  };

  // Check for leap year and adjust February's days if necessary.
  if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
    monthDays[2] = 29; // Adjusting for leap year
  }

  return monthDays[month]!;
}
