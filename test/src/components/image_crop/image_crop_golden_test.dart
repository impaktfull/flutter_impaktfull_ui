import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';

void main() {
  setUp(() => setupComponentTest());

  // Without an imageUrl: the golden only shows the overlay and the actions
  // (network images can not be loaded in tests).
  runComponentTest(
    fileName: 'impaktfull_ui_image_crop',
    columns: 2,
    goldenTests: () => [
      GoldenTest(
        description: 'Square overlay',
        child: const ImpaktfullUiImageCrop(
          size: 240,
          backgroundColor: Color(0xFFBDBDBD),
        ),
      ),
      GoldenTest(
        description: 'Square overlay with a solid border',
        child: const ImpaktfullUiImageCrop(
          size: 240,
          backgroundColor: Color(0xFFBDBDBD),
          cropOverlay: ImpaktfullUiImageCropSquareOverlay(
            isDashedBorder: false,
            borderColor: Colors.red,
            borderWidth: 4,
          ),
        ),
      ),
      GoldenTest(
        description: 'Circle overlay',
        child: const ImpaktfullUiImageCrop(
          size: 240,
          backgroundColor: Color(0xFFBDBDBD),
          cropOverlay: ImpaktfullUiImageCropCircleOverlay(),
        ),
      ),
      GoldenTest(
        description: 'Circle overlay with a solid border',
        child: const ImpaktfullUiImageCrop(
          size: 240,
          backgroundColor: Color(0xFFBDBDBD),
          cropOverlay: ImpaktfullUiImageCropCircleOverlay(
            isDashedBorder: false,
            overlayColor: Colors.black87,
          ),
        ),
      ),
    ],
  );
}
