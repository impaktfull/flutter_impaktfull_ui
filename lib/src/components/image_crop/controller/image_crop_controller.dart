import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:impaktfull_ui_2/src/components/image_crop/cropper/image_crop_cropper.dart';
import 'package:impaktfull_ui_2/src/components/image_crop/model/crop_info.dart';

class ImpaktfullUiImageCropController {
  final cropper = ImpaktfullUiImageCropCropper();

  Future<ui.Image> cropUrl({
    required ImpaktfullUiImageCropInfo cropInfo,
    required String imageUrl,
  }) async =>
      cropper.cropImage(
        cropInfo: cropInfo,
        imageUrl: imageUrl,
      );
  Future<ui.Image> cropImage({
    required ImpaktfullUiImageCropInfo cropInfo,
    required ui.Image image,
  }) async =>
      cropper.cropImage(
        cropInfo: cropInfo,
        image: image,
      );

  Future<ui.Image> cropImageFile({
    required ImpaktfullUiImageCropInfo cropInfo,
    required File file,
  }) async =>
      cropper.cropImage(
        cropInfo: cropInfo,
        imageFile: file,
      );

  void dispose() {}
}
