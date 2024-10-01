import 'package:impaktfull_ui_example/src/component_library/components/snacky/snacky_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class SnackyLibraryItem extends ComponentLibraryItem {
  const SnackyLibraryItem();

  @override
  String get title => 'ImpaktfullUiSnacky';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const SnackyLibraryVariant(),
    ];
  }
}

class SnackyLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
