/// The dates a date picker allows: `firstDate` is the earliest date the user
/// can pick, `lastDate` the latest one. `null` means unbounded.
///
/// Every comparison happens on calendar days, the time of day is ignored: a
/// [lastDate] of 23/09/2026 10:00 still allows picking 23/09/2026.
class ImpaktfullUiDatePickerBounds {
  final DateTime? firstDate;
  final DateTime? lastDate;

  const ImpaktfullUiDatePickerBounds({
    this.firstDate,
    this.lastDate,
  });

  static const unbounded = ImpaktfullUiDatePickerBounds();

  /// Whether the user can pick [date].
  bool isDayEnabled(DateTime date) {
    final first = firstDate;
    if (first != null && _day(date) < _day(first)) return false;
    final last = lastDate;
    if (last != null && _day(date) > _day(last)) return false;
    return true;
  }

  /// Whether the month of [date] holds at least one day the user can pick.
  bool isMonthEnabled(DateTime date) {
    final first = firstDate;
    if (first != null && _month(date) < _month(first)) return false;
    final last = lastDate;
    if (last != null && _month(date) > _month(last)) return false;
    return true;
  }

  /// Whether [year] holds at least one day the user can pick.
  bool isYearEnabled(int year) {
    final first = firstDate;
    if (first != null && year < first.year) return false;
    final last = lastDate;
    if (last != null && year > last.year) return false;
    return true;
  }

  /// [date] moved into the bounds: [firstDate] when it is before the first
  /// date, [lastDate] when it is after the last date, [date] itself when it
  /// is inside the bounds.
  DateTime clamp(DateTime date) {
    final first = firstDate;
    if (first != null && _day(date) < _day(first)) return first;
    final last = lastDate;
    if (last != null && _day(date) > _day(last)) return last;
    return date;
  }

  /// The amount of months between [date] and [firstDate], or `null` when
  /// there is no first date.
  int? monthsSinceFirstDate(DateTime date) {
    final first = firstDate;
    if (first == null) return null;
    return _month(date) - _month(first);
  }

  /// The amount of months between [lastDate] and [date], or `null` when there
  /// is no last date.
  int? monthsUntilLastDate(DateTime date) {
    final last = lastDate;
    if (last == null) return null;
    return _month(last) - _month(date);
  }

  int? yearsSinceFirstDate(DateTime date) {
    final first = firstDate;
    if (first == null) return null;
    return date.year - first.year;
  }

  int? yearsUntilLastDate(DateTime date) {
    final last = lastDate;
    if (last == null) return null;
    return last.year - date.year;
  }

  int? decadesSinceFirstDate(DateTime date) {
    final first = firstDate;
    if (first == null) return null;
    return (date.year ~/ 10) - (first.year ~/ 10);
  }

  int? decadesUntilLastDate(DateTime date) {
    final last = lastDate;
    if (last == null) return null;
    return (last.year ~/ 10) - (date.year ~/ 10);
  }

  /// Whether [firstDate] is on or before [lastDate].
  static bool isValid(DateTime? firstDate, DateTime? lastDate) =>
      firstDate == null ||
      lastDate == null ||
      _day(firstDate) <= _day(lastDate);

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiDatePickerBounds &&
      other.firstDate == firstDate &&
      other.lastDate == lastDate;

  @override
  int get hashCode => Object.hash(firstDate, lastDate);

  static int _day(DateTime date) =>
      date.year * 10000 + date.month * 100 + date.day;

  static int _month(DateTime date) => date.year * 12 + date.month;
}

/// Fails in debug mode when [firstDate] is after [lastDate].
///
/// The constructors of the date pickers are `const`, and a `const` constructor
/// can not assert on a `DateTime` (reading `year` is not a constant
/// expression), so every date picker calls this from `initState` (or from the
/// static modal helper).
void assertValidDatePickerBounds(DateTime? firstDate, DateTime? lastDate) {
  assert(
    ImpaktfullUiDatePickerBounds.isValid(firstDate, lastDate),
    'firstDate ($firstDate) must be on or before lastDate ($lastDate).',
  );
}
