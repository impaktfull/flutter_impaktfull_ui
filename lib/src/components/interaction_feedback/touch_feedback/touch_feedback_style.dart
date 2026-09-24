import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/focus_feedback/focus_feedback_style.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiTouchFeedbackTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiTouchFeedbackColorTheme colors;

  /// The ring that `ImpaktfullUiFocusFeedback` draws around a focused
  /// element.
  final ImpaktfullUiFocusRingTheme focusRing;

  const ImpaktfullUiTouchFeedbackTheme({
    required this.colors,
    this.focusRing = const ImpaktfullUiFocusRingTheme(),
  });

  /// The default look of the touch feedback: the colors of the Material
  /// [ThemeData], like before this theme existed. It does not depend on the
  /// base tokens of the theme.
  static const fallback = ImpaktfullUiTouchFeedbackTheme(
    colors: ImpaktfullUiTouchFeedbackColorTheme(),
    focusRing: ImpaktfullUiFocusRingTheme(),
  );

  ImpaktfullUiTouchFeedbackTheme copyWith({
    ImpaktfullUiTouchFeedbackColorTheme? colors,
    ImpaktfullUiFocusRingTheme? focusRing,
  }) =>
      ImpaktfullUiTouchFeedbackTheme(
        colors: colors ?? this.colors,
        focusRing: focusRing ?? this.focusRing,
      );

  static ImpaktfullUiTouchFeedbackTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.touchFeedback;

  static ImpaktfullUiTouchFeedbackTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      fallback;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTouchFeedbackTheme &&
          colors == other.colors &&
          focusRing == other.focusRing;

  @override
  int get hashCode => Object.hash(colors, focusRing);
}

/// The colors of the touch feedback, named after the colors of an InkWell.
/// When a color is null, the color of the Material `ThemeData` is used.
class ImpaktfullUiTouchFeedbackColorTheme {
  /// The overlay while the element is pressed (`highlightColor`).
  final Color? highlight;

  /// The overlay while a pointer hovers over the element (`hoverColor`).
  final Color? hover;

  /// The overlay while the element has keyboard focus and `useFocusColor` is
  /// true. When null, the `hoverColor` of the Material `ThemeData` is used.
  final Color? focus;

  /// The ink splash on Android (`splashColor`). Other platforms show no
  /// splash.
  final Color? splash;

  const ImpaktfullUiTouchFeedbackColorTheme({
    this.highlight,
    this.hover,
    this.focus,
    this.splash,
  });

  ImpaktfullUiTouchFeedbackColorTheme copyWith({
    Color? focus,
    Color? highlight,
    Color? hover,
    Color? splash,
  }) =>
      ImpaktfullUiTouchFeedbackColorTheme(
        focus: focus ?? this.focus,
        highlight: highlight ?? this.highlight,
        hover: hover ?? this.hover,
        splash: splash ?? this.splash,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTouchFeedbackColorTheme &&
          highlight == other.highlight &&
          hover == other.hover &&
          focus == other.focus &&
          splash == other.splash;

  @override
  int get hashCode => Object.hash(highlight, hover, focus, splash);
}
