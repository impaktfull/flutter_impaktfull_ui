import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';

void main() {
  setUp(() => setupComponentTest());

  // The morse code touch feedback has no UI of its own: it renders its child
  // as is.
  runComponentTest(
    fileName: 'impaktfull_ui_morse_code_touch_feedback',
    columns: 2,
    goldenTests: () => [
      GoldenTest(
        description: 'Child is rendered as is',
        child: ImpaktfullUiMorseCodeTouchFeedback(
          text: 'sos',
          onTap: () {},
          child: const SizedBox(
            width: 160,
            height: 48,
            child: ColoredBox(
              color: Colors.amber,
              child: Center(child: Text('Tap ... --- ...')),
            ),
          ),
        ),
      ),
      GoldenTest(
        description: 'Child keeps its pointer events',
        child: ImpaktfullUiMorseCodeTouchFeedback(
          text: 'sos',
          ignoreChildPointerEvents: false,
          onTap: () {},
          child: ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: 'Button',
            onTap: () {},
          ),
        ),
      ),
    ],
  );
}
