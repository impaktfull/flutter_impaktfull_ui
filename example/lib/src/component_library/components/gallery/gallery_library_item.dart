import 'package:impaktfull_ui_example/src/component_library/components/gallery/gallery_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class GalleryLibraryItem extends ComponentLibraryItem {
  const GalleryLibraryItem();

  @override
  String get title => 'ImpaktfullUiGallery';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const GalleryLibraryVariant(),
    ];
  }
}

class GalleryLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}

