import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/image_crop/model/crop_info.dart';

class ImpaktfullUiImageCropCropper {
  /// Crops the image based on the crop info.
  ///
  /// The cropped image should always respect the aspect ratio of the crop rect.
  ///
  /// If the image is bigger than the crop rect, the image should be scaled down to fit the crop rect.
  /// If the image is smaller than the crop rect, the biggest possible image size should be used.
  Future<ui.Image> cropImage({
    required ImpaktfullUiImageCropInfo cropInfo,
    ui.Image? image,
    File? imageFile,
    String? imageUrl,
  }) async {
    final params = {
      'image': image,
      'imageUrl': imageUrl,
      'imageFile': imageFile,
      'cropInfo': cropInfo,
    };
    return isolateCropImage(params);
  }

  Future<ui.Image> isolateCropImage(Map<String, dynamic> params) async {
    String? originalImageUrl = params['imageUrl'];
    File? originalImageFile = params['imageFile'];
    ui.Image? originalImage = params['image'];
    ImpaktfullUiImageCropInfo cropInfo = params['cropInfo'];
    final cropRect = cropInfo.cropRect;
    ui.Image imageToCrop;

    if (originalImageUrl != null) {
      imageToCrop = await downloadImage(originalImageUrl);
    } else if (originalImage != null) {
      imageToCrop = originalImage;
    } else if (originalImageFile != null) {
      // imageToCrop = await loadImage(imageFile.path);
      throw Exception('imageFile is not supported yet');
    } else {
      throw Exception('Either image or imageUrl must be provided');
    }

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final imageWidth = imageToCrop.width.toDouble();
    final imageHeight = imageToCrop.height.toDouble();
    final imageAspectRatio = AspectRatio(aspectRatio: imageWidth / imageHeight);
    final imageSize = min(imageWidth, imageHeight);

    final scaleX = cropInfo.width / cropRect.width;
    final scaleY = cropInfo.height / cropRect.height;

    final imageScaleX = imageWidth / cropInfo.width;
    final imageScaleY = imageHeight / cropInfo.height;

    // Calculate the position offset
    final positionOffset = Offset(
      cropInfo.position.dx * imageScaleX,
      cropInfo.position.dy * imageScaleY,
    );

    final scaledImageSize = imageSize * scaleX;
    final scaledCropRect = Rect.fromCenter(
      center: Offset(scaledImageSize / 2, scaledImageSize / 2),
      width: scaledImageSize,
      height: scaledImageSize,
    );

    final fullCroppedImageRect = Rect.fromCenter(
      center: Offset(imageSize / 2, imageSize / 2),
      width: imageSize,
      height: imageSize,
    );

    // Add background color
    drawBackground(
      canvas,
      fullCroppedImageRect,
      cropInfo.backgroundColor,
    );

    canvas.save();

    // Translate the canvas to the center of the crop rectangle.
    // This sets the pivot point for subsequent transformations (rotation, scaling, etc.)
    // to the center of the image, ensuring that these operations occur around the image's center.
    canvas.translate(
      fullCroppedImageRect.width / 2,
      fullCroppedImageRect.height / 2,
    );

    // Already scale the image (to it the crop rect is the same size as the image)
    canvas.scale(scaleX, scaleY);
    // Set the correct rotation
    canvas.rotate(cropInfo.rotation);
    // Flip horizontally if needed
    if (cropInfo.isFlippedHorizontal) {
      canvas.scale(-1, 1);
    }
    // Flip vertically if needed
    if (cropInfo.isFlippedVertical) {
      canvas.scale(1, -1);
    }
    // Scale the image
    canvas.scale(cropInfo.scale);
    // Translate the canvas back to the top-left corner of the image
    // This is necessary because we previously translated to the center for rotation and scaling
    // Now we need to move back so the image is drawn in the correct position
    canvas.translate(
      -(fullCroppedImageRect.width / 2),
      -(fullCroppedImageRect.height / 2),
    );

    if (imageAspectRatio.aspectRatio == 1) {
      final rotatedRect = Rect.fromLTWH(
        -positionOffset.dx * cos(cropInfo.rotation) - positionOffset.dy * sin(cropInfo.rotation),
        positionOffset.dx * sin(cropInfo.rotation) - positionOffset.dy * cos(cropInfo.rotation),
        scaledCropRect.width,
        scaledCropRect.height,
      );

      canvas.drawImageRect(
        imageToCrop,
        rotatedRect,
        scaledCropRect,
        Paint(),
      );
    } else {
      canvas.drawImageRect(
        imageToCrop,
        Rect.fromLTWH(
          -positionOffset.dx,
          -positionOffset.dy,
          scaledCropRect.width,
          scaledCropRect.height,
        ),
        scaledCropRect,
        Paint(),
      );
    }

    canvas.restore();

    print('fullCroppedImageRect: (${fullCroppedImageRect.width}, ${fullCroppedImageRect.height})');
    print('=========================');

    // Take a picture of the canvas of the biggest possible square size
    // If the image is bigger than the crop rect, the smalles width/height of the image should be used.
    return recorder.endRecording().toImage(
          fullCroppedImageRect.width.toInt(),
          fullCroppedImageRect.height.toInt(),
        );
  }

  void drawBackground(ui.Canvas canvas, Rect rect, Color backgroundColor) {
    canvas.drawRect(
      rect,
      Paint()..color = backgroundColor,
    );
  }

  Future<ui.Image> downloadImage(String imageUrl) async {
    final completer = Completer<ui.Image>();
    final networkImage = NetworkImage(imageUrl);
    networkImage.resolve(const ImageConfiguration()).addListener(ImageStreamListener(
      (info, _) {
        final image = info.image;
        completer.complete(image);
      },
    ));
    return completer.future;
  }
}
