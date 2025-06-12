import 'dart:async';

import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/button/button.dart';

class ImpaktfullUiRaisedButton extends StatefulWidget {
  final Widget child;
  final ImpaktfullUiButtonType type;
  final ImpaktfullUiButtonTheme theme;
  final bool isLoading;
  final MouseCursor cursor;
  final VoidCallback? onTap;

  const ImpaktfullUiRaisedButton({
    required this.child,
    required this.type,
    required this.theme,
    this.cursor = SystemMouseCursors.click,
    required this.isLoading,
    this.onTap,
    super.key,
  });

  @override
  State<ImpaktfullUiRaisedButton> createState() =>
      _ImpaktfullUiRaisedButtonState();
}

class _ImpaktfullUiRaisedButtonState extends State<ImpaktfullUiRaisedButton>
    with SingleTickerProviderStateMixin {
  var _isPressed = false;
  late final AnimationController _controller;
  late final Animation<double> _animation;
  Timer? _timer;

  bool get isDown => _isPressed || widget.isLoading;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 25),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 4).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.theme.config.isRaised) return widget.child;
    final color = _getRaisedBackgroundColor(widget.theme);
    if (color == null) return widget.child;
    return MouseRegion(
      cursor: widget.onTap == null ? SystemMouseCursors.basic : widget.cursor,
      child: GestureDetector(
        onTapDown: (_) {
          if (widget.isLoading) return;
          _timer?.cancel();
          setState(() => _isPressed = true);
          _controller.forward();
        },
        onTapUp: (_) => _cancelTap(),
        onTapCancel: _cancelTap,
        onTap: widget.onTap,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) => Container(
                  decoration: BoxDecoration(
                    color: _animation.value < 1 ? color : null,
                    borderRadius: widget.theme.dimens.borderRadius,
                  ),
                  child: child,
                ),
                child: Visibility(
                  visible: false,
                  maintainInteractivity: false,
                  child: widget.child,
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, -widget.theme.config.elevation.toDouble()),
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) => Transform.translate(
                  offset: Offset(0, _animation.value),
                  child: child,
                ),
                child: widget.child,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _cancelTap() async {
    setState(() => _isPressed = false);
    _timer?.cancel();
    _timer = Timer(const Duration(milliseconds: 30), () {
      _controller.reverse();
    });
  }

  Color? _getRaisedBackgroundColor(ImpaktfullUiButtonTheme theme) {
    final raisedBackground = theme.colors.raisedBackground;
    if (raisedBackground == null) return null;
    switch (widget.type) {
      case ImpaktfullUiButtonType.primary:
        return raisedBackground.primary;
      case ImpaktfullUiButtonType.secondary:
      case ImpaktfullUiButtonType.secondaryGrey:
        return raisedBackground.secondary;
      case ImpaktfullUiButtonType.destructivePrimary:
        return raisedBackground.destructive;
      case ImpaktfullUiButtonType.destructiveSecondary:
        return raisedBackground.destructiveSecondary;
      case ImpaktfullUiButtonType.tertiary:
      case ImpaktfullUiButtonType.tertiaryGrey:
      case ImpaktfullUiButtonType.link:
      case ImpaktfullUiButtonType.linkGrey:
      case ImpaktfullUiButtonType.destructiveTertiary:
      case ImpaktfullUiButtonType.destructiveLink:
        return null;
    }
  }
}
