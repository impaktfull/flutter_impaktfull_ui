import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/util/extension/color_extensions.dart';

export 'focus_feedback_style.dart';

class ImpaktfullUiFocusFeedback extends StatelessWidget {
  final Widget child;
  final bool hasFocus;
  final BorderRadiusGeometry? borderRadius;
  final bool enabled;

  /// The ring to draw. When null, the `focusRing` of the
  /// [ImpaktfullUiTouchFeedbackTheme] of the theme is used.
  final ImpaktfullUiFocusRingTheme? theme;

  const ImpaktfullUiFocusFeedback({
    required this.child,
    required this.hasFocus,
    this.borderRadius,
    this.enabled = true,
    this.theme,
    super.key,
  });

  static final _defaultTheme = ImpaktfullUiTheme.getDefault();

  @override
  Widget build(BuildContext context) {
    if (!enabled) return child;
    // Without an ImpaktfullUiThemeConfigurator above it (e.g. a plain
    // WidgetsApp), the focus ring uses the default theme.
    final impaktfullUiTheme =
        ImpaktfullUiTheme.maybeOf(context) ?? _defaultTheme;
    final focusRing =
        theme ?? impaktfullUiTheme.components.touchFeedback.focusRing;
    final offset = -focusRing.offset;
    return Stack(
      // Keep the constraints of the parent for the child (e.g. full width).
      fit: StackFit.passthrough,
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        child,
        PositionedDirectional(
          start: offset,
          end: offset,
          top: offset,
          bottom: offset,
          child: IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                border: Border.all(
                  color: hasFocus
                      ? focusRing.color ??
                          impaktfullUiTheme.colors.accent
                              .withOpacityPercentage(0.66)
                      : Colors.transparent,
                  width: focusRing.width,
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
