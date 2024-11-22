import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/components/confetti/model/confetti_particle.dart';
import 'package:impaktfull_ui_2/src/components/confetti/model/confetti_type.dart';
import 'package:impaktfull_ui_2/src/components/confetti/painter/asset_painter.dart';

class ImpaktfullUiConfettiPainter extends CustomPainter {
  final AssetPainter? assetPainter;
  final List<ImpaktfullUiConfettiParticle> particles;

  ImpaktfullUiConfettiPainter({
    required this.particles,
    required Listenable repaint,
    this.assetPainter,
  }) : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    for (final particle in particles) {
      paint.color = particle.color;

      canvas.save();
      canvas.translate(particle.position.dx, particle.position.dy);
      canvas.rotate(particle.rotation);
      canvas.translate(-particle.position.dx, -particle.position.dy);

      switch (particle.type) {
        case ImpaktfullUiConfettiType.circle:
          canvas.drawCircle(
            particle.position,
            particle.size,
            paint,
          );
          break;
        case ImpaktfullUiConfettiType.square:
          canvas.drawRect(
            Rect.fromCenter(
              center: particle.position,
              width: particle.size,
              height: particle.size,
            ),
            paint,
          );
          break;
        case ImpaktfullUiConfettiType.rectangle:
          canvas.drawRect(
            Rect.fromCenter(
              center: particle.position,
              width: particle.size,
              height: particle.size * particle.type.aspectRatio,
            ),
            paint,
          );
          break;
        case ImpaktfullUiConfettiType.roundedSquare:
          canvas.drawRRect(
            RRect.fromRectAndRadius(
              Rect.fromCenter(
                  center: particle.position,
                  width: particle.size,
                  height: particle.size),
              Radius.circular(particle.size / 5),
            ),
            paint,
          );
          break;
        case ImpaktfullUiConfettiType.roundedRectangle:
          canvas.drawRRect(
            RRect.fromRectAndRadius(
              Rect.fromCenter(
                  center: particle.position,
                  width: particle.size,
                  height: particle.size * particle.type.aspectRatio),
              Radius.circular(particle.size / 5),
            ),
            paint,
          );
          break;
        case ImpaktfullUiConfettiType.snow:
          final path = Path();
          for (var i = 0; i < 6; i++) {
            path.moveTo(particle.position.dx, particle.position.dy);
            final angle = i * pi / 3;
            final endX = particle.position.dx + cos(angle) * particle.size;
            final endY = particle.position.dy + sin(angle) * particle.size;
            path.lineTo(endX, endY);

            // Add smaller branches
            final branchLength = particle.size * 0.5;
            final branchAngle1 = angle + pi / 6;
            final branchAngle2 = angle - pi / 6;

            final midX =
                particle.position.dx + cos(angle) * (particle.size * 0.5);
            final midY =
                particle.position.dy + sin(angle) * (particle.size * 0.5);

            path.moveTo(midX, midY);
            path.lineTo(midX + cos(branchAngle1) * branchLength,
                midY + sin(branchAngle1) * branchLength);

            path.moveTo(midX, midY);
            path.lineTo(midX + cos(branchAngle2) * branchLength,
                midY + sin(branchAngle2) * branchLength);
          }
          final snowPaint = Paint.from(paint)
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1;
          canvas.drawPath(path, snowPaint);
          break;
        case ImpaktfullUiConfettiType.leaf:
          assetPainter?.paint(
            canvas,
            paint,
            particle.position,
          );
          break;
      }

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant ImpaktfullUiConfettiPainter oldDelegate) =>
      false;
}
