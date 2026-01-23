import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/card/card.dart';
import 'package:impaktfull_ui/src/components/icon_button/icon_button.dart';
import 'package:impaktfull_ui/src/components/virtual_keyboard/model/virtual_keyboard_key.dart';
import 'package:impaktfull_ui/src/components/virtual_keyboard/virtual_keyboard_style.dart';
import 'package:impaktfull_ui/src/components/virtual_keyboard/controller/virtual_keyboard_text_edit_controller.dart';
import 'package:impaktfull_ui/src/components/virtual_keyboard/widget/virtual_keyboard_button.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'virtual_keyboard_style.dart';
export 'model/config/virtual_keyboard_config.dart';
export 'model/config/qwerty/virtual_qwerty_keyboard_config.dart';
export 'model/virtual_keyboard_key.dart';
export 'controller/virtual_keyboard_text_edit_controller.dart';

class ImpaktfullUiVirtualKeyboard extends StatefulWidget {
  final ImpaktfullUiVirtualKeyboardTextEditController controller;
  final double? width;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final VoidCallback? onSubmit;
  final ImpaktfullUiVirtualKeyboardTheme? theme;

  static final uppercaseKeys = [
    LogicalKeyboardKey.keyA,
    LogicalKeyboardKey.keyB,
    LogicalKeyboardKey.keyC,
    LogicalKeyboardKey.keyD,
    LogicalKeyboardKey.keyE,
    LogicalKeyboardKey.keyF,
    LogicalKeyboardKey.keyG,
    LogicalKeyboardKey.keyH,
    LogicalKeyboardKey.keyI,
    LogicalKeyboardKey.keyJ,
    LogicalKeyboardKey.keyK,
    LogicalKeyboardKey.keyL,
    LogicalKeyboardKey.keyM,
    LogicalKeyboardKey.keyN,
    LogicalKeyboardKey.keyO,
    LogicalKeyboardKey.keyP,
    LogicalKeyboardKey.keyQ,
    LogicalKeyboardKey.keyR,
    LogicalKeyboardKey.keyS,
    LogicalKeyboardKey.keyT,
    LogicalKeyboardKey.keyU,
    LogicalKeyboardKey.keyV,
    LogicalKeyboardKey.keyW,
    LogicalKeyboardKey.keyX,
    LogicalKeyboardKey.keyY,
    LogicalKeyboardKey.keyZ,
  ];

  const ImpaktfullUiVirtualKeyboard({
    required this.controller,
    this.width,
    this.onChanged,
    this.onSubmit,
    this.obscureText = false,
    this.theme,
    super.key,
  });

  @override
  State<ImpaktfullUiVirtualKeyboard> createState() =>
      _ImpaktfullUiVirtualKeyboardState();

  static void show({
    required BuildContext context,
    required ImpaktfullUiVirtualKeyboardTextEditController controller,
    ValueChanged<String>? onChanged,
    bool obscureText = false,
    VoidCallback? onSubmit,
  }) {
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.4,
        maxWidth: MediaQuery.sizeOf(context).width,
        minWidth: MediaQuery.sizeOf(context).width,
      ),
      builder: (context) => Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: ImpaktfullUiVirtualKeyboard(
          controller: controller,
          onSubmit: onSubmit,
          onChanged: onChanged,
          obscureText: obscureText,
        ),
      ),
    );
  }
}

