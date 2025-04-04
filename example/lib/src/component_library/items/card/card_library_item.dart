import 'package:impaktfull_ui_example/src/component_library/items/card/card_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class CardLibraryItem extends ComponentLibraryItem {
  const CardLibraryItem();

  @override
  String get title => 'ImpaktfullUiCard';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      CardVariant(),
    ];
  }
}

class CardLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
