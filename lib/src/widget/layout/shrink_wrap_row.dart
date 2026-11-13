import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/// A horizontal [Flex] with [MainAxisSize.min] whose [Flexible] children only
/// flex when the width is bounded and the content does not fit.
///
/// A [Row] throws for a flexible child in an unbounded width (e.g. a badge in
/// a Row, or a chip in a horizontal list), and a LayoutBuilder does not
/// support intrinsic dimensions (e.g. a badge in a Table or IntrinsicWidth).
/// With a bounded width a [Flexible] text is truncated, without one the row
/// keeps the width of its content.
class ImpaktfullUiShrinkWrapRow extends Flex {
  const ImpaktfullUiShrinkWrapRow({
    required super.children,
    super.key,
  }) : super(
          direction: Axis.horizontal,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
        );

  @override
  RenderFlex createRenderObject(BuildContext context) => _RenderShrinkWrapRow(
        direction: direction,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: getEffectiveTextDirection(context),
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        clipBehavior: clipBehavior,
      );
}

class _RenderShrinkWrapRow extends RenderFlex {
  _RenderShrinkWrapRow({
    super.direction,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
    super.clipBehavior,
  });

  /// Runs [callback] with the flex of every child disabled when the width is
  /// unbounded or the content fits, and restores the flex afterwards.
  T _withFlexFor<T>(BoxConstraints constraints, T Function() callback) {
    // Only flex when the content does not fit: otherwise the children are
    // laid out exactly like in a Row.
    if (constraints.hasBoundedWidth &&
        getMaxIntrinsicWidth(double.infinity) > constraints.maxWidth) {
      return callback();
    }
    final flexChildren = <FlexParentData, int?>{};
    var child = firstChild;
    while (child != null) {
      final parentData = child.parentData! as FlexParentData;
      flexChildren[parentData] = parentData.flex;
      parentData.flex = null;
      child = parentData.nextSibling;
    }
    try {
      return callback();
    } finally {
      for (final entry in flexChildren.entries) {
        entry.key.flex = entry.value;
      }
    }
  }

  @override
  void performLayout() => _withFlexFor(constraints, super.performLayout);

  @override
  Size computeDryLayout(covariant BoxConstraints constraints) =>
      _withFlexFor(constraints, () => super.computeDryLayout(constraints));
}