class _ImpaktfullUiVirtualKeyboardState
    extends State<ImpaktfullUiVirtualKeyboard>
    with SingleTickerProviderStateMixin {
  var _shift = false;
  var _shiftKeyReleased = true;
  var _capsLock = false;
  var _control = false;
  late AnimationController _cursorController;
  late Animation<double> _cursorAnimation;
  int _cursorPosition = 0;

  var _obscureText = false;

  List<List<ImpaktfullUiVirtualKeyboardKeyItem>> get keys =>
      widget.controller.config.keys;
  bool get useUppercase => _capsLock || _shift;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    widget.controller.addListener(_onControllerChanged);
    _cursorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..repeat(reverse: true);
    _cursorAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_cursorController);
    _cursorPosition = widget.controller.text.length;
  }

  @override
  void didUpdateWidget(ImpaktfullUiVirtualKeyboard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.obscureText != oldWidget.obscureText) {
      _obscureText = widget.obscureText;
    }
  }

  @override
  void dispose() {
    _cursorController.dispose();
    widget.controller.removeListener(_onControllerChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: widget,
      overrideComponentTheme: widget.theme,
      builder: (context, componentTheme) {
        final text = widget.obscureText
            ? '•' * widget.controller.text.length
            : widget.controller.text;
        return SizedBox(
          width: widget.width,
          child: FittedBox(
            fit: BoxFit.contain,
            child: SizedBox(
              width: 1000,
              height: keys.length * 75,
              child: ImpaktfullUiAutoLayout.vertical(
                mainAxisSize: MainAxisSize.min,
                spacing: 8,
                children: [
                  ImpaktfullUiCard(
                    width: double.infinity,
                    height: 56,
                    onTap: _onTapInputField,
                    child: ImpaktfullUiAutoLayout.horizontal(
                      children: [
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: _cursorPosition > 0
                                      ? text.substring(0, _cursorPosition)
                                      : '',
                                ),
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: FadeTransition(
                                    opacity: _cursorAnimation,
                                    child: Container(
                                      height: 20,
                                      width: 2,
                                      color: componentTheme.colors.cursor,
                                    ),
                                  ),
                                ),
                                TextSpan(text: text.substring(_cursorPosition)),
                              ],
                            ),
                          ),
                        ),
                        if (widget.obscureText) ...[
                          ImpaktfullUiIconButton(
                            asset: _obscureText
                                ? componentTheme.assets.passwordHide
                                : componentTheme.assets.passwordShow,
                            onTap: _onObscureTextHideShowIconTapped,
                          ),
                        ],
                      ],
                    ),
                  ),
                  for (final row in keys)
                    Expanded(
                      child: ImpaktfullUiAutoLayout.horizontal(
                        spacing: 8,
                        children: [
                          for (final key in row)
                            Expanded(
                              flex: key.flex,
                              child: Builder(
                                builder: (context) =>
                                    ImpaktfullUiVirtualKeyboardButton(
                                  shift: _shift,
                                  capsLock: _capsLock,
                                  virtualKeyboardKey: key,
                                  onTap: _onTapKey,
                                  onTapDown: () => _onTapDownKey(key),
                                  onTapUp: () => _onTapUpKey(key),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _onControllerChanged() {
    setState(() {});
  }

  void _onTapKey(ImpaktfullUiVirtualKeyboardKey key) {
    final text = widget.controller.text;
    final logicalKey = key.key;
    if (logicalKey == LogicalKeyboardKey.backspace) {
      if (text.isEmpty) return;
      if (_cursorPosition > 0) {
        final beforeCursor = text.substring(0, _cursorPosition - 1);
        final afterCursor = text.substring(_cursorPosition);
        widget.controller.text = beforeCursor + afterCursor;
        _cursorPosition--;
      }
    } else if (logicalKey == LogicalKeyboardKey.arrowLeft) {
      if (_cursorPosition > 0) {
        setState(() => _cursorPosition--);
      }
    } else if (logicalKey == LogicalKeyboardKey.arrowRight) {
      if (_cursorPosition < text.length) {
        setState(() => _cursorPosition++);
      }
    } else if (logicalKey == LogicalKeyboardKey.enter ||
        logicalKey == LogicalKeyboardKey.numpadEnter) {
      widget.onSubmit?.call();
    } else if (logicalKey == LogicalKeyboardKey.shift ||
        logicalKey == LogicalKeyboardKey.shiftLeft ||
        logicalKey == LogicalKeyboardKey.shiftRight) {
      return; // ignore the onTap because it's handled by the onTapDown & onTapUp
    } else if (logicalKey == LogicalKeyboardKey.capsLock) {
      _capsLock = !_capsLock;
    } else if (logicalKey == LogicalKeyboardKey.controlLeft ||
        logicalKey == LogicalKeyboardKey.controlRight ||
        logicalKey == LogicalKeyboardKey.control) {
      return; // ignore the onTap because it's handled by the onTapDown & onTapUp
    } else {
      var value = key.valueForTextInput.toLowerCase();
      if (useUppercase) {
        final isUpperCaseAllowed =
            ImpaktfullUiVirtualKeyboard.uppercaseKeys.contains(logicalKey);
        if (isUpperCaseAllowed && (_shift || _capsLock)) {
          value = value.toUpperCase();
        }
      }
      final beforeCursor = text.substring(0, _cursorPosition);
      final afterCursor = text.substring(_cursorPosition);
      widget.controller.text = beforeCursor + value + afterCursor;
      _cursorPosition++;
      if (!_shiftKeyReleased) {
        _shift = false;
        _shiftKeyReleased = true;
      }
    }
    widget.onChanged?.call(widget.controller.text);
    setState(() {});
  }

  void _onTapDownKey(ImpaktfullUiVirtualKeyboardKeyItem key) {
    final logicalKey = key.logicalKey(_shift);
    if (logicalKey == LogicalKeyboardKey.controlLeft ||
        logicalKey == LogicalKeyboardKey.controlRight ||
        logicalKey == LogicalKeyboardKey.control) {
      _control = !_control;
    } else {
      return;
    }
    setState(() {});
  }

  void _onTapUpKey(ImpaktfullUiVirtualKeyboardKeyItem key) {
    final logicalKey = key.logicalKey(_shift);
    if (logicalKey == LogicalKeyboardKey.shift ||
        logicalKey == LogicalKeyboardKey.shiftLeft ||
        logicalKey == LogicalKeyboardKey.shiftRight) {
      _shift = !_shift;
      _shiftKeyReleased = false;
    } else if (logicalKey == LogicalKeyboardKey.controlLeft ||
        logicalKey == LogicalKeyboardKey.controlRight ||
        logicalKey == LogicalKeyboardKey.control) {
      _control = !_control;
    } else {
      return;
    }
    setState(() {});
  }

  void _onTapInputField() {
    final newCursorPosition = widget.controller.text.length;
    if (_cursorPosition == newCursorPosition) return;
    setState(() {
      _cursorPosition = newCursorPosition;
    });
  }

  void _onObscureTextHideShowIconTapped() {
    setState(() => _obscureText = !_obscureText);
  }
}
