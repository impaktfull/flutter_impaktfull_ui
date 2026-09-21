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
    if (wrap) {
      // Wrap spaces its children itself: spacer widgets would be wrapped like
      // any other child (and could start a new run).
      return Wrap(
        direction: orientation == ImpaktfullUiAutoLayoutOrientation.horizontal
            ? Axis.horizontal
            : Axis.vertical,
        spacing: spacing,
        runSpacing: spacing,
        alignment: _getWrapAlignment(mainAxisAlignment),
        crossAxisAlignment: _getWrapCrossAlignment(crossAxisAlignment),
        children: children,
      );
    }
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
      return Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
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

  static WrapAlignment _getWrapAlignment(MainAxisAlignment alignment) =>
      switch (alignment) {
        MainAxisAlignment.start => WrapAlignment.start,
        MainAxisAlignment.end => WrapAlignment.end,
        MainAxisAlignment.center => WrapAlignment.center,
        MainAxisAlignment.spaceBetween => WrapAlignment.spaceBetween,
        MainAxisAlignment.spaceAround => WrapAlignment.spaceAround,
        MainAxisAlignment.spaceEvenly => WrapAlignment.spaceEvenly,
      };

  static WrapCrossAlignment _getWrapCrossAlignment(
    CrossAxisAlignment alignment,
  ) =>
      switch (alignment) {
        CrossAxisAlignment.end => WrapCrossAlignment.end,
        CrossAxisAlignment.center => WrapCrossAlignment.center,
        // Wrap has no stretch or baseline alignment.
        CrossAxisAlignment.start ||
        CrossAxisAlignment.stretch ||
        CrossAxisAlignment.baseline =>
          WrapCrossAlignment.start,
      };
}
