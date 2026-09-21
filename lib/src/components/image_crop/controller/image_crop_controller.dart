import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:cross_file/cross_file.dart';
import 'package:impaktfull_ui/src/components/image_crop/cropper/image_crop_cropper.dart';
import 'package:impaktfull_ui/src/components/image_crop/model/crop_info.dart';
import 'package:impaktfull_ui/src/util/io_file/io_file.dart';

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

  /// Crops an encoded image (e.g. PNG or JPEG). Works on every platform.
  Future<ui.Image> cropImageBytes({
    required ImpaktfullUiImageCropInfo cropInfo,
    required Uint8List bytes,
  }) async =>
      cropper.cropImage(
        cropInfo: cropInfo,
        imageBytes: bytes,
      );

  /// Crops the image of an [XFile] (e.g. from image_picker or file_selector).
  /// Works on every platform.
  Future<ui.Image> cropXFile({
    required ImpaktfullUiImageCropInfo cropInfo,
    required XFile xFile,
  }) async =>
      cropper.cropImage(
        cropInfo: cropInfo,
        xFile: xFile,
      );

  /// Crops the image of a `File` of `dart:io`. Throws an [UnsupportedError] on
  /// the web.
  @Deprecated(
      'Use cropXFile or cropImageBytes instead, they work on every platform including the web. Will be removed in 1.0.0.')
  Future<ui.Image> cropImageFile({
    required ImpaktfullUiImageCropInfo cropInfo,
    required File file,
  }) async =>
      cropper.cropImage(
        cropInfo: cropInfo,
        // ignore: deprecated_member_use_from_same_package
        imageFile: file,
      );

  void dispose() {}
}
