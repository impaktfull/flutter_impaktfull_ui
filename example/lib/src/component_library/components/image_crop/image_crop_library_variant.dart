import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/image_crop/image_crop_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/util/network_images.dart';

class ImageCropLibraryVariant extends ComponentLibraryVariant<ImageCropLibraryPrimaryInputs> {
  const ImageCropLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, ImageCropLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiImageCrop(
        size: 120,
        backgroundColor: theme.colors.accent,
        imageUrl: NetworkImages.profilePicture,
      ),
      ImpaktfullUiImageCrop(
        size: 300,
        backgroundColor: theme.colors.accent,
        imageUrl: NetworkImages.profilePicture,
      ),
      ImpaktfullUiImageCrop(
        size: 300,
        backgroundColor: theme.colors.accent,
        imageUrl: NetworkImages.image16x9,
      ),
      ImpaktfullUiImageCrop(
        size: 300,
        backgroundColor: theme.colors.accent,
        imageUrl:
            'https://i0.wp.com/digital-photography-school.com/wp-content/uploads/2021/05/rule-of-thirds-in-photography-1002-1.jpg?resize=400%2C592&ssl=1',
      ),
    ];
  }

  @override
  ImageCropLibraryPrimaryInputs inputs() => ImageCropLibraryPrimaryInputs();
}

class ImageCropLibraryPrimaryInputs extends ImageCropLibraryInputs {}
