import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  testWidgets('calls onTap when tapped', (tester) async {
    var taps = 0;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiNotification(
        title: 'Title',
        onTap: () => taps++,
      ),
    );

    await tester.tap(find.text('Title'));
    await tester.pumpAndSettle();
    expect(taps, 1);
  });

  testWidgets('the close button does not trigger onTap', (tester) async {
    var taps = 0;
    var closeTaps = 0;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiNotification(
        title: 'Title',
        onTap: () => taps++,
        onCloseTapped: () => closeTaps++,
      ),
    );

    await tester.tap(find.byType(ImpaktfullUiIconButton));
    await tester.pumpAndSettle();
    expect(closeTaps, 1);
    expect(taps, 0);
  });
}
