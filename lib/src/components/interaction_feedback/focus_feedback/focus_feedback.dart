import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/util/extension/color_extensions.dart';

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

  static final _defaultTheme = ImpaktfullUiTheme.getDefault();

  @override
  Widget build(BuildContext context) {
    if (!enabled) return child;
    // Without an ImpaktfullUiThemeConfigurator above it (e.g. a plain
    // WidgetsApp), the focus ring uses the default theme.
    final impaktfullUiTheme =
        ImpaktfullUiTheme.maybeOf(context) ?? _defaultTheme;
    return Stack(
      // Keep the constraints of the parent for the child (e.g. full width).
      fit: StackFit.passthrough,
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        child,
        PositionedDirectional(
          start: -1,
          end: -1,
          top: -1,
          bottom: -1,
          child: IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                border: Border.all(
                  color: hasFocus
                      ? impaktfullUiTheme.colors.accent
                          .withOpacityPercentage(0.66)
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
