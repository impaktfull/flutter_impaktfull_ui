import 'package:impaktfull_ui_example/src/component_library/inputs/component_library_datetime_input.dart';
import 'package:impaktfull_ui_example/src/component_library/items/date_input_field/date_input_field_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class DateInputFieldLibraryItem extends ComponentLibraryItem {
  const DateInputFieldLibraryItem();

  @override
  String get title => 'ImpaktfullUiDateInputField';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const DateInputFieldLibraryVariant(),
    ];
  }
}

class DateInputFieldLibraryInputs extends ComponentLibraryInputs {
  final ComponentLibraryDateTimeInput date =
      ComponentLibraryDateTimeInput('Date');

  @override
  List<ComponentLibraryInputItem> buildInputItems() => [
        date,
      ];
}
