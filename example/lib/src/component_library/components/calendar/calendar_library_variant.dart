import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/calendar/calendar_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/component/components_library_variant_descriptor.dart';

class CalendarLibraryVariant
    extends ComponentLibraryVariant<CalendarLibraryPrimaryInputs> {
  final ImpaktfullUiCalendarType type;

  const CalendarLibraryVariant({
    required this.type,
  });

  @override
  String get title => type.name;

  @override
  List<Widget> build(
      BuildContext context, CalendarLibraryPrimaryInputs inputs) {
    final now = DateTime.now();
    return [
      ComponentsLibraryVariantDescriptor(
        height: 800,
        padding: EdgeInsets.zero,
        wrapWithCard: true,
        child: ImpaktfullUiCalendar(
          selectedDate: inputs.selectedDate.value!,
          events: [
            ImpaktfullUiCalendarEvent(
              title: 'Startup impaktfull',
              startDate: DateTime(2023, 07, 06).startOfTheDay,
              endDate: DateTime(2023, 07, 06).endOfTheDay,
            ),
            ImpaktfullUiCalendarEvent(
              title: 'Party',
              startDate: now.startOfTheDay.beginningOfTheWeek
                  .add(const Duration(days: 3))
                  .setTime(22, 30),
              endDate: now.beginningOfTheWeek
                  .add(const Duration(days: 4))
                  .setTime(06, 30),
            ),
            ImpaktfullUiCalendarEvent(
              title: 'Saturday - Chill day!',
              startDate: now.thisWeekSaturday.startOfTheDay,
              endDate: now.thisWeekSaturday.endOfTheDay,
            ),
            ImpaktfullUiCalendarEvent(
              title: 'Offsite',
              startDate: now.thisWeekMonday.setTime(9, 30),
              endDate: now.thisWeekWednesday.setTime(9, 30),
            ),
            ImpaktfullUiCalendarEvent(
              title: 'Offsite 2',
              startDate: now.thisWeekWednesday.setTime(9, 30),
              endDate: now.thisWeekThursday.setTime(9, 30),
            ),
            ImpaktfullUiCalendarEvent(
              title: 'Meeting with Prospect A',
              startDate: now.add(const Duration(minutes: 12)),
              endDate: now.add(const Duration(hours: 1, minutes: 12)),
            ),
            ImpaktfullUiCalendarEvent(
              title: 'Overlapping meeting',
              startDate: now.tomorrow.setTime(12, 30),
              endDate: now.tomorrow.setTime(13, 30),
            ),
            ImpaktfullUiCalendarEvent(
              title: 'New Project kickoff',
              startDate: now.tomorrow.setTime(12, 30),
              endDate: now.tomorrow.setTime(13, 30),
            ),
            for (int i = 0; i < 5; i++) ...[
              ImpaktfullUiCalendarEvent(
                title: 'Lunch',
                startDate: now.beginningOfTheWeek
                    .add(Duration(days: i))
                    .setTime(12, 0),
                endDate: now.beginningOfTheWeek
                    .add(Duration(days: i))
                    .setTime(13, 0),
              ),
            ],
            ImpaktfullUiCalendarEvent(
              title: 'Sync with Team A',
              startDate: now.setTime(10, 0).add(const Duration(days: 2)),
              endDate:
                  now.setTime(10, 0).add(const Duration(days: 2, minutes: 10)),
            ),
            ImpaktfullUiCalendarEvent(
              title: 'Sync with Team B',
              startDate:
                  now.setTime(10, 0).add(const Duration(days: 2, minutes: 10)),
              endDate:
                  now.setTime(10, 0).add(const Duration(days: 2, minutes: 20)),
            ),
            for (int i = 0; i < 100; i++) ...[
              ImpaktfullUiCalendarEvent(
                title: 'Daily Standup',
                startDate:
                    now.thisWeekMonday.setTime(9, 0).add(Duration(days: i)),
                endDate:
                    now.thisWeekMonday.setTime(9, 15).add(Duration(days: i)),
              ),
            ],
            ImpaktfullUiCalendarEvent(
              title: 'All day event',
              startDate: now.nextWeek.thisWeekMonday.startOfTheDay,
              endDate: now.nextWeek.thisWeekMonday.endOfTheDay,
            ),
            ImpaktfullUiCalendarEvent(
              title: 'Gala night',
              startDate: now.setTime(22, 30),
              endDate: now.tomorrow.setTime(06, 30),
            ),
          ],
          onEventTap: (event) =>
              ImpaktfullUiNotification.show(title: event.title),
          type: type,
        ),
      ),
    ];
  }

  @override
  CalendarLibraryPrimaryInputs inputs() => CalendarLibraryPrimaryInputs();
}

class CalendarLibraryPrimaryInputs extends CalendarLibraryInputs {}
