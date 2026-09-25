import 'dart:math';

import 'package:flutter/widgets.dart';

/// Positions the menu of an [ImpaktfullUiDropdown] inside the window, the way
/// a menu is expected to behave:
///
/// - **flip**: it opens under the button, and above it when there is no room
///   under it;
/// - **shift**: it slides along the edge of the window instead of hanging out
///   of it;
/// - **size**: it is never taller than the space it has, so its content
///   scrolls instead of being cut off.
///
/// The origin of this delegate is the top start corner of the button, so the
/// offsets it returns are relative to the button.
class ImpaktfullUiDropdownMenuLayout extends SingleChildLayoutDelegate {
  /// The size of the button the menu belongs to.
  final Size buttonSize;

  /// Where the button is in the window, to know how much room is left around
  /// it.
  final Offset buttonOffset;

  /// The window.
  final Size windowSize;

  /// What the window takes for itself: the notch, the status bar, and the
  /// keyboard when it is open.
  final EdgeInsets windowPadding;

  /// The space between the button and the menu.
  final double spacing;

  /// The space the menu keeps between itself and the edge of the window.
  final double margin;

  /// The width of the menu, or null to use the width of the button (at least
  /// [minWidth]).
  final double? width;

  /// The smallest width of a menu that takes the width of its button: a
  /// narrow button would give its items no room otherwise.
  final double minWidth;

  /// The width of the menu before the button has been measured, on the frame
  /// a dropdown opens on.
  final double fallbackWidth;

  /// The corner of the button the menu is aligned to, already resolved to the
  /// reading direction.
  final Alignment alignment;

  const ImpaktfullUiDropdownMenuLayout({
    required this.buttonSize,
    required this.buttonOffset,
    required this.windowSize,
    required this.windowPadding,
    required this.spacing,
    required this.margin,
    required this.width,
    required this.minWidth,
    required this.fallbackWidth,
    required this.alignment,
  });

  double get _left => windowPadding.left + margin;

  double get _right => windowSize.width - windowPadding.right - margin;

  double get _top => windowPadding.top + margin;

  double get _bottom => windowSize.height - windowPadding.bottom - margin;

  double get _spaceBelow => _bottom - (buttonOffset.dy + buttonSize.height);

  double get _spaceAbove => buttonOffset.dy - _top;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    final available = max(0.0, _right - _left);
    // A button that has not been measured yet (the frame a dropdown opens
    // on) gives the menu the width of `overlayWidth`.
    final buttonWidth =
        buttonSize.width > 0 ? max(buttonSize.width, minWidth) : fallbackWidth;
    final menuWidth = min(width ?? buttonWidth, available);
    return BoxConstraints.tightFor(width: menuWidth).enforce(
      BoxConstraints(
        maxHeight: max(0.0, max(_spaceBelow, _spaceAbove) - spacing),
      ),
    );
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    // Under the button while it fits there, above it otherwise, and on the
    // side with the most room when it fits on neither.
    final below =
        childSize.height + spacing <= _spaceBelow || _spaceBelow >= _spaceAbove;
    var dy =
        below ? buttonSize.height + spacing : -(childSize.height + spacing);

    var dx = switch (alignment.x) {
      1 => buttonSize.width - childSize.width,
      0 => (buttonSize.width - childSize.width) / 2,
      _ => 0.0,
    };

    // Slide it back into the window when it hangs out of it.
    dx += _shift(buttonOffset.dx + dx, childSize.width, _left, _right);
    dy += _shift(buttonOffset.dy + dy, childSize.height, _top, _bottom);
    return Offset(dx, dy);
  }

  /// How much to move a box of [length] that starts at [start] to keep it
  /// between [lower] and [upper].
  ///
  /// A box that is bigger than the room it has keeps its start at [lower]:
  /// the top of a menu is more useful than its bottom.
  double _shift(double start, double length, double lower, double upper) {
    if (start < lower) return lower - start;
    final end = start + length;
    if (end > upper) return max(lower - start, upper - end);
    return 0;
  }

  @override
  bool shouldRelayout(ImpaktfullUiDropdownMenuLayout oldDelegate) =>
      buttonSize != oldDelegate.buttonSize ||
      buttonOffset != oldDelegate.buttonOffset ||
      windowSize != oldDelegate.windowSize ||
      windowPadding != oldDelegate.windowPadding ||
      spacing != oldDelegate.spacing ||
      margin != oldDelegate.margin ||
      width != oldDelegate.width ||
      minWidth != oldDelegate.minWidth ||
      fallbackWidth != oldDelegate.fallbackWidth ||
      alignment != oldDelegate.alignment;
}
