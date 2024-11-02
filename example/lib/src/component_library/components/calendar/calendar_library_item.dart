import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/calendar/calendar_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_datetime_input.dart';

class CalendarLibraryItem extends ComponentLibraryItem {
  const CalendarLibraryItem();

  @override
  String get title => 'ImpaktfullUiCalendar';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      for (final type in ImpaktfullUiCalendarType.values) ...[
        CalendarLibraryVariant(type: type),
      ],
    ];
  }
}

class CalendarLibraryInputs extends ComponentLibraryInputs {
  final selectedDate = ComponentLibraryDateTimeInput(
    'Selected date',
    initialValue: DateTime.now(),
  );

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        selectedDate,
      ];
}
