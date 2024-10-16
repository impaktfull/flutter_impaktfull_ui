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

    // Image info
    final imageWidth = imageToCrop.width.toDouble();
    final imageHeight = imageToCrop.height.toDouble();
    final imageAspectRatio = imageWidth / imageHeight;

    // Crop rect padding info
    final cropRectScaleX = cropInfo.width / cropRect.width;
    final cropRectScaleY = cropInfo.height / cropRect.height;

    // Crop rect info
    final cropAspectRatio = cropRect.width / cropRect.height;
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

    // Translate the canvas back to the top-left corner of the image
    // This is necessary because we previously translated to the center for rotation and scaling
    // Now we need to move back so the image is drawn in the correct position
    canvas.translate(
      -(fullCroppedImageRect.width / 2),
      -(fullCroppedImageRect.height / 2),
    );

    // Draw the image
    canvas.drawImageRect(
      imageToCrop,
      Rect.fromLTWH(
        0,
        0,
        imageWidth,
        imageHeight,
      ),
      Rect.fromLTWH(
        spacingX,
        spacingY,
        imageRect.width,
        imageRect.height,
      ),
      Paint(),
    );

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

  void _drawBackground(ui.Canvas canvas, Rect rect, Color backgroundColor) {
    canvas.drawRect(
      rect,
      Paint()..color = backgroundColor,
    );
  }

  void _setUserChanges(ui.Canvas canvas, ImpaktfullUiImageCropInfo cropInfo) {
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
