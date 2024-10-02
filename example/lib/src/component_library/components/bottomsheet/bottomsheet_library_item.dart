import 'package:impaktfull_ui_example/src/component_library/components/bottomsheet/bottomsheet_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class BottomSheetLibraryItem extends ComponentLibraryItem {
  const BottomSheetLibraryItem();

  @override
  String get title => 'ImpaktfullUiBottomSheet';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const BottomSheetLibraryVariant(),
    ];
  }
}

class BottomSheetLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
