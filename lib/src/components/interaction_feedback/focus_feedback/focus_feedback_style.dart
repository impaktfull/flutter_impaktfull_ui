import 'package:flutter/widgets.dart';

/// The focus ring that [ImpaktfullUiFocusFeedback] draws around a focused
/// element. It is a token of [ImpaktfullUiTouchFeedbackTheme], because the
/// touch feedback is what shows the ring.
class ImpaktfullUiFocusRingTheme {
  /// The color of the ring. When null, the `accent` of the theme at 66% is
  /// used, like before this token existed.
  final Color? color;

  /// The thickness of the ring, in logical pixels.
  final double width;

  /// Whether a focused component draws a ring at all.
  ///
  /// False turns the ring off everywhere at once, for an app that shows the
  /// focus in its own way. Turning it off takes the focus away from the
  /// people who navigate with a keyboard or a switch, so it is a decision for
  /// an app to make on purpose.
  final bool enabled;

  /// The space between the edge of the child and the inner edge of the ring.
  ///
  /// The ring is always drawn outside of that edge, so a bigger [offset]
  /// moves it further away from the child (CSS `outline-offset` /
  /// `ring-offset`). A negative [offset] draws it over the child, e.g. over
  /// the border of the child.
  final double offset;

  const ImpaktfullUiFocusRingTheme({
    this.enabled = true,
    this.color,
    this.width = 2,
    this.offset = 1,
  });

  ImpaktfullUiFocusRingTheme copyWith({
    Color? color,
    bool? enabled,
    double? offset,
    double? width,
  }) =>
      ImpaktfullUiFocusRingTheme(
        color: color ?? this.color,
        enabled: enabled ?? this.enabled,
        offset: offset ?? this.offset,
        width: width ?? this.width,
      );

  /// The same ring, drawn against the inside edge of the component instead of
  /// around it.
  ///
  /// A component inside a scroller that clips (a tab of
  /// [ImpaktfullUiHorizontalTabs], a row of a table, an item of a list) has no
  /// room outside itself: the viewport cuts an outside ring off, and what is
  /// left of it is the part that runs along the sides. This ring has the same
  /// color and thickness and always fits.
  ImpaktfullUiFocusRingTheme get inset => copyWith(offset: -width);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiFocusRingTheme &&
          color == other.color &&
          width == other.width &&
          offset == other.offset &&
          enabled == other.enabled;

  @override
  int get hashCode => Object.hash(color, width, offset, enabled);
}
