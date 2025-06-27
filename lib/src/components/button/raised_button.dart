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
  late AnimationController _controller;
  late Animation<double> _animation;
  Timer? _timer;

  bool get _isTappable => widget.onTap != null;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 25),
      vsync: this,
    );
    _createAnimation();
  }

  void _createAnimation() {
    _animation =
        Tween<double>(begin: 0, end: widget.theme.config.elevation).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void didUpdateWidget(ImpaktfullUiRaisedButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.theme.config.elevation != widget.theme.config.elevation) {
      _createAnimation();
    }
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
    if (!_isTappable) return widget.child;
    return MouseRegion(
      cursor: widget.onTap == null ? SystemMouseCursors.basic : widget.cursor,
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        onTap: widget.onTap,
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.passthrough,
          children: [
            Positioned.fill(
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) => Container(
                  decoration: BoxDecoration(
                    color: _animation.value < widget.theme.config.elevation
                        ? color
                        : null,
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

  void _onTapDown(TapDownDetails details) {
    if (!_isTappable) return;
    if (widget.isLoading) return;
    _timer?.cancel();
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) => _onTapCancel();

  void _onTapCancel() {
    if (!_isTappable) return;
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
