import 'dart:math';

import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/calendar/calendar.dart';
import 'package:impaktfull_ui/src/components/calendar/widget/calendar_types/week/calendar_week_event_item.dart';
import 'package:impaktfull_ui/src/util/extension/list_extension.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

class ImpaktfullUiCalendarWeekFullDayEvents extends StatefulWidget {
  final List<ImpaktfullUiCalendarEvent> events;
  final DateTimeRange dateRange;
  final ImpaktfullUiCalendarTheme theme;
  final ValueChanged<ImpaktfullUiCalendarEvent> onEventTapped;
  final int amountOfDays;

  const ImpaktfullUiCalendarWeekFullDayEvents({
    required this.events,
    required this.dateRange,
    required this.theme,
    required this.onEventTapped,
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
                            final amountOfDays =
                                _getVisibleDays(event)!.$2 - dayIndex + 1;
                            return PositionedDirectional(
                              top: (eventIndex + dayOffset) *
                                  componentTheme
                                      .dimens.weekEventMinHeightExtraSmall,
                              start: dayIndex * widthPerDay,
                              width: widthPerDay * amountOfDays,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                child: ImpaktfullUiCalendarWeekEventItem(
                                  event: event,
                                  height: componentTheme
                                      .dimens.weekEventMinHeightExtraSmall,
                                  onTap: () => widget.onEventTapped(event),
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
      final duration = event.endDate.difference(event.startDate);
      if (duration < const Duration(hours: 23, minutes: 59, seconds: 59)) {
        return false;
      }
      return _getVisibleDays(event) != null;
    }).toList();
    _setFullDayEvents(fullDayEvents);
    _setDayOffset(fullDayEvents);
  }

  void _setFullDayEvents(List<ImpaktfullUiCalendarEvent> events) {
    final fullDayEvents = <int, List<ImpaktfullUiCalendarEvent>>{};
    for (var i = 0; i < widget.amountOfDays; i++) {
      fullDayEvents[i] = [];
    }

    for (final event in events) {
      final (firstDay, _) = _getVisibleDays(event)!;
      fullDayEvents[firstDay]!.add(event);
    }

    for (final dayEvents in fullDayEvents.values) {
      dayEvents.sortBy((a) => a.startDate);
    }

    _eventsPerDay.clear();
    _eventsPerDay.addAll(fullDayEvents);
  }

  /// Only the events shown in this week push the events of the next days down.
  void _setDayOffset(List<ImpaktfullUiCalendarEvent> events) {
    final dayOffsets = <int, int>{};
    for (var i = 0; i < widget.amountOfDays; i++) {
      dayOffsets[i] = 0;
    }

    for (final event in events) {
      final (firstDay, lastDay) = _getVisibleDays(event)!;
      for (var day = firstDay + 1; day <= lastDay; day++) {
        dayOffsets[day] = dayOffsets[day]! + 1;
      }
    }
    _dayOffsets.clear();
    _dayOffsets.addAll(dayOffsets);
  }

  /// The first and last column (0 based, relative to the start of
  /// [ImpaktfullUiCalendarWeekFullDayEvents.dateRange]) this event is shown in,
  /// or null when the event is not visible in this date range.
  (int, int)? _getVisibleDays(ImpaktfullUiCalendarEvent event) {
    final startDay = _daysBetween(widget.dateRange.start, event.startDate);
    final amountOfDays = event.endDate.difference(event.startDate).inDays + 1;
    final endDay = startDay + amountOfDays - 1;
    if (endDay < 0 || startDay > widget.amountOfDays - 1) return null;
    return (max(0, startDay), min(widget.amountOfDays - 1, endDay));
  }

  static int _daysBetween(DateTime from, DateTime to) =>
      DateTime.utc(to.year, to.month, to.day)
          .difference(DateTime.utc(from.year, from.month, from.day))
          .inDays;

  double _calculateHeight(double componentHeight) {
    var maxAmountOfEvents = 0;
    for (var i = 0; i < widget.amountOfDays; ++i) {
      final amountOfEvents =
          (_eventsPerDay[i]?.length ?? 0) + (_dayOffsets[i] ?? 0);
      maxAmountOfEvents = max(maxAmountOfEvents, amountOfEvents);
    }
    if (maxAmountOfEvents == 0) return 0;
    final spacing = (maxAmountOfEvents - 1) * 4;
    return (maxAmountOfEvents * componentHeight) + spacing;
  }
}
