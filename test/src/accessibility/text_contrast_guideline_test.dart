// The text contrast guideline takes a screenshot of the screen. In Chrome
// (tool/test_web.sh) flutter_test disposes that image before the guideline
// reads it ("This image has been disposed."), so it only runs on the Dart VM.
// The colors are the same on every platform.
@TestOn('vm')
library;

import 'package:flutter_test/flutter_test.dart';

import '_accessibility_test_helpers.dart';
import '_guideline_screens.dart';

void main() {
  for (final MapEntry(key: name, value: (screen, theme))
      in guidelineScreens.entries) {
    testWidgets('$name meets the text contrast guideline', (tester) async {
      final handle = tester.ensureSemantics();
      await pumpAccessibilityApp(tester, screen(), theme: theme);
      await expectLater(tester, meetsGuideline(textContrastGuideline));
      handle.dispose();
    });
  }
}
