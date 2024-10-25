import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/calendar/calendar.dart';
import 'package:impaktfull_ui_2/src/components/calendar/widget/calender_types/list/calendar_list_item.dart';
import 'package:impaktfull_ui_2/src/components/list_view/list_view.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/extension/list_extension.dart';

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
  State<ImpaktfullUiCalendarList> createState() => _ImpaktfullUiCalendarListState();
}

class _ImpaktfullUiCalendarListState extends State<ImpaktfullUiCalendarList> {
  late List<ImpaktfullUiCalendarEvent> _events;

  @override
  void initState() {
    super.initState();
    _setEvents(widget.events);
  }

  @override
  void didUpdateWidget(ImpaktfullUiCalendarList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.events != oldWidget.events) {
      _setEvents(widget.events);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiCalendarTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => ImpaktfullUiListView.builder(
        padding: const EdgeInsets.all(16),
        items: _events,
        itemBuilder: (context, item, index) {
          final previousItem = index > 0 ? _events[index - 1] : null;
          return ImpaktfullUiCalendarListItem(
            item: item,
            onTap: () => widget.onEventTap(item),
            previousItem: previousItem,
          );
        },
        noDataLabel: 'No events found',
      ),
    );
  }

  void _setEvents(List<ImpaktfullUiCalendarEvent> events) {
    final now = DateTime.now();
    final futureEvents = widget.events.where((e) {
      final compareDate = e.endDate;
      return compareDate.isAfter(now);
    }).toList();
    futureEvents.sortBy((e) => e.startDate);
    setState(() {
      _events = futureEvents;
    });
  }
}
