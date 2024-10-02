import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

part 'auto_layout.describe.dart';

enum ImpaktfullUiAutoLayoutOrientation {
  horizontal,
  vertical,
}

class ImpaktfullUiAutoLayout extends StatelessWidget
    with ComponentDescriptorMixin {
  final ImpaktfullUiAutoLayoutOrientation orientation;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final List<Widget> children;
  final double spacing;

  const ImpaktfullUiAutoLayout({
    required this.children,
    required this.orientation,
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.spacing = 0,
    super.key,
  });

  const ImpaktfullUiAutoLayout.horizontal({
    required this.children,
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.spacing = 0,
    super.key,
  }) : orientation = ImpaktfullUiAutoLayoutOrientation.horizontal;

  const ImpaktfullUiAutoLayout.vertical({
    required this.children,
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.spacing = 0,
    super.key,
  }) : orientation = ImpaktfullUiAutoLayoutOrientation.vertical;

  @override
  Widget build(BuildContext context) {
    final width = orientation == ImpaktfullUiAutoLayoutOrientation.horizontal
        ? spacing.toDouble()
        : 0.0;
    final height = orientation == ImpaktfullUiAutoLayoutOrientation.vertical
        ? spacing.toDouble()
        : 0.0;
    final childerenWithSpacing = <Widget>[];
    for (var i = 0; i < children.length; ++i) {
      childerenWithSpacing.add(children[i]);
      if (i < children.length - 1) {
        childerenWithSpacing.add(SizedBox(
          width: width,
          height: height,
        ));
      }
    }

    if (orientation == ImpaktfullUiAutoLayoutOrientation.horizontal) {
      return Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: childerenWithSpacing,
      );
    } else {
      return Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: childerenWithSpacing,
      );
    }
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}
