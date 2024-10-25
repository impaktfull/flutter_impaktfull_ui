import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/components/calendar/calendar.dart';
import 'package:impaktfull_ui_2/src/util/extension/datetime_extensions.dart';

class ImpaktfullUiCalendarEventTime extends StatelessWidget {
  final ImpaktfullUiCalendarEvent item;
  final TextStyle style;
  const ImpaktfullUiCalendarEventTime({
    required this.item,
    required this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final sb = StringBuffer();
    final startDate = item.startDate;
    final endDate = item.endDate;
    if (startDate.isAtSameMomentAs(startDate.startOfTheDay) &&
        endDate.isAtSameMomentAs(endDate.endOfTheDay)) {
      sb.write('All day');
    } else {
      sb.write(item.startDate.format('HH:mm'));
      sb.write(' - ');
      sb.write(item.endDate.format('HH:mm'));
    }
    return Text(
      sb.toString(),
      style: style,
    );
  }
}
