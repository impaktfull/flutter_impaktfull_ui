import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImpaktfullUiKeyboardListener extends StatefulWidget {
  final List<LogicalKeyboardKey> allowedKeys;
  final Widget child;
  final void Function()? onDelete;
  final void Function()? onSubmit;
  final void Function(String)? onNumberTap;

  const ImpaktfullUiKeyboardListener({
    required this.child,
    required this.allowedKeys,
    this.onDelete,
    this.onSubmit,
    this.onNumberTap,
    super.key,
  });

  static final numpadKeys = [
    LogicalKeyboardKey.numpad0,
    LogicalKeyboardKey.digit0,
    LogicalKeyboardKey.numpad1,
    LogicalKeyboardKey.digit1,
    LogicalKeyboardKey.numpad2,
    LogicalKeyboardKey.digit2,
    LogicalKeyboardKey.numpad3,
    LogicalKeyboardKey.digit3,
    LogicalKeyboardKey.numpad4,
    LogicalKeyboardKey.digit4,
    LogicalKeyboardKey.numpad5,
    LogicalKeyboardKey.digit5,
    LogicalKeyboardKey.numpad6,
    LogicalKeyboardKey.digit6,
    LogicalKeyboardKey.numpad7,
    LogicalKeyboardKey.digit7,
    LogicalKeyboardKey.numpad8,
    LogicalKeyboardKey.digit8,
    LogicalKeyboardKey.numpad9,
    LogicalKeyboardKey.digit9,
  ];

  @override
  State<ImpaktfullUiKeyboardListener> createState() =>
      _ImpaktfullUiKeyboardListenerState();
}

class _ImpaktfullUiKeyboardListenerState
    extends State<ImpaktfullUiKeyboardListener> {
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _focusNode,
      autofocus: true,
      onKeyEvent: _handleKeyPress,
      child: widget.child,
    );
  }

  KeyEventResult _handleKeyPress(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent) return KeyEventResult.ignored;

    if (event.logicalKey == LogicalKeyboardKey.backspace &&
        widget.onDelete != null) {
      widget.onDelete?.call();
      return KeyEventResult.handled;
    }

    if (event.logicalKey == LogicalKeyboardKey.enter &&
        widget.onSubmit != null) {
      widget.onSubmit?.call();
      return KeyEventResult.handled;
    }

    if (widget.allowedKeys.contains(event.logicalKey)) {
      final key = event.logicalKey.keyLabel;
      widget.onNumberTap?.call(key);
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }
}
