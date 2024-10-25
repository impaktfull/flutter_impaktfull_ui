import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/calendar/calendar.dart';
import 'package:impaktfull_ui_2/src/components/calendar/widget/calender_types/week/calendar_week_events.dart';
import 'package:impaktfull_ui_2/src/components/calendar/widget/calender_types/week/calendar_week_full_day_events.dart';
import 'package:impaktfull_ui_2/src/components/calendar/widget/calender_types/week/calendar_week_legend.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/extension/list_extension.dart';

class ImpaktfullUiCalendarWeek extends StatefulWidget {
  final DateTime selectedDate;
  final List<ImpaktfullUiCalendarEvent> events;
  final ValueChanged<ImpaktfullUiCalendarEvent> onEventTap;

  final ImpaktfullUiCalendarTheme? theme;

  const ImpaktfullUiCalendarWeek({
    required this.selectedDate,
    required this.events,
    required this.onEventTap,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiCalendarWeek> createState() =>
      _ImpaktfullUiCalendarWeekState();
}

class _ImpaktfullUiCalendarWeekState extends State<ImpaktfullUiCalendarWeek> {
  final _key = GlobalKey();
  late List<ImpaktfullUiCalendarEvent> _events;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _setEvents(widget.events);
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollTo8AM());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(ImpaktfullUiCalendarWeek oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.events != oldWidget.events) {
      _setEvents(widget.events);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiCalendarTheme>(
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) {
        final dateRange = DateTimeRange(
          start: DateTime.now()
              .subtract(Duration(days: DateTime.now().weekday - 1)),
          end: DateTime.now().add(
              Duration(days: DateTime.daysPerWeek - DateTime.now().weekday)),
        );
        final dayHeight = componentTheme.dimens.weekHourHeight * 24;
        return Column(
          children: [
            ImpaktfullUiCalendarWeekFullDayEvents(
              dateRange: dateRange,
              events: _events,
              theme: componentTheme,
            ),
            Expanded(
              child: ListView(
                key: _key,
                controller: _scrollController,
                children: [
                  Container(
                    height: dayHeight,
                    padding: const EdgeInsetsDirectional.only(start: 16),
                    child: Stack(
                      children: [
                        ImpaktfullUiCalendarWeekLegend(
                          theme: componentTheme,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: componentTheme.dimens.sectionTitleWidth + 16,
                            end: 16,
                          ),
                          child: ImpaktfullUiCalendarWeekEvents(
                            dateRange: dateRange,
                            events: _events,
                            onEventTap: widget.onEventTap,
                            theme: componentTheme,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void _setEvents(List<ImpaktfullUiCalendarEvent> events) {
    events.sortBy((e) => e.startDate);
    setState(() {
      _events = events;
    });
  }

  void _scrollTo8AM() {
    final context = _key.currentContext;
    if (context == null) return;
    const defaultScrollOffset = 7.75; // 7:45 AM;
    final theme = ImpaktfullUiCalendarTheme.of(context);
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(
        defaultScrollOffset * theme.dimens.weekHourHeight,
      );
    }
  }
}
