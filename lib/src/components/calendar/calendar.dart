import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/calendar/calendar_style.dart';
import 'package:impaktfull_ui_2/src/components/calendar/model/calendar_item.dart';
import 'package:impaktfull_ui_2/src/components/calendar/model/calendar_type.dart';
import 'package:impaktfull_ui_2/src/components/calendar/widget/calender_types/calendar_list.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'calendar_style.dart';
export 'model/calendar_item.dart';
export 'model/calendar_type.dart';

part 'calendar.describe.dart';

class ImpaktfullUiCalendar extends StatelessWidget
    with ComponentDescriptorMixin {
  final DateTime selectedDate;
  final ImpaktfullUiCalendarType type;
  final List<ImpaktfullUiCalendarItem> events;
  final ImpaktfullUiCalendarTheme? theme;

  const ImpaktfullUiCalendar({
    required this.selectedDate,
    required this.events,
    required this.type,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiCalendarTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        switch (type) {
          case ImpaktfullUiCalendarType.list:
            return ImpaktfullUiCalendarList(
              selectedDate: selectedDate,
              events: events,
              theme: componentTheme,
            );
        }
      },
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}
