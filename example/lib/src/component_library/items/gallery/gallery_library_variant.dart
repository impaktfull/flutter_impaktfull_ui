import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/gallery/gallery_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/util/network_images.dart';
import 'package:impaktfull_ui_example/src/widget/component/components_library_variant_descriptor.dart';

class GalleryLibraryVariant extends ComponentLibraryVariant<GalleryLibraryPrimaryInputs> {
  const GalleryLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, GalleryLibraryPrimaryInputs inputs) {
    return [
      ComponentsLibraryVariantDescriptor(
        height: 500,
        child: ImpaktfullUiGallery(
          items: NetworkImages.gallery,
          itemAspectRatio: (context, config) => 3 / 2,
        ),
      ),
    ];
  }

  @override
  GalleryLibraryPrimaryInputs inputs() => GalleryLibraryPrimaryInputs();
}

class GalleryLibraryPrimaryInputs extends GalleryLibraryInputs {}
