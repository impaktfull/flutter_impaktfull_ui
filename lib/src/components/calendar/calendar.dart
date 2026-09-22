import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/calendar/calendar.localizations.dart';
import 'package:impaktfull_ui/src/components/calendar/calendar_style.dart';
import 'package:impaktfull_ui/src/components/calendar/model/calendar_item.dart';
import 'package:impaktfull_ui/src/components/calendar/model/calendar_type.dart';
import 'package:impaktfull_ui/src/components/calendar/widget/calendar_types/calendar_list.dart';
import 'package:impaktfull_ui/src/components/calendar/widget/calendar_types/calendar_week.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'calendar.localizations.dart';
export 'calendar_style.dart';
export 'model/calendar_item.dart';
export 'model/calendar_type.dart';
export 'widget/calendar_types/calendar_list.dart';
export 'widget/calendar_types/calendar_week.dart';

class ImpaktfullUiCalendar extends StatelessWidget {
  final DateTime selectedDate;
  final ImpaktfullUiCalendarType type;
  final List<ImpaktfullUiCalendarEvent> events;
  final ValueChanged<ImpaktfullUiCalendarEvent> onEventTapped;
  final ImpaktfullUiCalendarTheme? theme;

  /// The texts of the calendar. Defaults to the localizations of the app.
  final ImpaktfullUiCalendarLocalizations? localizations;

  /// The first day of the week ([DateTime.monday] ... [DateTime.sunday]).
  ///
  /// Defaults to the first day of the week of the locale (see
  /// `MaterialLocalizations.firstDayOfWeekIndex`), or Monday when the app has
  /// no localized material localizations.
  final int? firstDayOfWeek;

  /// Whether times use 24 hours. Defaults to
  /// `MediaQuery.alwaysUse24HourFormat` and the time format of the locale.
  final bool? use24HourFormat;

  const ImpaktfullUiCalendar({
    required this.selectedDate,
    required this.events,
    required this.type,
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
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        switch (type) {
          case ImpaktfullUiCalendarType.list:
            return ImpaktfullUiCalendarList(
              selectedDate: selectedDate,
              events: events,
              onEventTapped: onEventTapped,
              theme: componentTheme,
              localizations: localizations,
              use24HourFormat: use24HourFormat,
            );
          case ImpaktfullUiCalendarType.week:
            return ImpaktfullUiCalendarWeek(
              selectedDate: selectedDate,
              events: events,
              onEventTapped: onEventTapped,
              theme: componentTheme,
              localizations: localizations,
              firstDayOfWeek: firstDayOfWeek,
              use24HourFormat: use24HourFormat,
            );
        }
      },
    );
  }
}
