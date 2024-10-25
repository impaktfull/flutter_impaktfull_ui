import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/calendar/calendar.dart';
import 'package:impaktfull_ui_2/src/components/calendar/widget/calender_types/week/calendar_week_event_item.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/extension/datetime_extensions.dart';

class ImpaktfullUiCalendarWeekEvents extends StatefulWidget {
  final DateTimeRange dateRange;
  final List<ImpaktfullUiCalendarEvent> events;
  final ValueChanged<ImpaktfullUiCalendarEvent> onEventTap;
  final ImpaktfullUiCalendarTheme? theme;

  const ImpaktfullUiCalendarWeekEvents({
    required this.events,
    required this.dateRange,
    required this.onEventTap,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiCalendarWeekEvents> createState() => _ImpaktfullUiCalendarWeekEventsState();
}

class _ImpaktfullUiCalendarWeekEventsState extends State<ImpaktfullUiCalendarWeekEvents> {
  final _weekEvents = <ImpaktfullUiCalendarEvent>[];

  @override
  void initState() {
    super.initState();
    _setWeekEvents();
  }

  @override
  void didUpdateWidget(covariant ImpaktfullUiCalendarWeekEvents oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.events != widget.events || oldWidget.dateRange != widget.dateRange) {
      _setWeekEvents();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiCalendarTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => ImpaktfullUiAutoLayout.horizontal(
        children: [
          for (var dayIndex = 0; dayIndex < 7; ++dayIndex) ...[
            Expanded(
              child: Stack(
                children: _weekEvents.where((event) {
                  final eventStartDate = event.startDate;
                  final eventEndDate = event.endDate;
                  final currentDayDate = widget.dateRange.start.add(Duration(days: dayIndex));
                  return eventStartDate.isSameDay(currentDayDate) || eventEndDate.isSameDay(currentDayDate);
                }).map((event) {
                  final currentDayDate = widget.dateRange.start.add(Duration(days: dayIndex));
                  final startDateTime =
                      event.startDate.isSameDay(currentDayDate) ? event.startDate : currentDayDate.startOfTheDay;
                  final endDateTime =
                      event.endDate.isSameDay(currentDayDate) ? event.endDate : currentDayDate.endOfTheDay;

                  final top = (startDateTime.hour + (startDateTime.minute / 60)) * componentTheme.dimens.weekHourHeight;
                  final maxDifferenceInHours = (endDateTime.difference(startDateTime).inMinutes / 60).clamp(0.0, 24.0);
                  final height = maxDifferenceInHours * componentTheme.dimens.weekHourHeight;

                  return Positioned(
                    top: top,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: ImpaktfullUiCalendarWeekEventItem(
                        event: event,
                        height: height,
                        onTap: () => widget.onEventTap(event),
                        theme: componentTheme,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _setWeekEvents() {
    final weekEvents = widget.events.where((event) {
      final startDate = event.startDate;
      final endDate = event.endDate;
      final duration = endDate.difference(startDate);
      if (duration >= const Duration(hours: 23, minutes: 59, seconds: 59)) {
        return false;
      }
      return (startDate.isAfter(widget.dateRange.start.subtract(const Duration(days: 1))) &&
              startDate.isBefore(widget.dateRange.end.add(const Duration(days: 1)))) ||
          (endDate.isAfter(widget.dateRange.start.subtract(const Duration(days: 1))) &&
              endDate.isBefore(widget.dateRange.end.add(const Duration(days: 1))));
    });
    _weekEvents.clear();
    _weekEvents.addAll(weekEvents);
  }
}
