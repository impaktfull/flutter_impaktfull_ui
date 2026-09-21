import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/src/components/progress_indicator/widget/line_progress_indicator.dart';

import '../../../util/test_util.dart';

void main() {
  testWidgets('keeps 16px between the bar and the text', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const Center(
        child: SizedBox(
          width: 300,
          child: ImpaktfullUiLineProgressIndicator(
            value: 0.456,
            showText: true,
          ),
        ),
      ),
    );
    final bar = find.descendant(
      of: find.byType(ImpaktfullUiLineProgressIndicator),
      matching: find.byType(Stack),
    );
    final text = find.text('46%');
    expect(text, findsOneWidget);
    expect(
      tester.getTopLeft(text).dx - tester.getTopRight(bar).dx,
      16,
    );
    // No stray SizedBox between the bar and the text.
    expect(
      find.descendant(
        of: find.byType(ImpaktfullUiLineProgressIndicator),
        matching: find.byWidgetPredicate(
          (widget) => widget is SizedBox && widget.height == 4,
        ),
      ),
      findsNothing,
    );
  });
}
