import 'package:flutter/material.dart';

enum ImpaktfullUiAutoLayoutOrientation {
  horizontal,
  vertical,
}

class ImpaktfullUiAutoLayout extends StatelessWidget {
  final ImpaktfullUiAutoLayoutOrientation orientation;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final List<Widget> children;
  final double spacing;
  final bool wrap;

  const ImpaktfullUiAutoLayout({
    required this.children,
    required this.orientation,
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.spacing = 0,
    this.wrap = false,
    super.key,
  });

  const ImpaktfullUiAutoLayout.horizontal({
    required this.children,
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.spacing = 0,
    this.wrap = false,
    super.key,
  }) : orientation = ImpaktfullUiAutoLayoutOrientation.horizontal;

  const ImpaktfullUiAutoLayout.vertical({
    required this.children,
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.spacing = 0,
    this.wrap = false,
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
    final childrenWithSpacing = <Widget>[];
    for (var i = 0; i < children.length; ++i) {
      childrenWithSpacing.add(children[i]);
      if (i < children.length - 1) {
        childrenWithSpacing.add(SizedBox(
          width: width,
          height: height,
        ));
      }
    }

    if (orientation == ImpaktfullUiAutoLayoutOrientation.horizontal) {
      if (wrap) {
        return Wrap(
          direction: Axis.horizontal,
          runSpacing: spacing,
          children: childrenWithSpacing,
        );
      }
      return Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: childrenWithSpacing,
      );
    } else {
      if (wrap) {
        return Wrap(
          direction: Axis.vertical,
          runSpacing: spacing,
          children: childrenWithSpacing,
        );
      }
      return Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: childrenWithSpacing,
      );
    }
  }
}
