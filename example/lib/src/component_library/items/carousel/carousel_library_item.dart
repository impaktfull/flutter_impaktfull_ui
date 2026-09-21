import 'package:impaktfull_ui_example/src/component_library/items/carousel/carousel_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class CarouselLibraryItem extends ComponentLibraryItem {
  const CarouselLibraryItem();

  @override
  String get title => 'ImpaktfullUiCarousel';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const CarouselLibraryVariant(),
    ];
  }
}

class CarouselLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
