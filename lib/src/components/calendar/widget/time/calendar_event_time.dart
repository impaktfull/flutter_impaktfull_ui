import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/components/calendar/calendar.dart';
import 'package:impaktfull_ui/src/components/calendar/widget/calendar_locale_scope.dart';
import 'package:impaktfull_ui/src/util/extension/datetime_extensions.dart';
import 'package:impaktfull_ui/src/util/locale/locale_util.dart';

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
    final localizations =
        ImpaktfullUiCalendarLocaleScope.localizationsOf(context);
    final use24HourFormat =
        ImpaktfullUiCalendarLocaleScope.use24HourFormatOf(context);
    final sb = StringBuffer();
    final startDate = item.startDate;
    final endDate = item.endDate;
    if (forDate != null) {
      final amountOfDays = item.amountOfDaysCovered;
      if (amountOfDays > 1) {
        final dayX =
            (forDate!.startOfTheDay.difference(startDate.startOfTheDay).inDays +
                    1)
                .clamp(1, amountOfDays);
        sb.write(localizations.multiDayProgress(dayX, amountOfDays));
        sb.write(' ');
      }
    }
    if (startDate.isAtSameMomentAs(startDate.startOfTheDay) &&
        endDate.isAtSameMomentAs(endDate.endOfTheDay)) {
      sb.write(localizations.allDay);
    } else {
      sb.write(ImpaktfullUiLocaleUtil.formatTime(context, startDate,
          use24HourFormat: use24HourFormat));
      sb.write(' - ');
      sb.write(ImpaktfullUiLocaleUtil.formatTime(context, endDate,
          use24HourFormat: use24HourFormat));
    }
    return Text(
      sb.toString(),
      style: style,
    );
  }
}
