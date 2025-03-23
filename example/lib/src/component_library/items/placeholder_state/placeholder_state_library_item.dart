import 'package:impaktfull_ui_example/src/component_library/items/placeholder_state/placeholder_state_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class PlaceholderLibraryItem extends ComponentLibraryItem {
  const PlaceholderLibraryItem();

  @override
  String get title => 'ImpaktfullUiPlaceholder';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const PlaceholderLibraryVariant(),
    ];
  }
}

class PlaceholderLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
