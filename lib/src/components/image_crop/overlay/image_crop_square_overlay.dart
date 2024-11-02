import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/image_crop/overlay/image_crop_overlay.dart';

class ImpaktfullUiImageCropSquareOverlay extends ImpaktfullUiImageCropOverlay {
  final Color overlayColor;
  final Color borderColor;
  final bool isDashedBorder;
  final double borderWidth;

  const ImpaktfullUiImageCropSquareOverlay({
    this.overlayColor = Colors.black45,
    this.borderColor = Colors.white,
    this.isDashedBorder = true,
    this.borderWidth = 2.0,
  });

  @override
  CustomPainter getCustomPainter(Rect cropRect) {
    return ImpaktfullUiImageCropSquareOverlayPainter(
      cropRect: cropRect,
      overlayColor: overlayColor,
      borderColor: borderColor,
      isDashedBorder: isDashedBorder,
      borderWidth: borderWidth,
    );
  }
}

class ImpaktfullUiImageCropSquareOverlayPainter extends CustomPainter {
  final Rect cropRect;
  final Color overlayColor;
  final Color borderColor;
  final bool isDashedBorder;
  final double borderWidth;

  ImpaktfullUiImageCropSquareOverlayPainter({
    required this.cropRect,
    required this.overlayColor,
    required this.borderColor,
    required this.isDashedBorder,
    required this.borderWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw the overlay with the see-through square
    final paint = Paint()
      ..color = overlayColor
      ..style = PaintingStyle.fill;

    final Path path = Path();
    path.fillType = PathFillType.evenOdd;
    path.addRect(Offset.zero & size);
    path.addRect(cropRect);
    canvas.drawPath(path, paint);

    // Draw the crop border
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    if (isDashedBorder) {
      _drawDashedRect(canvas, cropRect, borderPaint);
    } else {
      canvas.drawRect(cropRect, borderPaint);
    }
  }

  void _drawDashedRect(Canvas canvas, Rect rect, Paint paint) {
    const dashWidth = 10;
    const dashSpace = 5;
    var startX = rect.left;
    var startY = rect.top;

    // Draw top line
    while (startX < rect.right) {
      canvas.drawLine(
        Offset(startX, startY),
        Offset(startX + dashWidth, startY),
        paint,
      );
      startX += dashWidth + dashSpace;
    }

    // Draw right line
    startX = rect.right;
    while (startY < rect.bottom) {
      canvas.drawLine(
        Offset(startX, startY),
        Offset(startX, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpace;
    }

    // Draw bottom line
    startY = rect.bottom;
    startX = rect.right;
    while (startX > rect.left) {
      canvas.drawLine(
        Offset(startX, startY),
        Offset(startX - dashWidth, startY),
        paint,
      );
      startX -= dashWidth + dashSpace;
    }

    // Draw left line
    startX = rect.left;
    startY = rect.bottom;
    while (startY > rect.top) {
      canvas.drawLine(
        Offset(startX, startY),
        Offset(startX, startY - dashWidth),
        paint,
      );
      startY -= dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
