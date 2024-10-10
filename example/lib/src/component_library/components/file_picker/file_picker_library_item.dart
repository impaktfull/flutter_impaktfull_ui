import 'package:impaktfull_ui_example/src/component_library/components/file_picker/file_picker_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class FilePickerLibraryItem extends ComponentLibraryItem {
  const FilePickerLibraryItem();

  @override
  String get title => 'ImpaktfullUiFilePicker';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const FilePickerLibraryVariant(),
    ];
  }
}

class FilePickerLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
