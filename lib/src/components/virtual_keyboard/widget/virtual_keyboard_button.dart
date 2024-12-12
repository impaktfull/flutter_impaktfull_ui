import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/components/theme/theme_builder.dart';
import 'package:impaktfull_ui/src/components/virtual_keyboard/virtual_keyboard.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiVirtualKeyboardButton extends StatefulWidget {
  final bool shift;
  final bool capsLock;
  final ImpaktfullUiVirtualKeyboardKeyItem virtualKeyboardKey;
  final ValueChanged<ImpaktfullUiVirtualKeyboardKey> onTap;
  final VoidCallback onTapDown;
  final VoidCallback onTapUp;

  const ImpaktfullUiVirtualKeyboardButton({
    required this.shift,
    required this.capsLock,
    required this.virtualKeyboardKey,
    required this.onTap,
    required this.onTapDown,
    required this.onTapUp,
    super.key,
  });

  @override
  State<ImpaktfullUiVirtualKeyboardButton> createState() =>
      _ImpaktfullUiVirtualKeyboardButtonState();
}

class _ImpaktfullUiVirtualKeyboardButtonState
    extends State<ImpaktfullUiVirtualKeyboardButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;
  var _isSliding = false;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 0.3),
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logicalKey = widget.virtualKeyboardKey.logicalKey(widget.shift);
    ImpaktfullUiVirtualKeyboardKey primaryKey;
    ImpaktfullUiVirtualKeyboardKey? secondaryKey;
    final hasSecondaryKey = widget.virtualKeyboardKey.shiftKey != null;
    if (hasSecondaryKey && widget.shift) {
      primaryKey = widget.virtualKeyboardKey.shiftKey ??
          widget.virtualKeyboardKey.defaultKey;
      secondaryKey = widget.virtualKeyboardKey.defaultKey;
    } else {
      primaryKey = widget.virtualKeyboardKey.defaultKey;
      secondaryKey = widget.virtualKeyboardKey.shiftKey;
    }

    return ImpaktfullUiThemeBuidler(
      builder: (context, theme) => GestureDetector(
        onVerticalDragUpdate: _handleVerticalDragUpdate,
        onVerticalDragEnd: _handleVerticalDragEnd,
        child: ImpaktfullUiTouchFeedback(
          border: Border.all(color: Colors.black12),
          borderRadius: theme.dimens.borderRadius,
          color: _getBackgroundColor(logicalKey, theme),
          onTap: null,
          onTapDown: _onTapEnabled ? _handleTapDown : (_) => widget.onTapDown(),
          onTapUp: _onTapEnabled ? _handleTapUp : (_) => widget.onTapUp(),
          onTapCancel:
              _onTapEnabled ? _handleTapCancel : () => widget.onTapUp(),
          child: ClipRRect(
            borderRadius: theme.dimens.borderRadius,
            child: Align(
              alignment: Alignment.center,
              child: SlideTransition(
                position: _slideAnimation,
                child: ImpaktfullUiAutoLayout.vertical(
                  spacing: 4,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (secondaryKey != null) ...[
                      Opacity(
                        opacity: 0.5,
                        child: Text(
                          _getLabel(
                              secondaryKey, widget.shift, widget.capsLock),
                          style: _getTextStyle(secondaryKey.key, theme),
                        ),
                      ),
                    ],
                    Text(
                      _getLabel(primaryKey, widget.shift, widget.capsLock),
                      style: _getTextStyle(primaryKey.key, theme),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _getLabel(
      ImpaktfullUiVirtualKeyboardKey primaryKey, bool shift, bool capsLock) {
    final isUpperCaseAllowed =
        ImpaktfullUiVirtualKeyboard.uppercaseKeys.contains(primaryKey.key);
    final label = primaryKey.label ?? primaryKey.key.keyLabel;
    if (isUpperCaseAllowed && (shift || capsLock)) {
      return label.toUpperCase();
    }
    return label.toLowerCase();
  }

  bool isShiftKey(LogicalKeyboardKey logicalKey) {
    return logicalKey == LogicalKeyboardKey.shiftLeft ||
        logicalKey == LogicalKeyboardKey.shiftRight;
  }

  bool isCapsLockKey(LogicalKeyboardKey logicalKey) =>
      logicalKey == LogicalKeyboardKey.capsLock;

  Color _getBackgroundColor(LogicalKeyboardKey key, ImpaktfullUiTheme theme) {
    if (widget.shift && isShiftKey(key)) {
      return theme.colors.accent;
    }
    if (widget.capsLock && isCapsLockKey(key)) {
      return theme.colors.accent;
    }
    return theme.colors.card;
  }

  TextStyle _getTextStyle(LogicalKeyboardKey key, ImpaktfullUiTheme theme) {
    if (widget.shift && isShiftKey(key)) {
      return TextStyle(color: theme.colors.textOnAccent);
    } else if (widget.capsLock && isCapsLockKey(key)) {
      return TextStyle(color: theme.colors.textOnAccent);
    }
    return TextStyle(color: theme.colors.text);
  }

  bool get _onTapEnabled {
    final logicalKey = widget.virtualKeyboardKey.logicalKey(widget.shift);
    if (logicalKey == LogicalKeyboardKey.shift ||
        logicalKey == LogicalKeyboardKey.shiftLeft ||
        logicalKey == LogicalKeyboardKey.shiftRight) {
      return false;
    } else if (logicalKey == LogicalKeyboardKey.controlLeft ||
        logicalKey == LogicalKeyboardKey.controlRight ||
        logicalKey == LogicalKeyboardKey.control) {
      return false;
    }
    return true;
  }

  void _onTap() => widget.onTap(widget.virtualKeyboardKey.defaultKey);

  void _handleTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
    _startRepeatingTap();
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
  }

  void _handleTapCancel() {
    setState(() => _isPressed = false);
  }

  Future<void> _startRepeatingTap() async {
    if (!_isPressed) return;
    _onTap();
    await Future.delayed(const Duration(milliseconds: 100));
    if (!mounted) return;
    await _startRepeatingTap();
  }

  void _onSecondarySwipeAction() {
    final key = widget.virtualKeyboardKey.shiftKey;
    if (key == null) return;
    widget.onTap(key);
  }

  void _handleVerticalDragUpdate(DragUpdateDetails details) {
    if (widget.virtualKeyboardKey.shiftKey == null) return;
    if (details.delta.dy > 0 && !_isSliding) {
      setState(() => _isSliding = true);
      _slideController.forward();
    }
  }

  void _handleVerticalDragEnd(DragEndDetails details) {
    if (widget.virtualKeyboardKey.shiftKey == null) return;
    if (!_isSliding) return;
    _slideController.reverse();
    setState(() => _isSliding = false);
    _onSecondarySwipeAction();
  }
}
