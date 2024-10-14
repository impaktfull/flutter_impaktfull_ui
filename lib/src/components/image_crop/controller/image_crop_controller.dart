import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/components/image_crop/model/crop_info.dart';

Future<ui.Image> isolateCropImage(Map<String, dynamic> params) async {
  String? originalImageUrl = params['imageUrl'];
  File? originalImageFile = params['imageFile'];
  ui.Image? originalImage = params['image'];
  CropInfo cropInfo = params['cropInfo'];
  final adjustedCropRect = cropInfo.cropRect;

  ui.Image imageToCrop;

  if (originalImageUrl != null) {
    imageToCrop = await _loadNetworkImage(originalImageUrl);
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
  final scaledCropRect = Rect.fromLTRB(
    adjustedCropRect.left * scaleWidth,
    adjustedCropRect.top * scaleHeight,
    adjustedCropRect.right * scaleWidth,
    adjustedCropRect.bottom * scaleHeight,
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

Future<ui.Image> _loadNetworkImage(String imageUrl) async {
  final completer = Completer<ui.Image>();
  final networkImage = NetworkImage(imageUrl);
  networkImage
      .resolve(const ImageConfiguration())
      .addListener(ImageStreamListener(
    (info, _) {
      final image = info.image;
      completer.complete(image);
    },
  ));
  return completer.future;
}

class ImpaktfullUiImageCropController {
  Future<ui.Image> cropUrl({
    required CropInfo cropInfo,
    required String imageUrl,
  }) async =>
      _crop(
        cropInfo: cropInfo,
        imageUrl: imageUrl,
      );
  Future<ui.Image> cropImage({
    required CropInfo cropInfo,
    required ui.Image image,
  }) async =>
      _crop(
        cropInfo: cropInfo,
        image: image,
      );

  Future<ui.Image> cropImageFile({
    required CropInfo cropInfo,
    required File file,
  }) async =>
      _crop(
        cropInfo: cropInfo,
        imageFile: file,
      );

  Future<ui.Image> _crop({
    required CropInfo cropInfo,
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

  void dispose() {}
}
