import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';
import 'package:impaktfull_ui/src/components/calendar/calendar.dart';
import 'package:impaktfull_ui/src/components/calendar/widget/calender_types/week/calendar_week_events.dart';
import 'package:impaktfull_ui/src/components/calendar/widget/calender_types/week/calendar_week_full_day_events.dart';
import 'package:impaktfull_ui/src/components/calendar/widget/calender_types/week/calendar_week_legend_days.dart';
import 'package:impaktfull_ui/src/components/calendar/widget/calender_types/week/calendar_week_legend_hours.dart';
import 'package:impaktfull_ui/src/components/divider/divider.dart';
import 'package:impaktfull_ui/src/components/icon_button/icon_button.dart';
import 'package:impaktfull_ui/src/util/extension/datetime_extensions.dart';
import 'package:impaktfull_ui/src/util/extension/list_extension.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component.dart';

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
  static const _amountOfDays = 7;
  final _key = GlobalKey();
  late List<ImpaktfullUiCalendarEvent> _events;
  late ScrollController _scrollController;
  late DateTime _currentWeekStart;

  @override
  void initState() {
    super.initState();
    _setEvents(widget.events);
    _scrollController = ScrollController();
    _currentWeekStart = _getWeekStart(widget.selectedDate);
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
    if (widget.selectedDate != oldWidget.selectedDate) {
      _currentWeekStart = _getWeekStart(widget.selectedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) {
        final dateRange = DateTimeRange(
          start: _currentWeekStart,
          end: _currentWeekStart.add(const Duration(days: 6)),
        );
        final dayHeight = componentTheme.dimens.weekHourHeight * 24;
        return ImpaktfullUiAutoLayout.vertical(
          children: [
            ImpaktfullUiAutoLayout.horizontal(
              children: [
                Container(
                  width: componentTheme.dimens.sectionTitleWidth + 32,
                  padding: const EdgeInsets.all(4),
                  child: ImpaktfullUiAutoLayout.vertical(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ImpaktfullUiButton(
                        fullWidth: true,
                        type: ImpaktfullUiButtonType.secondaryGrey,
                        size: ImpaktfullUiButtonSize.extraSmall,
                        title: 'Today',
                        onTap: _onNowTapped,
                      ),
                      ImpaktfullUiAutoLayout.horizontal(
                        children: [
                          ImpaktfullUiIconButton(
                            asset: componentTheme.assets.chevronLeft,
                            onTap: _onPreviousWeekTapped,
                          ),
                          ImpaktfullUiIconButton(
                            asset: componentTheme.assets.chevronRight,
                            onTap: _onNextWeekTapped,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ImpaktfullUiAutoLayout.vertical(
                    children: [
                      ImpaktfullUiCalendarWeekLegendDays(
                        firstDay: dateRange.start,
                        amountOfDays: _amountOfDays,
                        theme: componentTheme,
                      ),
                      ImpaktfullUiCalendarWeekFullDayEvents(
                        dateRange: dateRange,
                        events: _events,
                        onEventTap: widget.onEventTap,
                        amountOfDays: _amountOfDays,
                        theme: componentTheme,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
            const ImpaktfullUiDivider(),
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
                        ImpaktfullUiCalendarWeekLegendHours(
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
                            amountOfDays: _amountOfDays,
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

  void _onPreviousWeekTapped() {
    setState(() => _currentWeekStart = _currentWeekStart.previousWeek);
  }

  void _onNowTapped() {
    setState(() => _currentWeekStart = _getWeekStart(DateTime.now()));
    _scrollTo8AM();
  }

  void _onNextWeekTapped() {
    setState(() => _currentWeekStart = _currentWeekStart.nextWeek);
  }

  DateTime _getWeekStart(DateTime date) => date.beginningOfTheWeek;
}
