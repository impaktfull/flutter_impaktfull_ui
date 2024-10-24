class ImpaktfullUiCalendarEvent {
  final String title;
  final bool isAllDay;
  final DateTime startDate;
  final DateTime? endDate;

  const ImpaktfullUiCalendarEvent({
    required this.title,
    required this.startDate,
    this.endDate,
    this.isAllDay = false,
  });
}
