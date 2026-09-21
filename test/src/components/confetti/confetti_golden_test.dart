import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/confetti/model/confetti_particle.dart';
import 'package:impaktfull_ui/src/components/confetti/painter/asset_painter.dart';
import 'package:impaktfull_ui/src/components/confetti/painter/confetti_painter.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';

/// The confetti widget uses random positions: the golden paints fixed
/// particles with the painter of the confetti instead.
Widget _particles({
  required ImpaktfullUiConfettiType type,
  required Color color,
  double rotation = 0,
}) {
  final assetPainter = AssetPainter()
    ..load(ImpaktfullUiAsset.icon(PhosphorIcons.leaf()));
  return SizedBox(
    width: 240,
    height: 80,
    child: CustomPaint(
      painter: ImpaktfullUiConfettiPainter(
        repaint: const AlwaysStoppedAnimation(0),
        assetPainter: assetPainter,
        particles: [
          for (var i = 0; i < 4; i++)
            ImpaktfullUiConfettiParticle(
              type: type,
              color: color,
              position: Offset(30.0 + i * 60, 40),
              size: 8.0 + i * 4,
              speed: 1,
              angle: 0,
              rotation: rotation + i * 0.4,
            ),
        ],
      ),
    ),
  );
}

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_confetti_particles',
    columns: 2,
    goldenTests: () => [
      for (final (index, type) in ImpaktfullUiConfettiType.values.indexed)
        GoldenTest(
          description: type.name,
          child: _particles(
            type: type,
            color: Colors.primaries[index * 2 % Colors.primaries.length],
          ),
        ),
      GoldenTest(
        description: 'Rotated rectangles',
        child: _particles(
          type: ImpaktfullUiConfettiType.rectangle,
          color: Colors.teal,
          rotation: 0.8,
        ),
      ),
    ],
  );
}
