import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/container/container.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/focus_feedback/focus_feedback.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback_style.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui/src/components/tooltip/tooltip.dart';
import 'package:impaktfull_ui/src/util/device_util/device_util.dart';
import 'package:impaktfull_ui/src/util/extension/border_radius_geometry_extension.dart';

export 'touch_feedback_style.dart';

class ImpaktfullUiTouchFeedback extends StatelessWidget {
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;
  final ValueChanged<TapDownDetails>? onTapDown;
  final ValueChanged<TapUpDetails>? onTapUp;
  final VoidCallback? onTapCancel;
  final VoidCallback? onFocus;
  final Widget child;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final BoxBorder? border;
  final MouseCursor cursor;
  final List<BoxShadow> shadow;
  final String? tooltip;
  final FocusNode? focusNode;
  final bool canRequestFocus;
  final bool autofocus;
  final bool useFocusColor;
  final ImpaktfullUiTouchFeedbackTheme? theme;

  const ImpaktfullUiTouchFeedback({
    required this.onTap,
    required this.child,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onDoubleTap,
    VoidCallback? onLongPress,
    @Deprecated('Use onLongPress instead. Will be removed in 1.0.0.')
    VoidCallback? onLongTap,
    this.onFocus,
    this.borderRadius,
    this.color,
    this.border,
    String? tooltip,
    @Deprecated('Use tooltip instead. Will be removed in 1.0.0.')
    String? toolTip,
    this.focusNode,
    this.cursor = SystemMouseCursors.click,
    this.canRequestFocus = true,
    this.autofocus = false,
    this.useFocusColor = true,
    this.shadow = const [],
    this.theme,
    super.key,
  })  : tooltip = tooltip ?? toolTip,
        onLongPress = onLongPress ?? onLongTap;

  @Deprecated('Use tooltip instead. Will be removed in 1.0.0.')
  String? get toolTip => tooltip;

  @Deprecated('Use onLongPress instead. Will be removed in 1.0.0.')
  VoidCallback? get onLongTap => onLongPress;

  @override
  Widget build(BuildContext context) {
    if (onTap == null && onTapDown == null && onTapUp == null) {
      final container = ImpaktfullUiContainer(
        border: border,
        shadow: shadow,
        borderRadius: borderRadius,
        color: color ?? Colors.transparent,
        child: child,
      );
      // A disabled element keeps its tooltip for screen readers (e.g. the
      // label of a disabled icon button), without showing it on hover.
      final tooltip = this.tooltip;
      if (tooltip == null) return container;
      return Semantics(tooltip: tooltip, child: container);
    }
    return ImpaktfullUiComponentThemeBuilder<ImpaktfullUiTouchFeedbackTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => ImpaktfullUiContainer(
        border: border,
        shadow: shadow,
        borderRadius: borderRadius,
        color: color ?? Colors.transparent,
        child: ImpaktfullUiTooltip(
          message: tooltip,
          child: _PlatformTouchFeedback(
            borderRadius: borderRadius,
            onTap: onTap,
            onTapDown: onTapDown,
            onTapUp: onTapUp,
            onTapCancel: onTapCancel,
            onDoubleTap: onDoubleTap,
            onLongPress: onLongPress,
            cursor: cursor,
            canRequestFocus: canRequestFocus,
            autofocus: autofocus,
            useFocusColor: useFocusColor,
            colors: componentTheme.colors,
            focusNode: focusNode,
            onFocusChanged: _onFocusChanged,
            child: child,
          ),
        ),
      ),
    );
  }

  void _onFocusChanged(bool value) {
    if (value) {
      onFocus?.call();
    }
  }
}

class _PlatformTouchFeedback extends StatefulWidget {
  final Widget child;
  final BorderRadiusGeometry? borderRadius;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;
  final ValueChanged<TapDownDetails>? onTapDown;
  final ValueChanged<TapUpDetails>? onTapUp;
  final VoidCallback? onTapCancel;
  final MouseCursor cursor;
  final bool canRequestFocus;
  final bool autofocus;
  final bool useFocusColor;
  final ImpaktfullUiTouchFeedbackColorTheme colors;
  final FocusNode? focusNode;
  final ValueChanged<bool> onFocusChanged;

