import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/util/localizations/localizations.dart';

class ImpaktfullUiCalendarLocalizations
    extends ImpaktfullUiComponentLocalizations {
  /// The button that jumps to the current week.
  final String todayBtn;

  /// Shown instead of the time of an event that takes the whole day.
  final String allDay;

  /// Shown before the time of an event that covers more than one day, e.g. `(2/3 days)`.
  final String Function(int day, int amountOfDays) multiDayProgress;

  /// Shown when the list has no events.
  final String noEventsFound;

  /// The tooltip of the button that goes to the previous week.
  final String previousWeek;

  /// The tooltip of the button that goes to the next week.
  final String nextWeek;

  const ImpaktfullUiCalendarLocalizations({
    this.todayBtn = 'Today',
    this.allDay = 'All day',
    this.multiDayProgress = _defaultMultiDayProgress,
    this.noEventsFound = 'No events found',
    this.previousWeek = 'Previous week',
    this.nextWeek = 'Next week',
  });

  static ImpaktfullUiCalendarLocalizations of(BuildContext context) =>
      ImpaktfullUiLocalizations.of<ImpaktfullUiCalendarLocalizations>(context);

  ImpaktfullUiCalendarLocalizations copyWith({
    String? todayBtn,
    String? allDay,
    String Function(int day, int amountOfDays)? multiDayProgress,
    String? noEventsFound,
    String? previousWeek,
    String? nextWeek,
  }) =>
      ImpaktfullUiCalendarLocalizations(
        todayBtn: todayBtn ?? this.todayBtn,
        allDay: allDay ?? this.allDay,
        multiDayProgress: multiDayProgress ?? this.multiDayProgress,
        noEventsFound: noEventsFound ?? this.noEventsFound,
        previousWeek: previousWeek ?? this.previousWeek,
        nextWeek: nextWeek ?? this.nextWeek,
      );
}

String _defaultMultiDayProgress(int day, int amountOfDays) =>
    '($day/$amountOfDays days)';
