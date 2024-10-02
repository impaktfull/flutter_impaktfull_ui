import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/modal/routes/blurred_modal_route_wrapper.dart';
import 'package:impaktfull_ui_2/src/util/device_util/device_util.dart';

class ImpaktfullUiDefaultModalRoute<T> extends RawDialogRoute<T> {
  ImpaktfullUiDefaultModalRoute({
    required BuildContext context,
    required WidgetBuilder builder,
    CapturedThemes? themes,
    super.barrierColor = Colors.black54,
    super.barrierDismissible,
    String? barrierLabel,
    bool useSafeArea = true,
    bool hasBlurredBackground = true,
    super.settings,
    super.anchorPoint,
    super.traversalEdgeBehavior,
  }) : super(
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
          transitionDuration: const Duration(milliseconds: 150),
          transitionBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation, Widget child) =>
              _customTransitionBuilder(context, animation, secondaryAnimation,
                  child, hasBlurredBackground),
        );
}

Widget _customTransitionBuilder(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
  bool hasBlurredBackground,
) {
  if (isApple()) {
    return _buildCupertinoDialogTransitions(
      context,
      animation,
      secondaryAnimation,
      child,
      hasBlurredBackground,
    );
  }
  return BlurredModalRouteWrapper(
    animation: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    hasBlurredBackground: hasBlurredBackground,
    child: child,
  );
}

// iOS & macOS
Widget _buildCupertinoDialogTransitions(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
  bool hasBlurredBackground,
) {
  final dialogScaleTween = Tween<double>(begin: 1.3, end: 1.0)
      .chain(CurveTween(curve: Curves.linearToEaseOut));
  final curvesAnimation = CurvedAnimation(
    parent: animation,
    curve: Curves.easeInOut,
  );
  if (animation.status == AnimationStatus.reverse) {
    return BlurredModalRouteWrapper(
      animation: curvesAnimation,
      hasBlurredBackground: hasBlurredBackground,
      child: FadeTransition(
        opacity: curvesAnimation,
        child: child,
      ),
    );
  }
  return BlurredModalRouteWrapper(
    animation: curvesAnimation,
    hasBlurredBackground: hasBlurredBackground,
    child: FadeTransition(
      opacity: curvesAnimation,
      child: ScaleTransition(
        scale: animation.drive(dialogScaleTween),
        child: child,
      ),
    ),
  );
}
