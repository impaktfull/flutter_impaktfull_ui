import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';

class ImpaktfullUiFocusFeedback extends StatelessWidget {
  final Widget child;
  final bool hasFocus;
  final BorderRadiusGeometry? borderRadius;
  final bool enabled;

  const ImpaktfullUiFocusFeedback({
    required this.child,
    required this.hasFocus,
    this.borderRadius,
    this.enabled = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (!enabled) return child;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          left: -1,
          right: -1,
          top: -1,
          bottom: -1,
          child: IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                border: Border.all(
                  color: hasFocus
                      ? theme.colors.accent.withOpacity(0.66)
                      : Colors.transparent,
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
