import 'package:impaktfull_ui_example/src/component_library/components/time_picker/time_picker_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class TimePickerLibraryItem extends ComponentLibraryItem {
  const TimePickerLibraryItem();

  @override
  String get title => 'ImpaktfullUiTimePicker';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const TimePickerLibraryVariant(),
    ];
  }
}

class TimePickerLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
