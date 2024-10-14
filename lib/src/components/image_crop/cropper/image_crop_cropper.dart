import 'package:flutter/material.dart';

class CropPainter extends CustomPainter {
  final Rect cropRect;

  CropPainter(this.cropRect);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    // Create a path for the entire canvas
    final path = Path()..addRect(Offset.zero & size);

    // Create a path for the crop area
    final cropPath = Path()..addRect(cropRect);

    // Use difference to create a path with a see-through rect
    final finalPath = Path.combine(
      PathOperation.difference,
      path,
      cropPath,
    );

    // Draw the overlay with the see-through rect
    canvas.drawPath(finalPath, paint);

    // Draw the crop border
    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    canvas.drawRect(cropRect, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
