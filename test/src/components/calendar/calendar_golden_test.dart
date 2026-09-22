import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';

// The week of Monday 13 May 2024.
final _weekEvents = [
  ImpaktfullUiCalendarEvent(
    title: 'Standup',
    startDate: DateTime(2024, 5, 13, 9),
    endDate: DateTime(2024, 5, 13, 9, 15),
  ),
  ImpaktfullUiCalendarEvent(
    title: 'Design review',
    startDate: DateTime(2024, 5, 14, 10),
    endDate: DateTime(2024, 5, 14, 12),
  ),
  ImpaktfullUiCalendarEvent(
    title: 'Lunch',
    startDate: DateTime(2024, 5, 15, 12),
    endDate: DateTime(2024, 5, 15, 13),
  ),
  ImpaktfullUiCalendarEvent(
    title: 'Overlap',
    startDate: DateTime(2024, 5, 15, 12, 30),
    endDate: DateTime(2024, 5, 15, 14),
  ),
  ImpaktfullUiCalendarEvent(
    title: 'Conference',
    startDate: DateTime(2024, 5, 16),
    endDate: DateTime(2024, 5, 17, 23, 59, 59),
  ),
];

// The list only shows events that did not end yet: use dates far in the
// future so the golden does not change over time.
final _listEvents = [
  ImpaktfullUiCalendarEvent(
    title: 'Kick-off',
    startDate: DateTime(2099, 3, 2, 9),
    endDate: DateTime(2099, 3, 2, 10),
  ),
  ImpaktfullUiCalendarEvent(
    title: 'Workshop',
    startDate: DateTime(2099, 3, 2, 9, 15),
    endDate: DateTime(2099, 3, 2, 11),
  ),
  ImpaktfullUiCalendarEvent(
    title: 'Trip',
    startDate: DateTime(2099, 3, 3),
    endDate: DateTime(2099, 3, 4, 23, 59, 59),
  ),
  ImpaktfullUiCalendarEvent(
    title: 'In the past',
    startDate: DateTime(2020, 3, 3, 9),
    endDate: DateTime(2020, 3, 3, 10),
  ),
];

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_calendar_week',
    goldenTests: () => [
      GoldenTest(
        description: 'Week with events',
        child: SizedBox(
          width: 1000,
          height: 700,
          child: ImpaktfullUiCalendar(
            type: ImpaktfullUiCalendarType.week,
            selectedDate: DateTime(2024, 5, 15),
            events: _weekEvents,
            onEventTapped: (_) {},
          ),
        ),
      ),
      GoldenTest(
        description: 'Week without events',
        child: SizedBox(
          width: 1000,
          height: 300,
          child: ImpaktfullUiCalendar(
            type: ImpaktfullUiCalendarType.week,
            selectedDate: DateTime(2024, 12, 31),
            events: const [],
            onEventTapped: (_) {},
          ),
        ),
      ),
    ],
  );

  runComponentTest(
    fileName: 'impaktfull_ui_calendar_list',
    columns: 2,
    goldenTests: () => [
      GoldenTest(
        description: 'List with events',
        child: SizedBox(
          width: 500,
          height: 700,
          child: ImpaktfullUiCalendar(
            type: ImpaktfullUiCalendarType.list,
            selectedDate: DateTime(2099, 3, 2),
            events: _listEvents,
            onEventTapped: (_) {},
          ),
        ),
      ),
      GoldenTest(
        description: 'List without events',
        child: SizedBox(
          width: 500,
          height: 700,
          child: ImpaktfullUiCalendar(
            type: ImpaktfullUiCalendarType.list,
            selectedDate: DateTime(2099, 3, 2),
            events: const [],
            onEventTapped: (_) {},
          ),
        ),
      ),
    ],
  );
}
