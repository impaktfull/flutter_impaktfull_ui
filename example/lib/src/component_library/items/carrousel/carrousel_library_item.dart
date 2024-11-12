import 'package:impaktfull_ui_example/src/component_library/items/carrousel/carrousel_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class CarrouselLibraryItem extends ComponentLibraryItem {
  const CarrouselLibraryItem();

  @override
  String get title => 'ImpaktfullUiCarrousel';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const CarrouselLibraryVariant(),
    ];
  }
}

class CarrouselLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
