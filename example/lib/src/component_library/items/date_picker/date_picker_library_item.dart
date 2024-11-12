import 'package:impaktfull_ui_example/src/component_library/items/date_picker/date_picker_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_datetime_input.dart';

class DatePickerLibraryItem extends ComponentLibraryItem {
  const DatePickerLibraryItem();

  @override
  String get title => 'ImpaktfullUiDatePicker';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const DatePickerLibraryVariant(),
    ];
  }
}

class DatePickerLibraryInputs extends ComponentLibraryInputs {
  final selectedStartDate = ComponentLibraryDateTimeInput(
    'Selected start date',
    initialValue: DateTime(2023, 7, 6),
  );
  final selectedEndDate = ComponentLibraryDateTimeInput(
    'Selected end date',
  );
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        selectedStartDate,
        selectedEndDate,
      ];
}
