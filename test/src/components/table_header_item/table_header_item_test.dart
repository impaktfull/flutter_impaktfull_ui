import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  testWidgets('checkbox without a title shows the checkbox', (tester) async {
    bool? changed;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiTableHeaderItem.checkbox(
        isSelected: false,
        onChanged: (value) => changed = value,
      ),
    );
    expect(find.byType(ImpaktfullUiCheckbox), findsOneWidget);
    await tester.tap(find.byType(ImpaktfullUiCheckbox));
    expect(changed, isTrue);
  });

  testWidgets('checkbox without onChanged does not crash', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiTableHeaderItem.checkbox(
        isSelected: false,
        onChanged: null,
        title: 'Title',
      ),
    );
    expect(tester.takeException(), isNull);
    expect(find.byType(ImpaktfullUiCheckbox), findsOneWidget);
  });

  testWidgets('without a title and not a checkbox shows nothing',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiTableHeaderItem(),
    );
    expect(find.byType(RichText), findsNothing);
  });

  testWidgets('the title uses all the available width', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: 432,
          child: ImpaktfullUiTableHeaderItem(title: 'Title'),
        ),
      ),
    );
    // 432 - 2 * 16 horizontal padding.
    expect(tester.getSize(find.byType(RichText)).width, 400);
  });
}
