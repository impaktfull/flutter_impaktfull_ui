import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

part 'morse_code_touch_feedback.describe.dart';

class ImpaktfullUiMorseCodeTouchFeedback extends StatefulWidget
    with ComponentDescriptorMixin {
  final VoidCallback onTap;
  final String text;
  final Widget child;
  final Duration shortDuration;

  const ImpaktfullUiMorseCodeTouchFeedback({
    required this.text,
    required this.onTap,
    required this.child,
    this.shortDuration = const Duration(milliseconds: 150),
    super.key,
  });

  @override
  State<ImpaktfullUiMorseCodeTouchFeedback> createState() =>
      _ImpaktfullUiMorseCodeTouchFeedbackState();

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}

class _ImpaktfullUiMorseCodeTouchFeedbackState
    extends State<ImpaktfullUiMorseCodeTouchFeedback> {
  final List<Duration> _tapDurations = [];
  final maxWaitTime = const Duration(seconds: 1);
  DateTime? _lastInteractionTime;
  DateTime? _tapStartTime;

  static const Map<String, String> _morseCodeMap = {
    'a': '.-',
    'b': '-...',
    'c': '-.-.',
    'd': '-..',
    'e': '.',
    'f': '..-.',
    'g': '--.',
    'h': '....',
    'i': '..',
    'j': '.---',
    'k': '-.-',
    'l': '.-..',
    'm': '--',
    'n': '-.',
    'o': '---',
    'p': '.--.',
    'q': '--.-',
    'r': '.-.',
    's': '...',
    't': '-',
    'u': '..-',
    'v': '...-',
    'w': '.--',
    'x': '-..-',
    'y': '-.--',
    'z': '--..',
    '1': '.----',
    '2': '..---',
    '3': '...--',
    '4': '....-',
    '5': '.....',
    '6': '-....',
    '7': '--...',
    '8': '---..',
    '9': '----.',
    '0': '-----',
  };

  String get _expectedMorseCode => widget.text
      .toLowerCase()
      .split('')
      .map((char) => _morseCodeMap[char] ?? '')
      .join();

  void _onTapDown(TapDownDetails details) {
    final now = DateTime.now();
    if (_lastInteractionTime != null &&
        now.difference(_lastInteractionTime!) > maxWaitTime) {
      _tapDurations.clear();
    }
    _tapStartTime = now;
  }

  void _onTapUp(TapUpDetails details) {
    if (_tapStartTime != null) {
      final duration = DateTime.now().difference(_tapStartTime!);
      _tapDurations.add(duration);
      _checkMorseCode();
    }
    _lastInteractionTime = DateTime.now();
  }

  void _onTapCancel() {
    _tapStartTime = null;
    _lastInteractionTime = DateTime.now();
  }

  void _checkMorseCode() {
    final inputCode = _tapDurations.map((duration) {
      if (duration < widget.shortDuration) return '.';
      if (duration > widget.shortDuration) return '-';
      return '';
    }).join();

    if (inputCode == _expectedMorseCode) {
      widget.onTap();
      _tapDurations.clear();
    }

    // Clear the pattern after a delay if it doesn't match
    if (_tapDurations.length >= _expectedMorseCode.length) {
      _tapDurations.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: ColoredBox(
        color: Colors.transparent,
        child: IgnorePointer(
          child: widget.child,
        ),
      ),
    );
  }
}
