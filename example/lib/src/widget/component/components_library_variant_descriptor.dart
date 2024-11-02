import 'package:flutter/material.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

class ComponentsLibraryVariantDescriptor extends StatelessWidget {
  final String? title;
  final Widget child;
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final bool isScrollable;
  final AlignmentGeometry alignment;
  final bool wrapWithCard;

  const ComponentsLibraryVariantDescriptor({
    required this.child,
    this.title,
    this.width,
    this.height,
    this.padding,
    this.isScrollable = false,
    this.wrapWithCard = false,
    this.alignment = AlignmentDirectional.topStart,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final child = this.child;
    var text = title;
    if (text == null && child is ComponentDescriptorMixin) {
      text = (child as ComponentDescriptorMixin).describe(context);
    }
    return ImpaktfullUiAutoLayout.vertical(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        if (text != null) ...[
          Text(
            text,
            style: ImpaktfullUiTheme.of(context).textStyles.onCanvas.text.extraSmall,
          ),
        ],
        Container(
          color: color,
          width: width,
          height: height,
          child: Builder(builder: (context) {
            final wrapepdChild = isScrollable ? SingleChildScrollView(child: child) : child;
            if (wrapWithCard) {
              return ImpaktfullUiCard(
                padding: padding,
                width: width,
                child: Align(
                  alignment: alignment,
                  child: wrapepdChild,
                ),
              );
            }
            return wrapepdChild;
          }),
        ),
      ],
    );
  }
}
