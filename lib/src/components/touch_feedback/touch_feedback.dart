import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_builder.dart';

import '../../util/device_util/device_util.dart';

class ImpaktfullUiTouchFeedback extends StatelessWidget {
  final VoidCallback? onTap;
  final VoidCallback? onFocus;
  final Widget child;
  final BorderRadius? borderRadius;
  final Color? color;
  final BoxBorder? border;
  final MouseCursor cursor;
  final List<BoxShadow> shadow;
  final bool canRequestFocus;

  const ImpaktfullUiTouchFeedback({
    required this.onTap,
    required this.child,
    this.onFocus,
    this.borderRadius,
    this.color,
    this.border,
    this.cursor = SystemMouseCursors.click,
    this.canRequestFocus = true,
    this.shadow = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (onTap == null) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: border,
          color: color ?? Colors.transparent,
          boxShadow: shadow,
        ),
        child: child,
      );
    }
    return ImpaktfullUiThemeBuidler(
      builder: (contex, theme) => ClipRRect(
        child: Container(
          decoration: BoxDecoration(
            boxShadow: shadow,
          ),
          child: Material(
            shape: borderRadius == null || border == null
                ? null
                : RoundedRectangleBorder(
                    borderRadius: borderRadius!,
                    side: border!.top,
                  ),
            borderRadius: border == null ? borderRadius : null,
            color: color ?? Colors.transparent,
            child: _PlatformTouchFeedback(
              borderRadius: borderRadius,
              onTap: onTap,
              cursor: cursor,
              onFocusChanged: _onFocusChanged,
              child: child,
            ),
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
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final MouseCursor cursor;
  final ValueChanged<bool> onFocusChanged;

  const _PlatformTouchFeedback({
    required this.child,
    required this.borderRadius,
    required this.onTap,
    required this.cursor,
    required this.onFocusChanged,
  });

  @override
  State<_PlatformTouchFeedback> createState() => _PlatformTouchFeedbackState();
}

class _PlatformTouchFeedbackState extends State<_PlatformTouchFeedback> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isMobileWeb()) {
      return MouseRegion(
        cursor: widget.cursor,
        child: GestureDetector(
          onTap: widget.onTap,
          child: Focus(
            focusNode: _focusNode,
            onFocusChange: widget.onFocusChanged,
            child: ColoredBox(
              color: Colors.transparent,
              child: widget.child,
            ),
          ),
        ),
      );
    }
    return InkWell(
      borderRadius: widget.borderRadius,
      onTap: widget.onTap,
      mouseCursor: widget.cursor,
      onFocusChange: widget.onFocusChanged,
      focusColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      child: ColoredBox(
        color: Colors.transparent,
        child: widget.child,
      ),
    );
  }
}
