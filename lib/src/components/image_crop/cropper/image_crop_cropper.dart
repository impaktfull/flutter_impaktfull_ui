import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/image_crop/model/crop_info.dart';
import 'package:impaktfull_ui/src/util/io_file/io_file.dart';

class ImpaktfullUiImageCropCropper {
  /// Crops the image based on the crop info.
  ///
  /// The cropped image should always respect the aspect ratio of the crop rect.
  ///
  /// If the image is bigger than the crop rect, the image should be scaled down to fit the crop rect.
  /// If the image is smaller than the crop rect, the biggest possible image size should be used.
  ///
  /// Pass one image source: [image], [imageBytes] (an encoded image, e.g. PNG
  /// or JPEG), [xFile] or [imageUrl].
  Future<ui.Image> cropImage({
    required ImpaktfullUiImageCropInfo cropInfo,
    ui.Image? image,
    Uint8List? imageBytes,
    XFile? xFile,
    @Deprecated(
        'Use imageBytes or xFile instead, they work on every platform including the web. Will be removed in 1.0.0.')
    File? imageFile,
    String? imageUrl,
  }) async {
    final params = {
      'image': image,
      'imageBytes': imageBytes,
      'xFile': xFile,
      'imageUrl': imageUrl,
      'imageFile': imageFile,
      'cropInfo': cropInfo,
    };
    return isolateCropImage(params);
  }

