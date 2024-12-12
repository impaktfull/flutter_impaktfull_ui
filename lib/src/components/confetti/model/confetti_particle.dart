import 'package:flutter/rendering.dart';
import 'package:impaktfull_ui/src/components/confetti/model/confetti_type.dart';

class ImpaktfullUiConfettiParticle {
  Offset position;
  final Color color;
  final ImpaktfullUiConfettiType type;
  final double size;
  final double speed;
  final double angle;
  double rotation;

  ImpaktfullUiConfettiParticle({
    required this.position,
    required this.color,
    required this.type,
    required this.size,
    required this.speed,
    required this.angle,
    required this.rotation,
  });
}
