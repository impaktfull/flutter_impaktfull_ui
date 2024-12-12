import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';
import 'dart:async';

part 'touch_feedback_sequence.describe.dart';

class ImpaktfullUiTouchFeedbackSequence extends StatefulWidget
    with ComponentDescriptorMixin {
  final Widget child;
  final VoidCallback onTap;
  final int requiredTaps;
  final bool ignoreChildPointerEvents;

  const ImpaktfullUiTouchFeedbackSequence({
    required this.child,
    required this.onTap,
    this.requiredTaps = 2,
    this.ignoreChildPointerEvents = true,
    super.key,
  }) : assert(requiredTaps >= 2, 'requiredTaps must be at least 2');

  @override
  String describe(BuildContext context) => _describeInstance(context, this);

  @override
  State<ImpaktfullUiTouchFeedbackSequence> createState() =>
      _ImpaktfullUiTouchFeedbackSequenceState();
}

class _ImpaktfullUiTouchFeedbackSequenceState
    extends State<ImpaktfullUiTouchFeedbackSequence> {
  final resetDuration = const Duration(seconds: 1);
  int _tapCount = 0;
  Timer? _resetTimer;

  void _handleTap() {
    _resetTimer?.cancel();

    setState(() {
      _tapCount++;
    });

    if (_tapCount >= widget.requiredTaps) {
      widget.onTap.call();
      _tapCount = 0;
    } else {
      _resetTimer = Timer(resetDuration, () {
        setState(() {
          _tapCount = 0;
        });
      });
    }
  }

  @override
  void dispose() {
    _resetTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        color: Colors.transparent,
        child: IgnorePointer(
          ignoring: widget.ignoreChildPointerEvents,
          child: widget.child,
        ),
      ),
    );
  }
}