  const _PlatformTouchFeedback({
    required this.child,
    required this.borderRadius,
    required this.onTap,
    required this.onTapDown,
    required this.onTapUp,
    required this.onTapCancel,
    required this.onDoubleTap,
    required this.onLongPress,
    required this.cursor,
    required this.canRequestFocus,
    required this.autofocus,
    required this.useFocusColor,
    required this.colors,
    required this.onFocusChanged,
    required this.focusNode,
  });

  @override
  State<_PlatformTouchFeedback> createState() => _PlatformTouchFeedbackState();
}

class _PlatformTouchFeedbackState extends State<_PlatformTouchFeedback> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    FocusManager.instance.addHighlightModeListener(_onHighlightModeChanged);
  }

  @override
  void dispose() {
    FocusManager.instance.removeHighlightModeListener(_onHighlightModeChanged);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (DeviceUtil.isMobileWeb()) {
      return MouseRegion(
        cursor: widget.cursor,
        child: GestureDetector(
          onTap: widget.onTap,
          onTapDown: widget.onTapDown,
          onTapUp: widget.onTapUp,
          onTapCancel: widget.onTapCancel,
          onDoubleTap: widget.onDoubleTap,
          onLongPress: widget.onLongPress,
          // Enter and space activate the focused element, like the InkWell
          // below does (e.g. with a keyboard connected to a tablet).
          child: Actions(
            actions: <Type, Action<Intent>>{
              if (widget.onTap != null)
                ActivateIntent: CallbackAction<ActivateIntent>(
                  onInvoke: (_) => widget.onTap?.call(),
                ),
            },
            child: Focus(
              focusNode: _focusNode,
              onFocusChange: widget.onFocusChanged,
              canRequestFocus: widget.canRequestFocus,
              autofocus: widget.autofocus,
              child: ColoredBox(
                color: Colors.transparent,
                child: widget.child,
              ),
            ),
          ),
        ),
      );
    }
    final isAndroidTarget =
        Theme.of(context).platform == TargetPlatform.android;
    // Only show the focus ring when navigating with a keyboard (like the
    // focusColor of the InkWell), not after touch input.
    final showFocus = _focusNode.hasFocus &&
        FocusManager.instance.highlightMode == FocusHighlightMode.traditional;
    return ImpaktfullUiFocusFeedback(
      hasFocus: showFocus,
      borderRadius: widget.borderRadius,
      enabled: widget.useFocusColor,
      child: InkWell(
        borderRadius: widget.borderRadius?.value,
        onTap: widget.onTap,
        onTapDown: widget.onTapDown,
        onTapUp: widget.onTapUp,
        onTapCancel: widget.onTapCancel,
        onDoubleTap: widget.onDoubleTap,
        onLongPress: widget.onLongPress,
        focusNode: _focusNode,
        mouseCursor: widget.cursor,
        onFocusChange: _onFocusChanged,
        canRequestFocus: widget.canRequestFocus,
        autofocus: widget.autofocus,
        // A null color falls back to the color of the Material ThemeData.
        highlightColor: widget.colors.highlight,
        hoverColor: widget.colors.hover,
        splashColor: widget.colors.splash,
        focusColor: widget.useFocusColor
            ? widget.colors.focus ?? Theme.of(context).hoverColor
            : Colors.transparent,
        splashFactory: _getSplashFactory(isAndroidTarget),
        child: ColoredBox(
          color: Colors.transparent,
          child: widget.child,
        ),
      ),
    );
  }

  void _onFocusChanged(bool value) {
    setState(() {});
    widget.onFocusChanged(value);
  }

  void _onHighlightModeChanged(FocusHighlightMode mode) {
    if (!mounted || !_focusNode.hasFocus) return;
    setState(() {});
  }

  /// InkSparkle loads a fragment shader, which the web does not support
  /// reliably: like the default of [ThemeData], the web uses InkRipple.
  InteractiveInkFeatureFactory _getSplashFactory(bool isAndroidTarget) {
    if (!isAndroidTarget) return NoSplash.splashFactory;
    if (DeviceUtil.isWeb()) return InkRipple.splashFactory;
    return InkSparkle.splashFactory;
  }
}
