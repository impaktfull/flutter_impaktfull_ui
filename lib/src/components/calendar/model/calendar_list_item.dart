import 'package:impaktfull_ui/src/components/calendar/calendar.dart';

class ImpaktfullUiCalendarListItemModel {
  final DateTime date;
  final ImpaktfullUiCalendarEvent event;

  const ImpaktfullUiCalendarListItemModel({
    required this.date,
    required this.event,
  });
}
