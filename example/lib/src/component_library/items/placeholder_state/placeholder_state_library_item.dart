import 'package:impaktfull_ui_example/src/component_library/items/placeholder_state/placeholder_state_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class PlaceholderStateLibraryItem extends ComponentLibraryItem {
  const PlaceholderStateLibraryItem();

  @override
  String get title => 'ImpaktfullUiPlaceholderState';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const PlaceholderStateLibraryVariant(),
    ];
  }
}

class PlaceholderStateLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
