import 'dart:math';

import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/calendar/calendar.dart';
import 'package:impaktfull_ui/src/components/calendar/widget/calender_types/week/calendar_week_event_item.dart';
import 'package:impaktfull_ui/src/util/extension/datetime_extensions.dart';
import 'package:impaktfull_ui/src/util/extension/list_extension.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

class ImpaktfullUiCalendarWeekFullDayEvents extends StatefulWidget {
  final List<ImpaktfullUiCalendarEvent> events;
  final DateTimeRange dateRange;
  final ImpaktfullUiCalendarTheme theme;
  final ValueChanged<ImpaktfullUiCalendarEvent> onEventTap;
  final int amountOfDays;

  const ImpaktfullUiCalendarWeekFullDayEvents({
    required this.events,
    required this.dateRange,
    required this.theme,
    required this.onEventTap,
    this.amountOfDays = 7,
    super.key,
  });

  @override
  State<ImpaktfullUiCalendarWeekFullDayEvents> createState() =>
      _ImpaktfullUiCalendarWeekFullDayEventsState();
}

class _ImpaktfullUiCalendarWeekFullDayEventsState
    extends State<ImpaktfullUiCalendarWeekFullDayEvents> {
  final _eventsPerDay = <int, List<ImpaktfullUiCalendarEvent>>{};
  final _dayOffsets = <int, int>{};

  @override
  void initState() {
    super.initState();
    _setEventsPerDay();
  }

  @override
  void didUpdateWidget(
      covariant ImpaktfullUiCalendarWeekFullDayEvents oldWidget) {
    super.didUpdateWidget(oldWidget);
    // if (oldWidget.amountOfDays != widget.amountOfDays || oldWidget.events != widget.events) {
    _setEventsPerDay();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) {
        return Container(
          decoration: BoxDecoration(
            color: componentTheme.colors.headerBackground,
          ),
          child: SizedBox(
            height: _calculateHeight(
                componentTheme.dimens.weekEventMinHeightExtraSmall),
            child: LayoutBuilder(
              builder: (context, constratins) {
                final widthPerDay = constratins.maxWidth / widget.amountOfDays;
                return Stack(
                  children: [
                    for (var dayIndex = 0;
                        dayIndex < widget.amountOfDays;
                        ++dayIndex) ...[
                      for (var eventIndex = 0;
                          eventIndex < _eventsPerDay[dayIndex]!.length;
                          ++eventIndex) ...[
                        Builder(
                          builder: (context) {
                            final event = _eventsPerDay[dayIndex]![eventIndex];
                            final dayOffset = _dayOffsets[dayIndex] ?? 0;
                            final amountOfDays = event.endDate
                                    .difference(event.startDate)
                                    .inDays +
                                1;
                            return Positioned(
                              top: (eventIndex + dayOffset) *
                                  componentTheme
                                      .dimens.weekEventMinHeightExtraSmall,
                              left: dayIndex * widthPerDay,
                              width: widthPerDay * amountOfDays,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                child: ImpaktfullUiCalendarWeekEventItem(
                                  event: event,
                                  height: componentTheme
                                      .dimens.weekEventMinHeightExtraSmall,
                                  onTap: () => widget.onEventTap(event),
                                  theme: widget.theme,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ],
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _setEventsPerDay() {
    final fullDayEvents = widget.events.where((event) {
      final startDate = event.startDate;
      final endDate = event.endDate;
      return (startDate.isBefore(widget.dateRange.end) &&
          endDate.isAfter(widget.dateRange.start));
    });
    _setFullDayEvents(fullDayEvents);
    _setDayOffset();
  }

  void _setFullDayEvents(Iterable<ImpaktfullUiCalendarEvent> events) {
    final fullDayEvents = <int, List<ImpaktfullUiCalendarEvent>>{};
    for (var i = 0; i < widget.amountOfDays; i++) {
      fullDayEvents[i] = [];
    }

    for (final event in events) {
      final startDate = event.startDate;
      final endDate = event.endDate;
      final duration = endDate.difference(startDate);
      if (duration < const Duration(hours: 23, minutes: 59, seconds: 59)) {
        continue;
      }
      final dayOfTheWeek = startDate.weekday - 1;
      fullDayEvents[dayOfTheWeek]?.add(event);
    }

    for (final dayEvents in fullDayEvents.values) {
      dayEvents.sortBy((a) => a.startDate);
    }

    _eventsPerDay.clear();
    _eventsPerDay.addAll(fullDayEvents);
  }

  void _setDayOffset() {
    final dayOffsets = <int, int>{};
    for (var i = 0; i < widget.amountOfDays; i++) {
      dayOffsets[i] = 0;
    }

    for (final event in widget.events) {
      final startDate = event.startDate;
      final endDate = event.endDate;
      if (endDate.difference(startDate) < const Duration(hours: 24)) continue;
      var currentDay = startDate;
      while (currentDay.isBefore(endDate) || currentDay.isSameDay(endDate)) {
        if (!currentDay.isSameDay(startDate)) {
          final dayOfTheWeek = currentDay.weekday - 1;
          final offset = dayOffsets[dayOfTheWeek] ?? 0;
          dayOffsets[dayOfTheWeek] = offset + 1;
        }
        currentDay = currentDay.add(const Duration(hours: 24));
      }
    }
    _dayOffsets.clear();
    _dayOffsets.addAll(dayOffsets);
  }

  double _calculateHeight(double componentHeight) {
    var maxAmountOfEvents = 0;
    for (var i = 0; i < widget.amountOfDays; ++i) {
      final amountOfEvents =
          (_eventsPerDay[i]?.length ?? 0) + (_dayOffsets[i] ?? 0);
      maxAmountOfEvents = max(maxAmountOfEvents, amountOfEvents);
    }
    final spacing = (maxAmountOfEvents - 1) * 4;
    return (maxAmountOfEvents * componentHeight) + spacing;
  }
}
