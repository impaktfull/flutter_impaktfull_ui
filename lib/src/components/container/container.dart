import 'package:flutter/material.dart';

class ImpaktfullUiContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final BoxBorder? border;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final List<BoxShadow>? shadow;

  const ImpaktfullUiContainer({
    required this.child,
    this.width,
    this.height,
    this.borderRadius,
    this.color,
    this.border,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.shadow,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final border = this.border;
    // A uniform border is drawn by the Material shape (behind the child, like
    // before). A border with different sides can not be expressed as a
    // single BorderSide, so it is drawn as a foreground decoration.
    final shapeBorder = border != null && border.isUniform ? border : null;
    final foregroundBorder =
        border != null && !border.isUniform ? border : null;
    return Padding(
      padding: margin,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.zero,
          boxShadow: shadow,
        ),
        foregroundDecoration: foregroundBorder == null
            ? null
            : BoxDecoration(
                border: foregroundBorder,
                borderRadius: borderRadius,
              ),
        child: Material(
          shape: shapeBorder == null
              ? null
              : RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.zero,
                  side: shapeBorder.top,
                ),
          borderOnForeground: false,
          borderRadius: shapeBorder == null ? borderRadius : null,
          color: color ?? Colors.transparent,
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
