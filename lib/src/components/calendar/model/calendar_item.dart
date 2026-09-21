class ImpaktfullUiCalendarEvent {
  final String title;
  final DateTime startDate;
  final DateTime endDate;

  int get amountOfDaysCovered {
    // Compare the calendar days (not the duration): an event from 20:00 until
    // 09:00 two days later covers 3 days. Use UTC dates, so a daylight saving
    // time change does not make a day shorter or longer than 24 hours.
    final start = DateTime.utc(startDate.year, startDate.month, startDate.day);
    final end = DateTime.utc(endDate.year, endDate.month, endDate.day);
    final differenceInDays = end.difference(start).inDays;
    if (differenceInDays < 0) return 1;
    return differenceInDays + 1;
  }

  const ImpaktfullUiCalendarEvent({
    required this.title,
    required this.startDate,
    required this.endDate,
  });
}
