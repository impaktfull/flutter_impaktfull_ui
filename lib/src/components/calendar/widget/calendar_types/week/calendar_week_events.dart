import 'dart:math';

import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/calendar/calendar.dart';
import 'package:impaktfull_ui/src/components/calendar/widget/calendar_types/week/calendar_week_event_item.dart';
import 'package:impaktfull_ui/src/util/extension/datetime_extensions.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

class ImpaktfullUiCalendarWeekEvents extends StatefulWidget {
  final DateTimeRange dateRange;
  final List<ImpaktfullUiCalendarEvent> events;
  final ValueChanged<ImpaktfullUiCalendarEvent> onEventTapped;
  final int amountOfDays;
  final ImpaktfullUiCalendarTheme? theme;

  const ImpaktfullUiCalendarWeekEvents({
    required this.events,
    required this.dateRange,
    required this.onEventTapped,
    required this.amountOfDays,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiCalendarWeekEvents> createState() =>
      _ImpaktfullUiCalendarWeekEventsState();
}

class _ImpaktfullUiCalendarWeekEventsState
    extends State<ImpaktfullUiCalendarWeekEvents> {
  final _weekEvents = <ImpaktfullUiCalendarEvent>[];

  @override
  void initState() {
    super.initState();
    _setWeekEvents();
  }

  @override
  void didUpdateWidget(covariant ImpaktfullUiCalendarWeekEvents oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.events != widget.events ||
        oldWidget.dateRange != widget.dateRange) {
      _setWeekEvents();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => ImpaktfullUiAutoLayout.horizontal(
        children: [
          for (var dayIndex = 0;
              dayIndex < widget.amountOfDays;
              ++dayIndex) ...[
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) => Stack(
                  children: _buildEventsForDay(
                    dayIndex,
                    constraints.maxWidth,
                    componentTheme,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  List<Widget> _buildEventsForDay(
    int dayIndex,
    double dayWidth,
    ImpaktfullUiCalendarTheme componentTheme,
  ) {
    final currentDayDate = widget.dateRange.start.add(Duration(days: dayIndex));
    final eventsForDay = _weekEvents.where((event) {
      final eventStartDate = event.startDate;
      final eventEndDate = event.endDate;
      return eventStartDate.isSameDay(currentDayDate) ||
          eventEndDate.isSameDay(currentDayDate);
    }).toList();

    // Sort events by start time
    eventsForDay.sort((a, b) => a.startDate.compareTo(b.startDate));

    // Place every event in the first column that is free at its start time.
    // Events that overlap (directly or through other events) form a cluster
    // and share the width of the day equally.
    final layouts = <_EventLayout>[];
    final cluster = <_EventLayout>[];
    final columnEnds = <double>[];
    var clusterEnd = double.negativeInfinity;

    void closeCluster() {
      for (final layout in cluster) {
        layout.columnCount = columnEnds.length;
      }
      cluster.clear();
      columnEnds.clear();
    }

    for (final event in eventsForDay) {
      final startDateTime = event.startDate.isSameDay(currentDayDate)
          ? event.startDate
          : currentDayDate.startOfTheDay;
      final endDateTime = event.endDate.isSameDay(currentDayDate)
          ? event.endDate
          : currentDayDate.endOfTheDay;

      final top = (startDateTime.hour + (startDateTime.minute / 60)) *
          componentTheme.dimens.weekHourHeight;
      final maxDifferenceInHours =
          (endDateTime.difference(startDateTime).inMinutes / 60)
              .clamp(0.0, 24.0);
      final height =
          maxDifferenceInHours * componentTheme.dimens.weekHourHeight;
      // The event item is at least this high (see ImpaktfullUiCalendarWeekEventItem)
      final bottom = top + max(height, _minEventHeight);

      if (top >= clusterEnd) closeCluster();
      var column = columnEnds.indexWhere((end) => end <= top);
      if (column == -1) {
        column = columnEnds.length;
        columnEnds.add(bottom);
      } else {
        columnEnds[column] = bottom;
      }
      clusterEnd = cluster.isEmpty ? bottom : max(clusterEnd, bottom);

      final layout = _EventLayout(
        event: event,
        top: top,
        height: height,
        column: column,
      );
      cluster.add(layout);
      layouts.add(layout);
    }
    closeCluster();

    final eventWidgets = <Widget>[];
    for (final layout in layouts) {
      final event = layout.event;
      // start & width are fractions of the width of the day column
      final width = 1.0 / layout.columnCount;
      final start = layout.column * width;
      eventWidgets.add(
        PositionedDirectional(
          top: layout.top,
          start: start * dayWidth,
          end: (1 - start - width) * dayWidth,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: ImpaktfullUiCalendarWeekEventItem(
              event: event,
              height: layout.height,
              onTap: () => widget.onEventTapped(event),
              theme: componentTheme,
            ),
          ),
        ),
      );
    }

    return eventWidgets;
  }

  void _setWeekEvents() {
    final weekEvents = widget.events.where((event) {
      final startDate = event.startDate;
      final endDate = event.endDate;
      final duration = endDate.difference(startDate);
      if (duration >= const Duration(hours: 23, minutes: 59, seconds: 59)) {
        return false;
      }
      return (startDate.isAfter(
                  widget.dateRange.start.subtract(const Duration(days: 1))) &&
              startDate.isBefore(
                  widget.dateRange.end.add(const Duration(days: 1)))) ||
          (endDate.isAfter(
                  widget.dateRange.start.subtract(const Duration(days: 1))) &&
              endDate
                  .isBefore(widget.dateRange.end.add(const Duration(days: 1))));
    });
    _weekEvents.clear();
    _weekEvents.addAll(weekEvents);
  }
}

/// The minimum height of an event item in the week view.
const _minEventHeight = 17.0;

class _EventLayout {
  final ImpaktfullUiCalendarEvent event;
  final double top;
  final double height;
  final int column;
  var columnCount = 1;

  _EventLayout({
    required this.event,
    required this.top,
    required this.height,
    required this.column,
  });
}
