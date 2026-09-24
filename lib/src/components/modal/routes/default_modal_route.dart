import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/modal/routes/blurred_modal_route_wrapper.dart';
import 'package:impaktfull_ui/src/util/animation/animation_util.dart';
import 'package:impaktfull_ui/src/util/device_util/device_util.dart';

class ImpaktfullUiDefaultModalRoute<T> extends RawDialogRoute<T> {
  final bool _hasBlurredBackground;

  /// How much the page below the modal is blurred, when
  /// [hasBlurredBackground] is true.
  ///
  /// The caller resolves it from the modal theme: a route has no context of
  /// its own to read a theme from.
  final double blurSigma;

  /// Created once per route (not on every rebuild) and disposed with the route.
  CurvedAnimation? _curvedAnimation;

  ImpaktfullUiDefaultModalRoute({
    required BuildContext context,
    required WidgetBuilder builder,

    /// The caller resolves it from the modal theme: a route has no context of
    /// its own to read a theme from.
    required super.transitionDuration,
    CapturedThemes? themes,
    super.barrierColor = Colors.black54,
    super.barrierDismissible,
    String? barrierLabel,
    bool useSafeArea = true,
    bool hasBlurredBackground = true,
    this.blurSigma = 8,
    super.settings,
    super.anchorPoint,
    super.traversalEdgeBehavior,
  })  : _hasBlurredBackground = hasBlurredBackground,
        super(
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            final Widget pageChild = Builder(builder: builder);
            Widget dialog = themes?.wrap(pageChild) ?? pageChild;
            if (useSafeArea) {
              dialog = SafeArea(child: dialog);
            }
            return dialog;
          },
          barrierLabel: barrierLabel ??
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
        );

  /// No transition when the user asked to reduce motion.
  @override
  Duration get transitionDuration {
    final context = navigator?.context;
    if (context != null && ImpaktfullUiAnimationUtil.reduceMotion(context)) {
      return Duration.zero;
    }
    return super.transitionDuration;
  }

  @override
  Duration get reverseTransitionDuration {
    final context = navigator?.context;
    if (context != null && ImpaktfullUiAnimationUtil.reduceMotion(context)) {
      return Duration.zero;
    }
    return super.reverseTransitionDuration;
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final isApple = DeviceUtil.isApple();
    final curvedAnimation = _curvedAnimation ??= CurvedAnimation(
      parent: animation,
      curve: isApple ? Curves.easeInOut : Curves.easeOut,
    );
    if (isApple) {
      return _buildCupertinoDialogTransitions(
        animation,
        curvedAnimation,
        child,
        _hasBlurredBackground,
        blurSigma,
      );
    }
    return BlurredModalRouteWrapper(
      animation: curvedAnimation,
      hasBlurredBackground: _hasBlurredBackground,
      blurSigma: blurSigma,
      child: child,
    );
  }

  @override
  void dispose() {
    _curvedAnimation?.dispose();
    super.dispose();
  }
}

final _dialogScaleTween = Tween<double>(begin: 1.3, end: 1.0)
    .chain(CurveTween(curve: Curves.linearToEaseOut));

// iOS & macOS
Widget _buildCupertinoDialogTransitions(
  Animation<double> animation,
  Animation<double> curvedAnimation,
  Widget child,
  bool hasBlurredBackground,
  double blurSigma,
) {
  if (animation.status == AnimationStatus.reverse) {
    return BlurredModalRouteWrapper(
      animation: curvedAnimation,
      hasBlurredBackground: hasBlurredBackground,
      blurSigma: blurSigma,
      child: child,
    );
  }
  return BlurredModalRouteWrapper(
    animation: curvedAnimation,
    hasBlurredBackground: hasBlurredBackground,
    blurSigma: blurSigma,
    child: ScaleTransition(
      scale: animation.drive(_dialogScaleTween),
      child: child,
    ),
  );
}
