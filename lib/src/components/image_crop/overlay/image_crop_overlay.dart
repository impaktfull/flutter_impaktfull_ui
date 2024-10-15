import 'package:flutter/rendering.dart';

abstract class ImpaktfullUiImageCropOverlay {
  const ImpaktfullUiImageCropOverlay();

  CustomPainter getCustomPainter(Rect cropRect);
}
