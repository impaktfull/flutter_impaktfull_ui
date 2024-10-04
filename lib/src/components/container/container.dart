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
  final List<BoxShadow>? boxShadow;

  const ImpaktfullUiContainer({
    required this.child,
    this.width,
    this.height,
    this.borderRadius,
    this.color,
    this.border,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.boxShadow,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.zero,
          boxShadow: boxShadow,
        ),
        child: Material(
          shape: borderRadius == null || border == null
              ? null
              : RoundedRectangleBorder(
                  borderRadius: borderRadius!,
                  side: border!.top,
                ),
          borderOnForeground: false,
          borderRadius: border == null ? borderRadius : null,
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
