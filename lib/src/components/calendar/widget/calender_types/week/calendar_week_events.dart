import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/calendar/calendar.dart';
import 'package:impaktfull_ui_2/src/components/calendar/widget/calender_types/week/calendar_week_event_item.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';

class ImpaktfullUiCalendarWeekEvents extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiCalendarTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final weekEvents = events.where((event) {
          final startDate = event.startDate;
          final endDate = event.endDate;
          return (startDate.isAfter(dateRange.start.subtract(const Duration(days: 1))) &&
                  startDate.isBefore(dateRange.end.add(const Duration(days: 1)))) ||
              (endDate != null &&
                  endDate.isAfter(dateRange.start.subtract(const Duration(days: 1))) &&
                  endDate.isBefore(dateRange.end.add(const Duration(days: 1))));
        });
        return ImpaktfullUiAutoLayout.horizontal(
          children: [
            for (var dayIndex = 0; dayIndex < 7; ++dayIndex) ...[
              Expanded(
                child: Stack(
                  children: [
                    // Background grid
                    ImpaktfullUiAutoLayout.vertical(
                      children: [
                        for (var hourIndex = 0; hourIndex < 24; hourIndex++) ...[
                          SizedBox(
                            height: componentTheme.dimens.weekHourHeight,
                            width: double.infinity,
                          ),
                        ],
                      ],
                    ),
                    // Events
                    ...weekEvents.where((event) {
                      final eventStartDate = event.startDate;
                      final eventEndDate = event.endDate ?? event.startDate;
                      final currentDayDate = dateRange.start.add(Duration(days: dayIndex));
                      return (eventStartDate.isBefore(currentDayDate.add(const Duration(days: 1))) &&
                              eventEndDate.isAfter(currentDayDate)) ||
                          eventStartDate.day == currentDayDate.day;
                    }).map((event) {
                      final startHour = event.startDate.hour + (event.startDate.minute / 60);
                      final endHour = event.endDate != null
                          ? event.endDate!.hour + (event.endDate!.minute / 60)
                          : startHour + 1; // Default to 1 hour if no end date
                      final top = startHour * componentTheme.dimens.weekHourHeight;
                      final height = (endHour - startHour) * componentTheme.dimens.weekHourHeight;

                      return Positioned(
                        top: top,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: ImpaktfullUiCalendarWeekEventItem(
                            event: event,
                            height: height,
                            onTap: () => onEventTap(event),
                            theme: componentTheme,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
