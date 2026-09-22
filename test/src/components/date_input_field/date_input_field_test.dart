import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  testWidgets('readOnly does not open the date picker', (tester) async {
    await pumpAndSettleComponent(
      tester,
      Center(
          child: SizedBox(
              width: 300,
              child: ImpaktfullUiDateInputField(
                value: DateTime(2024, 1, 1),
                readOnly: true,
                onChanged: (_) {},
              ))),
    );
    await tester.tap(find.byType(ImpaktfullUiDateInputField));
    await tester.pumpAndSettle();
    expect(find.byType(ImpaktfullUiDatePicker), findsNothing);
  });

  testWidgets('an editable field can be tapped', (tester) async {
    await pumpAndSettleComponent(
      tester,
      Center(
        child: SizedBox(
          width: 300,
          child: ImpaktfullUiDateInputField(
            value: DateTime(2024, 1, 1),
            onChanged: (_) {},
          ),
        ),
      ),
    );
    final card = tester.widget<ImpaktfullUiCard>(find.byType(ImpaktfullUiCard));
    expect(card.onTap, isNotNull);
  });

  testWidgets('a readOnly field can not be tapped', (tester) async {
    await pumpAndSettleComponent(
      tester,
      Center(
        child: SizedBox(
          width: 300,
          child: ImpaktfullUiDateInputField(
            value: DateTime(2024, 1, 1),
            readOnly: true,
            onChanged: (_) {},
          ),
        ),
      ),
    );
    final card = tester.widget<ImpaktfullUiCard>(find.byType(ImpaktfullUiCard));
    expect(card.onTap, isNull);
  });
}
