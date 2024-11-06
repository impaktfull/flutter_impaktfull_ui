import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/morse_code_touch_feedback/morse_code_touch_feedback_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';

class MorseCodeTouchFeedbackLibraryVariant extends ComponentLibraryVariant<
    MorseCodeTouchFeedbackLibraryPrimaryInputs> {
  const MorseCodeTouchFeedbackLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, MorseCodeTouchFeedbackLibraryPrimaryInputs inputs) {
    return [
      ImpaktfullUiMorseCodeTouchFeedback(
        text: 'sos',
        // ignore: avoid_print
        onTap: () => print('sos'),
        child: const Text(
            'Tap `SOS` in Morse Code!\nThis is the code\n3x short, 3x long, 3x short (...---...)'),
      ),
    ];
  }

  @override
  MorseCodeTouchFeedbackLibraryPrimaryInputs inputs() =>
      MorseCodeTouchFeedbackLibraryPrimaryInputs();
}

class MorseCodeTouchFeedbackLibraryPrimaryInputs
    extends MorseCodeTouchFeedbackLibraryInputs {}
