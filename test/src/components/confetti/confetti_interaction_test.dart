import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/confetti/model/confetti_particle.dart';
import 'package:impaktfull_ui/src/components/confetti/painter/confetti_painter.dart';

Future<void> _pump(WidgetTester tester, Widget confetti) => tester.pumpWidget(
      ImpaktfullUiApp(
        showDebugFlag: false,
        title: 'test',
        home: confetti,
      ),
    );

List<ImpaktfullUiConfettiParticle> _particles(WidgetTester tester) {
  final customPaint = tester.widget<CustomPaint>(
    find.descendant(
      of: find.byType(ImpaktfullUiConfetti),
      matching: find.byType(CustomPaint),
    ),
  );
  return (customPaint.painter! as ImpaktfullUiConfettiPainter).particles;
}

/// Removes the confetti, so no animation or timer is left at the end of the
/// test.
Future<void> _unmount(WidgetTester tester) async {
  await _pump(tester, const SizedBox());
  await tester.pump(const Duration(seconds: 1));
}

void main() {
  testWidgets('adds particles of the type and color over time', (tester) async {
    await _pump(
      tester,
      const ImpaktfullUiConfetti(
        type: ImpaktfullUiConfettiType.square,
        color: Colors.orange,
      ),
    );
    await tester.pump(const Duration(milliseconds: 200));
    for (var i = 0; i < 30; i++) {
      await tester.pump(const Duration(milliseconds: 16));
    }

    final particles = _particles(tester);
    expect(particles, isNotEmpty);
    expect(
      particles.map((particle) => particle.type).toSet(),
      {ImpaktfullUiConfettiType.square},
    );
    expect(
        particles.map((particle) => particle.color).toSet(), {Colors.orange});
    await _unmount(tester);
  });

  testWidgets('randomColors picks the colors of the list', (tester) async {
    const colors = [Colors.red, Colors.green];
    await _pump(
      tester,
      const ImpaktfullUiConfetti(
        type: ImpaktfullUiConfettiType.circle,
        randomColors: colors,
      ),
    );
    await tester.pump(const Duration(milliseconds: 200));
    for (var i = 0; i < 60; i++) {
      await tester.pump(const Duration(milliseconds: 16));
    }

    final usedColors = _particles(tester).map((particle) => particle.color);
    expect(usedColors, isNotEmpty);
    expect(usedColors.every(colors.contains), isTrue);
    await _unmount(tester);
  });

  testWidgets('a random type never uses an excluded type', (tester) async {
    await _pump(
      tester,
      const ImpaktfullUiConfetti(
        excludedTypesWithRandom: [
          ImpaktfullUiConfettiType.leaf,
          ImpaktfullUiConfettiType.snow,
          ImpaktfullUiConfettiType.square,
        ],
      ),
    );
    await tester.pump(const Duration(milliseconds: 200));
    for (var i = 0; i < 90; i++) {
      await tester.pump(const Duration(milliseconds: 16));
    }

    final types = _particles(tester).map((particle) => particle.type).toSet();
    expect(types, isNotEmpty);
    expect(types, isNot(contains(ImpaktfullUiConfettiType.leaf)));
    expect(types, isNot(contains(ImpaktfullUiConfettiType.snow)));
    expect(types, isNot(contains(ImpaktfullUiConfettiType.square)));
    await _unmount(tester);
  });

  testWidgets('a new type replaces the particles', (tester) async {
    var type = ImpaktfullUiConfettiType.circle;
    late StateSetter setState;
    await _pump(
      tester,
      StatefulBuilder(
        builder: (context, setter) {
          setState = setter;
          return ImpaktfullUiConfetti(type: type);
        },
      ),
    );
    await tester.pump(const Duration(milliseconds: 200));
    for (var i = 0; i < 30; i++) {
      await tester.pump(const Duration(milliseconds: 16));
    }
    expect(_particles(tester), isNotEmpty);

    setState(() => type = ImpaktfullUiConfettiType.rectangle);
    await tester.pump();
    for (var i = 0; i < 30; i++) {
      await tester.pump(const Duration(milliseconds: 16));
    }
    expect(
      _particles(tester).map((particle) => particle.type).toSet(),
      {ImpaktfullUiConfettiType.rectangle},
    );
    await _unmount(tester);
  });

  testWidgets('without repeat the animation ends', (tester) async {
    await _pump(
      tester,
      const ImpaktfullUiConfetti(
        type: ImpaktfullUiConfettiType.circle,
        repeat: false,
        duration: Duration(milliseconds: 500),
      ),
    );
    await tester.pump(const Duration(milliseconds: 200));
    await tester.pump(const Duration(seconds: 1));
    expect(tester.binding.hasScheduledFrame, isTrue);

    // The controller runs for the duration + 20 seconds.
    await tester.pump(const Duration(seconds: 25));
    await tester.pump();
    expect(tester.binding.hasScheduledFrame, isFalse);
    await _unmount(tester);
  });

  testWidgets('with repeat the animation keeps running', (tester) async {
    await _pump(
      tester,
      const ImpaktfullUiConfetti(type: ImpaktfullUiConfettiType.circle),
    );
    await tester.pump(const Duration(milliseconds: 200));
    await tester.pump(const Duration(seconds: 60));
    await tester.pump(const Duration(milliseconds: 16));
    expect(tester.binding.hasScheduledFrame, isTrue);
    await _unmount(tester);
  });

  testWidgets('particles start above the widget with initialYOffset',
      (tester) async {
    await _pump(
      tester,
      const ImpaktfullUiConfetti(
        type: ImpaktfullUiConfettiType.circle,
        initialYOffset: 500,
      ),
    );
    await tester.pump(const Duration(milliseconds: 200));
    await tester.pump(const Duration(milliseconds: 16));
    await tester.pump(const Duration(milliseconds: 16));
    final particles = _particles(tester);
    expect(particles, isNotEmpty);
    expect(particles.every((particle) => particle.position.dy < 0), isTrue);
    await _unmount(tester);
  });

  group('ImpaktfullUiConfettiType.random', () {
    test('never returns an excluded type', () {
      final excluded = ImpaktfullUiConfettiType.values
          .where((type) => type != ImpaktfullUiConfettiType.snow)
          .toList();
      for (var i = 0; i < 20; i++) {
        expect(
          ImpaktfullUiConfettiType.random(excluded),
          ImpaktfullUiConfettiType.snow,
        );
      }
    });

    test('returns every type without exclusions', () {
      final types = {
        for (var i = 0; i < 500; i++) ImpaktfullUiConfettiType.random([]),
      };
      expect(types, ImpaktfullUiConfettiType.values.toSet());
    });
  });
}
