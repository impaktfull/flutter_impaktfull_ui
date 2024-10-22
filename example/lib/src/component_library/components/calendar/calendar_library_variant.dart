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
        height: 500,
        padding: EdgeInsets.zero,
        wrapWithCard: true,
        child: ImpaktfullUiCalendar(
          selectedDate: inputs.selectedDate.value!,
          events: [
            ImpaktfullUiCalendarItem(
              title: 'Startup impaktfull',
              startDate: DateTime(2023, 07, 06),
              isAllDay: true,
            ),
            ImpaktfullUiCalendarItem(
              title: 'Meeting with Prospect A',
              startDate: now.add(const Duration(minutes: 12)),
              endDate: now.add(const Duration(hours: 1, minutes: 12)),
            ),
            ImpaktfullUiCalendarItem(
              title: 'Daily Standup',
              startDate: now.tomorrow.setTime(9, 0),
              endDate: now.tomorrow.setTime(9, 15),
            ),
            ImpaktfullUiCalendarItem(
              title: 'New Project kickoff',
              startDate: now.nextWeek.setTime(12, 30),
              endDate: now.nextWeek.setTime(13, 30),
            ),
          ],
          type: type,
        ),
      ),
    ];
  }

  @override
  CalendarLibraryPrimaryInputs inputs() => CalendarLibraryPrimaryInputs();
}

class CalendarLibraryPrimaryInputs extends CalendarLibraryInputs {}
