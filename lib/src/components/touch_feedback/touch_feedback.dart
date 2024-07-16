import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';

class ImpaktfullUiTouchFeedback extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  final BorderRadius? borderRadius;
  final Color? color;
  final BoxBorder? border;
  final List<BoxShadow> shadow;
  final bool canRequestFocus;

  const ImpaktfullUiTouchFeedback({
    required this.onTap,
    required this.child,
    this.borderRadius,
    this.color,
    this.border,
    this.canRequestFocus = true,
    this.shadow = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (onTap == null) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: border,
          color: color ?? Colors.transparent,
          boxShadow: shadow,
        ),
        child: child,
      );
    }
    return ImpaktfullUiThemeBuidler(
      builder: (contex, theme) => ClipRRect(
        child: Container(
          decoration: BoxDecoration(
            boxShadow: shadow,
          ),
          child: Material(
            shape: borderRadius == null || border == null
                ? null
                : RoundedRectangleBorder(
                    borderRadius: borderRadius!,
                    side: border!.top,
                  ),
            borderRadius: border == null ? borderRadius : null,
            color: color ?? Colors.transparent,
            child: InkWell(
              borderRadius: borderRadius,
              onTap: onTap,
              focusColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              child: ColoredBox(
                color: Colors.transparent,
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
