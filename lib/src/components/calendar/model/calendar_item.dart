import 'package:impaktfull_ui_2/impaktfull_ui.dart';

class ImpaktfullUiCalendarEvent {
  final String title;
  final DateTime startDate;
  final DateTime endDate;

  int get amountOfDaysCovered {
    final differenceInDays = endDate.difference(startDate).inDays;
    if (differenceInDays > 0) return differenceInDays + 1;
    if (endDate.isSameDay(startDate)) return 1;
    return 2;
  }

  const ImpaktfullUiCalendarEvent({
    required this.title,
    required this.startDate,
    required this.endDate,
  });
}
