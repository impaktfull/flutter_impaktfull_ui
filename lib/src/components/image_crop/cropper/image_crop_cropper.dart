import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/components/image_crop/model/crop_info.dart';

class ImpaktfullUiImageCropCropper {
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
    final adjustedCropRect = cropInfo.cropRect;

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

    final scaleWidth = imageWidth / cropInfo.width;
    final scaleHeight = imageHeight / cropInfo.height;
    final scaledCropRect = Rect.fromLTWH(
      adjustedCropRect.left * scaleWidth,
      adjustedCropRect.top * scaleHeight,
      adjustedCropRect.width * scaleWidth,
      adjustedCropRect.height * scaleHeight,
    );

    final srcRect = Rect.fromLTRB(
      scaledCropRect.left.clamp(0, imageWidth),
      scaledCropRect.top.clamp(0, imageHeight),
      scaledCropRect.right.clamp(0, imageWidth),
      scaledCropRect.bottom.clamp(0, imageHeight),
    );

    // Add background color if not transparent
    if (cropInfo.backgroundColor != const Color(0x00000000)) {
      canvas.drawRect(
        Rect.fromLTWH(0, 0, srcRect.width, srcRect.height),
        Paint()..color = cropInfo.backgroundColor,
      );
    }

    canvas.save();
    // Translate the canvas to the center of the crop rectangle.
    // This sets the pivot point for subsequent transformations (rotation, scaling, etc.)
    // to the center of the image, ensuring that these operations occur around the image's center.
    canvas.translate(
      srcRect.width / 2,
      srcRect.height / 2,
    );
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
      -(srcRect.width / 2),
      -(srcRect.height / 2),
    );

    final positionOffsetX = cropInfo.position.dx * scaleWidth;
    final positionOffsetY = cropInfo.position.dy * scaleHeight;

    print('Image Size: ($imageWidth, $imageHeight)');
    print('Original Size: (${cropInfo.width}, ${cropInfo.height})');
    print('Size: (${srcRect.width}, ${srcRect.height})');
    print('Position: (${cropInfo.position.dx}, ${cropInfo.position.dy})');
    print('Position (scaled): (${cropInfo.position.dx * scaleWidth}, ${cropInfo.position.dy * scaleHeight})');

    // Draw the image, maintaining the aspect ratio
    canvas.drawImageRect(
      imageToCrop,
      Rect.fromLTWH(
        srcRect.left - positionOffsetX,
        srcRect.top - positionOffsetY,
        srcRect.width,
        srcRect.height,
      ),
      Rect.fromLTWH(
        0,
        0,
        srcRect.width,
        srcRect.height,
      ),
      Paint(),
    );

    canvas.restore();

    final image = await recorder.endRecording().toImage(
          srcRect.width.toInt(),
          srcRect.height.toInt(),
        );
    return image;
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
