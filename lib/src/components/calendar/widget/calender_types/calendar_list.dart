import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/calendar/calendar.dart';
import 'package:impaktfull_ui/src/components/calendar/model/calendar_list_item.dart';
import 'package:impaktfull_ui/src/components/calendar/widget/calender_types/list/calendar_list_item.dart';
import 'package:impaktfull_ui/src/components/list_view/list_view.dart';
import 'package:impaktfull_ui/src/util/extension/datetime_extensions.dart';
import 'package:impaktfull_ui/src/util/extension/list_extension.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component.dart';

class ImpaktfullUiCalendarList extends StatefulWidget {
  final DateTime selectedDate;
  final List<ImpaktfullUiCalendarEvent> events;
  final ValueChanged<ImpaktfullUiCalendarEvent> onEventTap;
  final ImpaktfullUiCalendarTheme? theme;

  const ImpaktfullUiCalendarList({
    required this.selectedDate,
    required this.events,
    required this.onEventTap,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiCalendarList> createState() =>
      _ImpaktfullUiCalendarListState();
}

class _ImpaktfullUiCalendarListState extends State<ImpaktfullUiCalendarList> {
  late List<ImpaktfulluiCalendarListItem> _events;

  @override
  void initState() {
    super.initState();
    _setEvents(widget.events);
  }

  @override
  void didUpdateWidget(ImpaktfullUiCalendarList oldWidget) {
    super.didUpdateWidget(oldWidget);
    _setEvents(widget.events);
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => ImpaktfullUiListView.builder(
        padding: const EdgeInsets.all(16),
        items: _events,
        itemBuilder: (context, item, index) {
          final previousItem = index > 0 ? _events[index - 1] : null;
          return ImpaktfullUiCalendarListItem(
            item: item,
            onTap: () => widget.onEventTap(item.event),
            previousItem: previousItem,
          );
        },
        placeholderData: const ImpaktfullUiListViewPlaceholderData(
          title: 'No events found',
        ),
      ),
    );
  }

  void _setEvents(List<ImpaktfullUiCalendarEvent> events) {
    final now = DateTime.now();
    final futureEvents = widget.events.where((e) {
      final compareDate = e.endDate;
      return compareDate.isAfter(now);
    }).toList();
    final weekEvents = <ImpaktfulluiCalendarListItem>[];
    for (final event in futureEvents) {
      final startDate = event.startDate;
      final listItem = ImpaktfulluiCalendarListItem(
        date: startDate,
        event: event,
      );
      weekEvents.add(listItem);
      if (event.amountOfDaysCovered > 1) {
        for (int i = 1; i < event.amountOfDaysCovered; i++) {
          final date = startDate.add(Duration(days: i)).startOfTheDay;
          final listItem = ImpaktfulluiCalendarListItem(
            date: date,
            event: event,
          );
          weekEvents.add(listItem);
        }
      }
    }
    weekEvents.sortBy2(
      (e) => e.date,
      (e) => e.event.startDate,
    );
    setState(() {
      _events = weekEvents;
    });
  }
}
