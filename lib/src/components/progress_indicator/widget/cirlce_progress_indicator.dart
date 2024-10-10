import 'dart:math';

import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/progress_indicator/progress_indicator.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';

class ImpaktfullUiCircleProgressIndicator extends StatelessWidget {
  final double value;
  final bool showText;
  final ImpaktfullUiProgressIndicatorTheme? theme;

  const ImpaktfullUiCircleProgressIndicator({
    required this.value,
    this.showText = false,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<
        ImpaktfullUiProgressIndicatorTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) =>
          LayoutBuilder(builder: (context, constraints) {
        final size = min(constraints.maxWidth, constraints.maxHeight);
        return SizedBox(
          width: size,
          height: size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: TweenAnimationBuilder<double>(
                  duration: componentTheme.durations.progress,
                  curve: Curves.easeInOut,
                  tween: Tween(begin: 0, end: value),
                  builder: (context, animatedValue, child) => CustomPaint(
                    painter: CircleProgressPainter(
                      progress: animatedValue,
                      strokeWidth: componentTheme.dimens.height,
                      backgroundColor: componentTheme.colors.background,
                      foregroundColor: componentTheme.colors.foreground,
                      borderColor: componentTheme.colors.border,
                    ),
                  ),
                ),
              ),
              if (showText) ...[
                Text(
                  '${(value * 100).toStringAsFixed(0)}%',
                  style: componentTheme.textStyles.text,
                ),
              ],
            ],
          ),
        );
      }),
    );
  }
}

class CircleProgressPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;

  CircleProgressPainter({
    required this.progress,
    required this.strokeWidth,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.borderColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (min(size.width, size.height) - strokeWidth) / 2;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth + 2
      ..strokeCap = StrokeCap.round;

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final foregroundPaint = Paint()
      ..color = foregroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Draw border
    canvas.drawCircle(center, radius, borderPaint);

    // Draw background
    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw progress
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * progress,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
