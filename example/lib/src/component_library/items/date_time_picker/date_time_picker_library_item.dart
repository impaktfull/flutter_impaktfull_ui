import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_datetime_input.dart';
import 'package:impaktfull_ui_example/src/component_library/items/date_time_picker/date_time_picker_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class DateTimePickerLibraryItem extends ComponentLibraryItem {
  const DateTimePickerLibraryItem();

  @override
  String get title => 'ImpaktfullUiDateTimePicker';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const DateTimePickerLibraryVariant(),
    ];
  }
}

class DateTimePickerLibraryInputs extends ComponentLibraryInputs {
  final selectedDate = ComponentLibraryDateTimeInput(
    'Selected date',
    initialValue: DateTime.now(),
  );
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        selectedDate,
      ];
}
