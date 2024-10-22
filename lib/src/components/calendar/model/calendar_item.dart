class ImpaktfullUiCalendarItem {
  final String title;
  final bool isAllDay;
  final DateTime startDate;
  final DateTime? endDate;

  const ImpaktfullUiCalendarItem({
    required this.title,
    required this.startDate,
    this.endDate,
    this.isAllDay = false,
  });
}
