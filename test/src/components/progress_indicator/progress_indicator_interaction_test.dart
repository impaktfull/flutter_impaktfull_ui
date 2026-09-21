import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../_data_display_test_helpers.dart';

/// Records the arcs a painter draws.
class _ArcRecordingCanvas implements Canvas {
  final arcs = <({Rect rect, double sweepAngle, Paint paint})>[];

  @override
  void drawArc(
    Rect rect,
    double startAngle,
    double sweepAngle,
    bool useCenter,
    Paint paint,
  ) =>
      arcs.add((rect: rect, sweepAngle: sweepAngle, paint: paint));

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

void main() {
  final progressTheme =
      ImpaktfullUiTheme.getDefault().components.progressIndicator;

  Future<void> pumpIndicator(WidgetTester tester, Widget indicator) =>
      pumpSized(
        tester,
        Align(
          alignment: Alignment.topLeft,
          child: SizedBox(width: 200, height: 200, child: indicator),
        ),
      );

  group('type', () {
    final expectedTypes = {
      ImpaktfullUiProgressIndicatorType.line: ImpaktfullUiLineProgressIndicator,
      ImpaktfullUiProgressIndicatorType.circle:
          ImpaktfullUiCircleProgressIndicator,
      ImpaktfullUiProgressIndicatorType.halfCircle:
          ImpaktfullUiHalfCircleProgressIndicator,
    };
    for (final MapEntry(key: type, value: widgetType)
        in expectedTypes.entries) {
      testWidgets('$type shows a $widgetType', (tester) async {
        await pumpIndicator(
          tester,
          ImpaktfullUiProgressIndicator(type: type, value: 0.5),
        );
        expect(find.byType(widgetType), findsOneWidget);
      });
    }
  });

  for (final type in ImpaktfullUiProgressIndicatorType.values) {
    for (final (value, text) in [(0.0, '0%'), (0.5, '50%'), (1.0, '100%')]) {
      testWidgets('$type: $value shows $text', (tester) async {
        await pumpIndicator(
          tester,
          ImpaktfullUiProgressIndicator(
            type: type,
            value: value,
            showText: true,
          ),
        );
        expect(find.text(text), findsOneWidget);
      });
    }

    testWidgets('$type: no text by default', (tester) async {
      await pumpIndicator(
        tester,
        ImpaktfullUiProgressIndicator(type: type, value: 0.5),
      );
      expect(find.text('50%'), findsNothing);
    });

    testWidgets('$type: animates from the old to the new value',
        (tester) async {
      var value = 0.0;
      late StateSetter setState;
      await pumpIndicator(
        tester,
        StatefulBuilder(
          builder: (context, setter) {
            setState = setter;
            return ImpaktfullUiProgressIndicator(type: type, value: value);
          },
        ),
      );
      double animatedValue() => tester
          .widget<TweenAnimationBuilder<double>>(
            find.byType(TweenAnimationBuilder<double>),
          )
          .tween
          .end!;
      setState(() => value = 1);
      await tester.pump();
      expect(animatedValue(), 1);
      await tester.pump(progressTheme.durations.progress ~/ 2);
      final halfway = tester.state(find.byType(TweenAnimationBuilder<double>))
          as AnimatedWidgetBaseState;
      expect(halfway.animation.value, greaterThan(0));
      expect(halfway.animation.value, lessThan(1));
      await tester.pumpAndSettle();
      expect(halfway.animation.value, 1);
    });

    testWidgets('$type: animate false shows the value immediately',
        (tester) async {
      await pumpIndicator(
        tester,
        ImpaktfullUiProgressIndicator(type: type, value: 1, animate: false),
      );
      expect(
        tester
            .widget<TweenAnimationBuilder<double>>(
              find.byType(TweenAnimationBuilder<double>),
            )
            .duration,
        Duration.zero,
      );
    });
  }

  testWidgets('line: the bar fills the value and uses the color and width',
      (tester) async {
    await pumpIndicator(
      tester,
      const ImpaktfullUiProgressIndicator(
        value: 0.25,
        color: Colors.green,
        width: 10,
        animate: false,
      ),
    );
    final bar = find.descendant(
      of: find.byType(FractionallySizedBox),
      matching: find.byType(Container),
    );
    expect(tester.getSize(bar), const Size(50, 10));
    expect(
      (tester.widget<Container>(bar).decoration as BoxDecoration).color,
      Colors.green,
    );
  });

  group('painters', () {
    ImpaktfullUiCircleProgressPainter circlePainter(double progress) =>
        ImpaktfullUiCircleProgressPainter(
          progress: progress,
          strokeWidth: 8,
          backgroundColor: Colors.grey,
          foregroundColor: Colors.green,
          borderColor: Colors.black,
        );

    ImpaktfullUiHalfCircleProgressPainter halfCirclePainter(double progress) =>
        ImpaktfullUiHalfCircleProgressPainter(
          progress: progress,
          strokeWidth: 8,
          backgroundColor: Colors.grey,
          foregroundColor: Colors.green,
          borderColor: Colors.black,
        );

    for (final progress in [0.0, 0.5, 1.0]) {
      test('circle: $progress sweeps ${progress * 360} degrees', () {
        final canvas = _ArcRecordingCanvas();
        circlePainter(progress).paint(canvas, const Size(100, 100));
        final arc = canvas.arcs.single;
        expect(arc.sweepAngle, closeTo(2 * pi * progress, 0.0001));
        expect(arc.paint.color, isSameColorAs(Colors.green));
      });

      test('half circle: $progress sweeps ${progress * 180} degrees', () {
        final canvas = _ArcRecordingCanvas();
        halfCirclePainter(progress).paint(canvas, const Size(100, 50));
        // Border, background and progress.
        expect(canvas.arcs.length, 3);
        expect(canvas.arcs.last.sweepAngle, closeTo(pi * progress, 0.0001));
        expect(canvas.arcs.last.paint.color, isSameColorAs(Colors.green));
      });
    }

    test('circle: the progress stroke is drawn inside the bounds', () {
      final canvas = _ArcRecordingCanvas();
      circlePainter(1).paint(canvas, const Size(100, 100));
      final arc = canvas.arcs.single;
      final painted = arc.rect.inflate(arc.paint.strokeWidth / 2);
      expect(
        (Offset.zero & const Size(100, 100)).expandToInclude(painted),
        Offset.zero & const Size(100, 100),
      );
    });

    test(
      'half circle: the progress stroke is drawn inside the bounds',
      () {
        final canvas = _ArcRecordingCanvas();
        halfCirclePainter(1).paint(canvas, const Size(100, 50));
        final arc = canvas.arcs.last;
        final strokeWidth = arc.paint.strokeWidth;
        // The top half of the circle, with the stroke around it. The round
        // caps at the ends reach half a stroke below the center.
        final painted = Rect.fromLTRB(
          arc.rect.left - strokeWidth / 2,
          arc.rect.top - strokeWidth / 2,
          arc.rect.right + strokeWidth / 2,
          arc.rect.center.dy + strokeWidth / 2,
        );
        expect(
          (Offset.zero & const Size(100, 50)).expandToInclude(painted),
          Offset.zero & const Size(100, 50),
        );
      },
    );

    test('painters always repaint', () {
      expect(circlePainter(0).shouldRepaint(circlePainter(0)), isTrue);
      expect(halfCirclePainter(0).shouldRepaint(halfCirclePainter(0)), isTrue);
    });
  });
}
