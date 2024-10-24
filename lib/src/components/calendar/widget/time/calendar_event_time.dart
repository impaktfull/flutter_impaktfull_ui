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
    return Text.rich(
      style: style,
      TextSpan(
        children: [
          if (item.isAllDay) ...[
            const TextSpan(text: 'All day'),
          ] else ...[
            TextSpan(text: item.startDate.format('HH:mm')),
            if (item.endDate != null) ...[
              const TextSpan(text: ' - '),
              TextSpan(text: item.endDate!.format('HH:mm')),
            ],
          ],
        ],
      ),
    );
  }
}
