import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/calendar/calendar.dart';
import 'package:impaktfull_ui/src/components/calendar/model/calendar_list_item.dart';
import 'package:impaktfull_ui/src/components/calendar/widget/calendar_locale_scope.dart';
import 'package:impaktfull_ui/src/components/calendar/widget/calendar_types/list/calendar_list_item.dart';
import 'package:impaktfull_ui/src/components/list_view/list_view.dart';
import 'package:impaktfull_ui/src/util/extension/datetime_extensions.dart';
import 'package:impaktfull_ui/src/util/extension/list_extension.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

class ImpaktfullUiCalendarList extends StatefulWidget {
  final DateTime selectedDate;
  final List<ImpaktfullUiCalendarEvent> events;
  final ValueChanged<ImpaktfullUiCalendarEvent> onEventTapped;
  final ImpaktfullUiCalendarTheme? theme;
  final ImpaktfullUiCalendarLocalizations? localizations;
  final bool? use24HourFormat;

  const ImpaktfullUiCalendarList({
    required this.selectedDate,
    required this.events,
    // `onEventTapped` becomes `required` again in 1.0.0, when `onEventTap` is
    // removed.
    ValueChanged<ImpaktfullUiCalendarEvent>? onEventTapped,
    @Deprecated('Use onEventTapped instead. Will be removed in 1.0.0.')
    ValueChanged<ImpaktfullUiCalendarEvent>? onEventTap,
    this.theme,
    this.localizations,
    this.use24HourFormat,
    super.key,
  })  : assert(onEventTapped != null || onEventTap != null,
            'onEventTapped is required'),
        onEventTapped = (onEventTapped ?? onEventTap)
            as ValueChanged<ImpaktfullUiCalendarEvent>;

  @Deprecated('Use onEventTapped instead. Will be removed in 1.0.0.')
  ValueChanged<ImpaktfullUiCalendarEvent> get onEventTap => onEventTapped;

  @override
  State<ImpaktfullUiCalendarList> createState() =>
      _ImpaktfullUiCalendarListState();
}

class _ImpaktfullUiCalendarListState extends State<ImpaktfullUiCalendarList> {
  late List<ImpaktfullUiCalendarListItemModel> _events;

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
  Widget build(BuildContext context) => ImpaktfullUiCalendarLocaleScope(
        localizations: widget.localizations,
        use24HourFormat: widget.use24HourFormat,
        child: Builder(builder: _buildCalendar),
      );

  Widget _buildCalendar(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) => ImpaktfullUiListView.builder(
        padding: componentTheme.dimens.listPadding,
        items: _events,
        itemBuilder: (context, item, index) {
          final previousItem = index > 0 ? _events[index - 1] : null;
          return ImpaktfullUiCalendarListItem(
            item: item,
            onTap: () => widget.onEventTapped(item.event),
            previousItem: previousItem,
          );
        },
        placeholderData: ImpaktfullUiListViewPlaceholderData(
          title: ImpaktfullUiCalendarLocaleScope.localizationsOf(context)
              .noEventsFound,
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
    final weekEvents = <ImpaktfullUiCalendarListItemModel>[];
    for (final event in futureEvents) {
      final startDate = event.startDate;
      final listItem = ImpaktfullUiCalendarListItemModel(
        date: startDate,
        event: event,
      );
      weekEvents.add(listItem);
      if (event.amountOfDaysCovered > 1) {
        for (int i = 1; i < event.amountOfDaysCovered; i++) {
          final date = startDate.add(Duration(days: i)).startOfTheDay;
          final listItem = ImpaktfullUiCalendarListItemModel(
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
