import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';

class ComponentsLibraryVariantDescriptor extends StatelessWidget {
  final String? title;
  final Widget child;
  final double? width;
  final double? height;
  final Alignment alignment;

  const ComponentsLibraryVariantDescriptor({
    required this.child,
    this.alignment = Alignment.center,
    this.title,
    this.width,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final child = this.child;
    var text = title;
    if (text == null && child is ComponentDescriptorMixin) {
      text = (child as ComponentDescriptorMixin).describe();
    }
    return ImpaktfullUiAutoLayout.vertical(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        if (text != null) ...[
          Text(
            text,
            style: ImpaktfullUiTheme.of(context).textStyles.onCanvas.text.extraSmall,
          ),
        ],
        SizedBox(
          width: width,
          height: height,
          child: Align(
            alignment: alignment,
            child: child,
          ),
        ),
      ],
    );
  }
}
