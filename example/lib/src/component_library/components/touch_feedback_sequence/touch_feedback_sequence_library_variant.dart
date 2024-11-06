import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/touch_feedback_sequence/touch_feedback_sequence_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class TouchFeedbackSequenceLibraryVariant
    extends ComponentLibraryVariant<TouchFeedbackSequenceLibraryPrimaryInputs> {
  const TouchFeedbackSequenceLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, TouchFeedbackSequenceLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiTouchFeedbackSequence(
        onTap: () => ImpaktfullUiNotification.show(title: 'Tapped 3 times'),
        requiredTaps: 3,
        child: const Text('Tap me'),
      ),
    ];
  }

  @override
  TouchFeedbackSequenceLibraryPrimaryInputs inputs() =>
      TouchFeedbackSequenceLibraryPrimaryInputs();
}

class TouchFeedbackSequenceLibraryPrimaryInputs
    extends TouchFeedbackSequenceLibraryInputs {}
