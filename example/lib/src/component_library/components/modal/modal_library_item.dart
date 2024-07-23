import 'package:impaktfull_ui_example/src/component_library/components/modal/modal_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class ModalLibraryItem extends ComponentLibraryItem {
  const ModalLibraryItem();

  @override
  String get title => 'ImpaktfullUiModal';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const ModalLibraryVariant(),
    ];
  }
}

class ModalLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
