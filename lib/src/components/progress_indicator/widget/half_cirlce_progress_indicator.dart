import 'dart:math';

import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/progress_indicator/progress_indicator.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';

class ImpaktfullUiHalfCircleProgressIndicator extends StatelessWidget {
  final double value;
  final bool showText;
  final Color? color;
  final bool animate;
  final ImpaktfullUiProgressIndicatorTheme? theme;

  const ImpaktfullUiHalfCircleProgressIndicator({
    required this.value,
    this.showText = false,
    this.color,
    this.animate = true,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder<
        ImpaktfullUiProgressIndicatorTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) =>
          LayoutBuilder(builder: (context, constraints) {
        final size = min(constraints.maxWidth, constraints.maxHeight);
        return SizedBox(
          width: size,
          height: size / 2,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned.fill(
                child: TweenAnimationBuilder<double>(
                  duration: animate
                      ? componentTheme.durations.progress
                      : Duration.zero,
                  curve: Curves.easeInOut,
                  tween: Tween(begin: 0, end: value),
                  builder: (context, animatedValue, child) => CustomPaint(
                    painter: HalfCircleProgressPainter(
                      progress: animatedValue,
                      strokeWidth: componentTheme.dimens.height,
                      backgroundColor: componentTheme.colors.background,
                      foregroundColor:
                          color ?? componentTheme.colors.foreground,
                      borderColor: componentTheme.colors.border,
                    ),
                  ),
                ),
              ),
              if (showText) ...[
                Positioned(
                  bottom: 8,
                  child: Text(
                    '${(value * 100).toStringAsFixed(0)}%',
                    style: componentTheme.textStyles.text,
                  ),
                ),
              ],
            ],
          ),
        );
      }),
    );
  }
}

class HalfCircleProgressPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;

  HalfCircleProgressPainter({
    required this.progress,
    required this.strokeWidth,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.borderColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final radius = min(size.width / 2, size.height);

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
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi,
      pi,
      false,
      borderPaint,
    );

    // Draw background
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi,
      pi,
      false,
      backgroundPaint,
    );

    // Draw progress
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi,
      pi * progress,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
