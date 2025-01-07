import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/container/container.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/focus_feedback/focus_feedback.dart';
import 'package:impaktfull_ui/src/components/theme/theme_builder.dart';
import 'package:impaktfull_ui/src/components/tooltip/tooltip.dart';
import 'package:impaktfull_ui/src/util/device_util/device_util.dart';
import 'package:impaktfull_ui/src/util/extension/border_radius_geometry_extension.dart';

class ImpaktfullUiTouchFeedback extends StatelessWidget {
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongTap;
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
  final String? toolTip;
  final FocusNode? focusNode;
  final bool canRequestFocus;
  final bool autofocus;
  final bool useFocusColor;

  const ImpaktfullUiTouchFeedback({
    required this.onTap,
    required this.child,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onDoubleTap,
    this.onLongTap,
    this.onFocus,
    this.borderRadius,
    this.color,
    this.border,
    this.toolTip,
    this.focusNode,
    this.cursor = SystemMouseCursors.click,
    this.canRequestFocus = true,
    this.autofocus = false,
    this.useFocusColor = true,
    this.shadow = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (onTap == null && onTapDown == null && onTapUp == null) {
      return ImpaktfullUiContainer(
        border: border,
        shadow: shadow,
        borderRadius: borderRadius,
        color: color ?? Colors.transparent,
        child: child,
      );
    }
    return ImpaktfullUiThemeBuidler(
      builder: (contex, theme) => ImpaktfullUiContainer(
        border: border,
        shadow: shadow,
        borderRadius: borderRadius,
        color: color ?? Colors.transparent,
        child: ImpaktfullUiTooltip(
          message: toolTip,
          child: _PlatformTouchFeedback(
            borderRadius: borderRadius,
            onTap: onTap,
            onTapDown: onTapDown,
            onTapUp: onTapUp,
            onTapCancel: onTapCancel,
            onDoubleTap: onDoubleTap,
            onLongTap: onLongTap,
            cursor: cursor,
            canRequestFocus: canRequestFocus,
            autofocus: autofocus,
            useFocusColor: useFocusColor,
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
  final VoidCallback? onLongTap;
  final ValueChanged<TapDownDetails>? onTapDown;
  final ValueChanged<TapUpDetails>? onTapUp;
  final VoidCallback? onTapCancel;
  final MouseCursor cursor;
  final bool canRequestFocus;
  final bool autofocus;
  final bool useFocusColor;
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
    required this.onLongTap,
    required this.cursor,
    required this.canRequestFocus,
    required this.autofocus,
    required this.useFocusColor,
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
  }

  @override
  void dispose() {
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
          onLongPress: widget.onLongTap,
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
      );
    }
    final isAndroidTarget =
        Theme.of(context).platform == TargetPlatform.android;
    return ImpaktfullUiFocusFeedback(
      hasFocus: _focusNode.hasFocus,
      borderRadius: widget.borderRadius,
      enabled: false,
      child: InkWell(
        borderRadius: widget.borderRadius?.value,
        onTap: widget.onTap,
        onTapDown: widget.onTapDown,
        onTapUp: widget.onTapUp,
        onTapCancel: widget.onTapCancel,
        onDoubleTap: widget.onDoubleTap,
        onLongPress: widget.onLongTap,
        focusNode: _focusNode,
        mouseCursor: widget.cursor,
        onFocusChange: _onFocusChanged,
        canRequestFocus: widget.canRequestFocus,
        autofocus: widget.autofocus,
        focusColor: widget.useFocusColor
            ? Theme.of(context).hoverColor
            : Colors.transparent,
        splashFactory:
            isAndroidTarget ? InkSparkle.splashFactory : NoSplash.splashFactory,
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
}
