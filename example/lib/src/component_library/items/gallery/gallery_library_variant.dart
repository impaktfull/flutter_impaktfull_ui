import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/items/gallery/gallery_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/widget/component/components_library_variant_descriptor.dart';

class GalleryLibraryVariant
    extends ComponentLibraryVariant<GalleryLibraryPrimaryInputs> {
  static const _galleryImages = [
    ImpaktfullUiGalleryItem.image(
      imageUrl: 'https://www.w3schools.com/css/img_lights.jpg',
      title: 'Northern Lights',
    ),
    ImpaktfullUiGalleryItem.image(
      imageUrl: 'https://www.w3schools.com/css/img_forest.jpg',
      title: 'Forest',
    ),
    ImpaktfullUiGalleryItem.image(
      imageUrl: 'https://www.w3schools.com/css/img_5terre.jpg',
      title: 'Beach',
    ),
    ImpaktfullUiGalleryItem.image(
      imageUrl: 'https://www.w3schools.com/css/img_mountains.jpg',
      title: 'Mountains',
    ),
    ImpaktfullUiGalleryItem.image(
      imageUrl: 'https://wallpapercave.com/wp/wp3479286.jpg',
      imageFit: BoxFit.cover,
      title: 'City (4k)',
    ),
    ImpaktfullUiGalleryItem.image(
      imageUrl:
          'https://4kwallpapers.com/images/wallpapers/mountain-landscape-7680x4320-19802.jpg',
      imageFit: BoxFit.cover,
      title: 'Mountain Landscape (8k)',
      description:
          'This is just a test image to see if we loose quality of the image when zooming in!',
    ),
  ];
  const GalleryLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, GalleryLibraryPrimaryInputs inputs) {
    return [
      ComponentsLibraryVariantDescriptor(
        height: 500,
        child: ImpaktfullUiGallery(
          items: _galleryImages,
          itemAspectRatio: (context, config) => 3 / 2,
        ),
      ),
    ];
  }

  @override
  GalleryLibraryPrimaryInputs inputs() => GalleryLibraryPrimaryInputs();
}

class GalleryLibraryPrimaryInputs extends GalleryLibraryInputs {}
