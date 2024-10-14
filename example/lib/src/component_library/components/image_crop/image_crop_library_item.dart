import 'package:impaktfull_ui_example/src/component_library/components/image_crop/image_crop_library_variant.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_inputs.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class ImageCropLibraryItem extends ComponentLibraryItem {
  const ImageCropLibraryItem();

  @override
  String get title => 'ImpaktfullUiImageCrop';

  @override
  List<ComponentLibraryVariant> getComponentVariants() {
    return [
      const ImageCropLibraryVariant(),
    ];
  }
}

class ImageCropLibraryInputs extends ComponentLibraryInputs {
  @override
  List<ComponentLibraryInputItem> buildInputItems() => [];
}
