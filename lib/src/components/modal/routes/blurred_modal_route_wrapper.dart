import 'dart:ui';

import 'package:flutter/cupertino.dart';

/// Fades in [child] (and the optional blurred background) with [animation].
///
/// [animation] is used as is: apply the curve before passing it.
class BlurredModalRouteWrapper extends StatelessWidget {
  final Widget child;
  final bool hasBlurredBackground;
  final Animation<double> animation;

  /// How much the page below is blurred. The caller resolves it from the
  /// modal theme.
  final double blurSigma;

  const BlurredModalRouteWrapper({
    required this.child,
    required this.animation,
    required this.hasBlurredBackground,
    this.blurSigma = 8,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (hasBlurredBackground) ...[
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) => Opacity(
              opacity: animation.value,
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: blurSigma,
                  sigmaY: blurSigma,
                ),
                child: Container(),
              ),
            ),
          ),
        ],
        FadeTransition(
          opacity: animation,
          child: child,
        ),
      ],
    );
  }
}
