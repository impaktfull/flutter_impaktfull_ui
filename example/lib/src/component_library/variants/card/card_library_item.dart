import 'package:impaktfull_ui_example/src/component_library/component_library.dart';
import 'package:impaktfull_ui_example/src/component_library/variants/card/card_library_variant.dart';

class CardLibraryItem extends ComponentLibraryItem {
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
