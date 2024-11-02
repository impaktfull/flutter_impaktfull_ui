import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/components/calendar/calendar.dart';
import 'package:impaktfull_ui/src/util/extension/datetime_extensions.dart';

class ImpaktfullUiCalendarEventTime extends StatelessWidget {
  final ImpaktfullUiCalendarEvent item;
  final DateTime? forDate;
  final TextStyle style;
  const ImpaktfullUiCalendarEventTime({
    required this.item,
    required this.style,
    this.forDate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final sb = StringBuffer();
    final startDate = item.startDate;
    final endDate = item.endDate;
    if (forDate != null) {
      final amountOfDays = item.amountOfDaysCovered;
      if (amountOfDays > 1) {
        final dayX = (forDate!.startOfTheDay.difference(startDate.startOfTheDay).inDays + 1).clamp(1, amountOfDays);
        sb.write('($dayX/$amountOfDays days)');
        sb.write(' ');
      }
    }
    if (startDate.isAtSameMomentAs(startDate.startOfTheDay) && endDate.isAtSameMomentAs(endDate.endOfTheDay)) {
      sb.write('All day');
    } else {
      sb.write(startDate.format('HH:mm'));
      sb.write(' - ');
      sb.write(endDate.format('HH:mm'));
    }
    return Text(
      sb.toString(),
      style: style,
    );
  }
}