  Future<ui.Image> isolateCropImage(Map<String, dynamic> params) async {
    final originalImageUrl = params['imageUrl'] as String?;
    final originalImageFile = params['imageFile'] as File?;
    final originalImageBytes = params['imageBytes'] as Uint8List?;
    final originalXFile = params['xFile'] as XFile?;
    final originalImage = params['image'] as ui.Image?;
    final cropInfo = params['cropInfo'] as ImpaktfullUiImageCropInfo;
    final cropRect = cropInfo.cropRect;
    ui.Image imageToCrop;

    if (originalImageUrl != null) {
      imageToCrop = await downloadImage(originalImageUrl);
    } else if (originalImage != null) {
      imageToCrop = originalImage;
    } else if (originalImageBytes != null) {
      imageToCrop = await decodeImage(originalImageBytes);
    } else if (originalXFile != null) {
      imageToCrop = await decodeImage(await originalXFile.readAsBytes());
    } else if (originalImageFile != null) {
      // Only works on platforms with dart:io, throws an UnsupportedError on the web
      imageToCrop = await decodeImage(await readIoFileBytes(originalImageFile));
    } else {
      throw Exception(
          'Either image, imageBytes, xFile or imageUrl must be provided');
    }

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    // Image info
    final imageWidth = imageToCrop.width.toDouble();
    final imageHeight = imageToCrop.height.toDouble();
    final imageAspectRatio = imageWidth / imageHeight;
    final cropAspectRatio = cropInfo.width / cropInfo.height;

    // Calculate scale factors considering aspect ratios
    double imageScaleX;
    double imageScaleY;
    if (imageAspectRatio > cropAspectRatio) {
      imageScaleY = imageHeight / cropInfo.height;
      imageScaleX = imageScaleY;
    } else if (imageAspectRatio < cropAspectRatio) {
      imageScaleX = imageWidth / cropInfo.width;
      imageScaleY = imageScaleX;
    } else {
      imageScaleX = imageWidth / cropInfo.width;
      imageScaleY = imageHeight / cropInfo.height;
    }

    // Crop rect padding info
    final cropRectScaleX = cropInfo.width / cropRect.width;
    final cropRectScaleY = cropInfo.height / cropRect.height;

    // Crop rect info
    double croppedRectHeight;
    double croppedRectWidth;
    if (cropAspectRatio > 1) {
      // Aspect ratio is bigger than 1:1 (example: 2/1)
      croppedRectHeight = imageHeight;
      croppedRectWidth = croppedRectHeight * imageAspectRatio;
    } else if (cropAspectRatio < 1) {
      // Aspect ratio is smaller than 1:1 (example: 1/2)
      croppedRectWidth = imageWidth;
      croppedRectHeight = croppedRectWidth / imageAspectRatio;
    } else {
      // Aspect ratio is 1:1
      croppedRectWidth = min(imageHeight, imageWidth);
      croppedRectHeight = croppedRectWidth;
    }

    final imageCropScaleX = croppedRectHeight / imageHeight;
    final imageCropScaleY = croppedRectWidth / imageWidth;
    final cropedImageWidth = croppedRectWidth * imageCropScaleX;
    final cropedImageHeight = croppedRectHeight * imageCropScaleY;

    final spacingX = (croppedRectWidth - cropedImageWidth) / 2;
    final spacingY = (croppedRectHeight - cropedImageHeight) / 2;

    final imageRect = Rect.fromLTWH(
      spacingX,
      spacingY,
      cropedImageWidth,
      cropedImageHeight,
    );

    final fullCroppedImageRect = Rect.fromLTWH(
      0,
      0,
      croppedRectWidth,
      croppedRectHeight,
    );

    // Add background color
    _drawBackground(
      canvas,
      fullCroppedImageRect,
      cropInfo.backgroundColor,
    );

    // Save the canvas state
    canvas.save();

    // Translate the canvas to the center of the crop rectangle.
    // This sets the pivot point for subsequent transformations (rotation, scaling, etc.)
    // to the center of the image, ensuring that these operations occur around the image's center.
    canvas.translate(
      fullCroppedImageRect.width / 2,
      fullCroppedImageRect.height / 2,
    );

    // Scale the image to the crop rect
    canvas.scale(
      cropRectScaleX,
      cropRectScaleY,
    );

    // Set the user changes (rotation, flip, scale)
    _setUserChanges(canvas, cropInfo);

    // Calculate the position offset after rotation
    final positionOffset = Offset(
      -cropInfo.position.dx * imageScaleX / cropInfo.scale,
      -cropInfo.position.dy * imageScaleY / cropInfo.scale,
    );

    // Translate the canvas back to the top-left corner of the image
    // This is necessary because we previously translated to the center for rotation and scaling
    // Now we need to move back so the image is drawn in the correct position
    canvas.translate(
      -(fullCroppedImageRect.width / 2),
      -(fullCroppedImageRect.height / 2),
    );

    // Draw the image, taking the rotated position into account
    canvas.drawImageRect(
      imageToCrop,
      Rect.fromLTWH(
        0,
        0,
        imageWidth,
        imageHeight,
      ),
      Rect.fromLTWH(
        spacingX - positionOffset.dx,
        spacingY - positionOffset.dy,
        imageRect.width,
        imageRect.height,
      ),
      Paint(),
    );

    canvas.restore();

    // Take a picture of the canvas of the biggest possible square size
    // If the image is bigger than the crop rect, the smallest width/height of the image should be used.
    return recorder.endRecording().toImage(
          fullCroppedImageRect.width.toInt(),
          fullCroppedImageRect.height.toInt(),
        );
  }

  void _drawBackground(ui.Canvas canvas, Rect rect, Color backgroundColor) {
    canvas.drawRect(
      rect,
      Paint()..color = backgroundColor,
    );
  }

  void _setUserChanges(ui.Canvas canvas, ImpaktfullUiImageCropInfo cropInfo) {
    // Scale the image
    canvas.scale(cropInfo.scale);
  }

  /// Decodes an encoded image (e.g. PNG or JPEG) into its first frame.
  Future<ui.Image> decodeImage(Uint8List bytes) async {
    final codec = await ui.instantiateImageCodec(bytes);
    try {
      final frame = await codec.getNextFrame();
      return frame.image;
    } finally {
      codec.dispose();
    }
  }

  Future<ui.Image> downloadImage(String imageUrl) async {
    final completer = Completer<ui.Image>();
    final stream = NetworkImage(imageUrl).resolve(const ImageConfiguration());
    late final ImageStreamListener listener;
    listener = ImageStreamListener(
      (info, _) {
        stream.removeListener(listener);
        if (completer.isCompleted) return;
        completer.complete(info.image);
      },
      onError: (error, stackTrace) {
        stream.removeListener(listener);
        if (completer.isCompleted) return;
        completer.completeError(error, stackTrace);
      },
    );
    stream.addListener(listener);
    return completer.future;
  }
}
