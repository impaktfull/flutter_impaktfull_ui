import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/image_crop/image_crop_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/util/network_images.dart';

class ImageCropLibraryVariant
    extends ComponentLibraryVariant<ImageCropLibraryPrimaryInputs> {
  const ImageCropLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, ImageCropLibraryPrimaryInputs inputs) {
    return [
      const ImpaktfullUiImageCrop(
        size: 100,
        imageUrl: NetworkImages.profilePicture,
      ),
      const ImpaktfullUiImageCrop(
        size: 300,
        imageUrl: NetworkImages.profilePicture,
      ),
      const ImpaktfullUiImageCrop(
        size: 300,
        imageUrl: NetworkImages.image16x9,
      ),
    ];
  }

  @override
  ImageCropLibraryPrimaryInputs inputs() => ImageCropLibraryPrimaryInputs();
}

class ImageCropLibraryPrimaryInputs extends ImageCropLibraryInputs {}
