import 'dart:math';

import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/image_crop/overlay/image_crop_overlay.dart';

class ImpaktfullUiImageCropCircleOverlay extends ImpaktfullUiImageCropOverlay {
  final Color overlayColor;
  final Color borderColor;
  final bool isDashedBorder;
  final double borderWidth;

  const ImpaktfullUiImageCropCircleOverlay({
    this.overlayColor = Colors.black45,
    this.borderColor = Colors.white,
    this.isDashedBorder = true,
    this.borderWidth = 2.0,
  });

  @override
  CustomPainter getCustomPainter(Rect cropRect) {
    return ImpaktfullUiImageCropCircleOverlayPainter(
      cropRect: cropRect,
      overlayColor: overlayColor,
      borderColor: borderColor,
      isDashedBorder: isDashedBorder,
      borderWidth: borderWidth,
    );
  }
}

class ImpaktfullUiImageCropCircleOverlayPainter extends CustomPainter {
  final Rect cropRect;
  final Color overlayColor;
  final Color borderColor;
  final bool isDashedBorder;
  final double borderWidth;

  ImpaktfullUiImageCropCircleOverlayPainter({
    required this.cropRect,
    this.overlayColor = Colors.black45,
    this.borderColor = Colors.white,
    this.isDashedBorder = false,
    this.borderWidth = 2.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw the overlay with the see-through circle
    final paint = Paint()
      ..color = overlayColor
      ..style = PaintingStyle.fill;

    final Path path = Path();
    path.fillType = PathFillType.evenOdd;
    path.addRect(Offset.zero & size);
    path.addOval(cropRect);
    canvas.drawPath(path, paint);

    // Draw the circular crop border
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    if (isDashedBorder) {
      _drawDashedCircle(canvas, cropRect.center, cropRect.width / 2, borderPaint);
    } else {
      canvas.drawCircle(
        cropRect.center,
        cropRect.width / 2,
        borderPaint,
      );
    }
  }

  void _drawDashedCircle(Canvas canvas, Offset center, double radius, Paint paint) {
    const dashCount = 60;
    var startAngle = 0.0;

    for (int i = 0; i < dashCount; i++) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        pi / dashCount,
        false,
        paint,
      );
      startAngle += 2 * pi / dashCount;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
