import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';
import 'package:impaktfull_ui/src/components/calendar/calendar.dart';
import 'package:impaktfull_ui/src/components/calendar/widget/calendar_locale_scope.dart';
import 'package:impaktfull_ui/src/components/calendar/widget/calendar_types/week/calendar_week_events.dart';
import 'package:impaktfull_ui/src/components/calendar/widget/calendar_types/week/calendar_week_full_day_events.dart';
import 'package:impaktfull_ui/src/components/calendar/widget/calendar_types/week/calendar_week_legend_days.dart';
import 'package:impaktfull_ui/src/components/calendar/widget/calendar_types/week/calendar_week_legend_hours.dart';
import 'package:impaktfull_ui/src/components/divider/divider.dart';
import 'package:impaktfull_ui/src/components/icon_button/icon_button.dart';
import 'package:impaktfull_ui/src/util/extension/datetime_extensions.dart';
import 'package:impaktfull_ui/src/util/extension/list_extension.dart';
import 'package:impaktfull_ui/src/util/locale/locale_util.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

class ImpaktfullUiCalendarWeek extends StatefulWidget {
  final DateTime selectedDate;
  final List<ImpaktfullUiCalendarEvent> events;
  final ValueChanged<ImpaktfullUiCalendarEvent> onEventTapped;

  final ImpaktfullUiCalendarTheme? theme;
  final ImpaktfullUiCalendarLocalizations? localizations;

  /// The first day of the week ([DateTime.monday] ... [DateTime.sunday]).
  /// Defaults to the first day of the week of the locale, or Monday.
  final int? firstDayOfWeek;
  final bool? use24HourFormat;

  const ImpaktfullUiCalendarWeek({
    required this.selectedDate,
    required this.events,
    // `onEventTapped` becomes `required` again in 1.0.0, when `onEventTap` is
    // removed.
    ValueChanged<ImpaktfullUiCalendarEvent>? onEventTapped,
    @Deprecated('Use onEventTapped instead. Will be removed in 1.0.0.')
    ValueChanged<ImpaktfullUiCalendarEvent>? onEventTap,
    this.theme,
    this.localizations,
    this.firstDayOfWeek,
    this.use24HourFormat,
    super.key,
  })  : assert(onEventTapped != null || onEventTap != null,
            'onEventTapped is required'),
        onEventTapped = (onEventTapped ?? onEventTap)
            as ValueChanged<ImpaktfullUiCalendarEvent>;

  @Deprecated('Use onEventTapped instead. Will be removed in 1.0.0.')
  ValueChanged<ImpaktfullUiCalendarEvent> get onEventTap => onEventTapped;

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
  int? _firstDayOfWeek;

  @override
  void initState() {
    super.initState();
    _setEvents(widget.events);
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollTo8AM());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateFirstDayOfWeek();
  }

  void _updateFirstDayOfWeek() {
    final firstDayOfWeek = ImpaktfullUiLocaleUtil.firstDayOfWeek(
      context,
      override: widget.firstDayOfWeek,
    );
    if (firstDayOfWeek == _firstDayOfWeek) return;
    final isFirstTime = _firstDayOfWeek == null;
    _firstDayOfWeek = firstDayOfWeek;
    _currentWeekStart = _getWeekStart(
      isFirstTime ? widget.selectedDate : _currentWeekStart,
    );
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
    if (widget.firstDayOfWeek != oldWidget.firstDayOfWeek) {
      _updateFirstDayOfWeek();
    }
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
      builder: (context, componentTheme) {
        final localizations =
            ImpaktfullUiCalendarLocaleScope.localizationsOf(context);
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
                  padding: componentTheme.dimens.eventPadding,
                  child: ImpaktfullUiAutoLayout.vertical(
                    spacing: componentTheme.dimens.eventSpacing,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ImpaktfullUiButton(
                        fullWidth: true,
                        type: ImpaktfullUiButtonType.secondaryGrey,
                        size: ImpaktfullUiButtonSize.extraSmall,
                        title: localizations.todayBtn,
                        onTap: _onNowTapped,
                      ),
                      ImpaktfullUiAutoLayout.horizontal(
                        children: [
                          ImpaktfullUiIconButton(
                            asset: componentTheme.assets.chevronLeft
                                .copyWith(matchTextDirection: true),
                            tooltip: localizations.previousWeek,
                            onTap: _onPreviousWeekTapped,
                          ),
                          ImpaktfullUiIconButton(
                            asset: componentTheme.assets.chevronRight
                                .copyWith(matchTextDirection: true),
                            tooltip: localizations.nextWeek,
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
                        onEventTapped: widget.onEventTapped,
                        amountOfDays: _amountOfDays,
                        theme: componentTheme,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: componentTheme.dimens.hourSpacing),
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
                            onEventTapped: widget.onEventTapped,
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
    // Sort a copy: never modify the (possibly unmodifiable) list of the app.
    _events = List.of(events)..sortBy((e) => e.startDate);
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

  DateTime _getWeekStart(DateTime date) => ImpaktfullUiLocaleUtil.startOfWeek(
        date,
        _firstDayOfWeek ?? DateTime.monday,
      );
}
