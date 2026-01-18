import 'package:flutter/material.dart';

class ImpaktfullUiClampedFractionallySizedBox extends StatelessWidget {
  final double widthFactor;
  final double? minWidth;
  final double? maxWidth;
  final Alignment alignment;
  final Widget child;
  const ImpaktfullUiClampedFractionallySizedBox({
    required this.child,
    this.widthFactor = 1,
    this.minWidth,
    this.maxWidth,
    this.alignment = Alignment.center,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth * widthFactor;
        final clampedWidth =
            width.clamp(minWidth ?? 0, maxWidth ?? double.infinity);
        return Align(
          alignment: alignment,
          child: SizedBox(
            width: clampedWidth.toDouble(),
            child: child,
          ),
        );
      },
    );
  }
}
