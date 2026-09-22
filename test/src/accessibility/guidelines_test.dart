import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '_accessibility_test_helpers.dart';
import '_guideline_screens.dart';

/// The tap target guidelines of Flutter on representative screens. The text
/// contrast guideline is in `text_contrast_guideline_test.dart`.
void main() {
  for (final MapEntry(key: name, value: (screen, theme))
      in guidelineScreens.entries) {
    group(name, () {
      testWidgets('meets the Android tap target guideline', (tester) async {
        final handle = tester.ensureSemantics();
        await pumpAccessibilityApp(tester, screen(), theme: theme);
        await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
        handle.dispose();
      });

      testWidgets('meets the iOS tap target guideline', (tester) async {
        final handle = tester.ensureSemantics();
        await pumpAccessibilityApp(tester, screen(), theme: theme);
        await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
        handle.dispose();
      });

      testWidgets('meets the labeled tap target guideline', (tester) async {
        final handle = tester.ensureSemantics();
        await pumpAccessibilityApp(tester, screen(), theme: theme);
        await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
        handle.dispose();
      });
    });
  }

  // Medium buttons are 44 high: the iOS guideline (44x44), not the Android
  // one (48x48). Use `ImpaktfullUiButtonSize.large` for 48.
  testWidgets('medium buttons meet the iOS tap target guideline',
      (tester) async {
    final handle = tester.ensureSemantics();
    await pumpAccessibilityApp(
      tester,
      Center(
        child: ImpaktfullUiPagination.withAmountOfPages(
          page: 1,
          itemsPerPage: 10,
          amountOfPages: 3,
          onLoadPage: (_) {},
        ),
      ),
    );
    await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
    await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
    handle.dispose();
  });
}
