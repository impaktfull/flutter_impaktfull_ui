import 'package:flutter/widgets.dart';

/// Respects the "reduce motion" setting of the platform
/// (`MediaQuery.disableAnimations`: "Remove animations" on Android,
/// "Reduce motion" on iOS and macOS, "Show animations" off on Windows).
///
/// Components use it for every animation that only decorates a change (an
/// expanding accordion, a sliding indicator, a fading overlay): with reduce
/// motion the change happens immediately. Endless decorative animations
/// (the shimmer of a skeleton, confetti, an autoplaying carousel) do not run.
class ImpaktfullUiAnimationUtil {
  const ImpaktfullUiAnimationUtil._();

  /// Whether the user asked the platform to reduce or remove animations.
  static bool reduceMotion(BuildContext context) =>
      MediaQuery.maybeDisableAnimationsOf(context) ?? false;

  /// [duration], or [Duration.zero] when the user asked to reduce motion.
  static Duration duration(BuildContext context, Duration duration) =>
      reduceMotion(context) ? Duration.zero : duration;
}
