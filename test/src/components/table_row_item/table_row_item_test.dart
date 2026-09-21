import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  testWidgets('checkbox without onChanged does not crash', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiTableRowItem.checkbox(
        isSelected: true,
        onChanged: null,
        title: 'Title',
      ),
    );
    expect(tester.takeException(), isNull);
    expect(find.byType(ImpaktfullUiCheckbox), findsOneWidget);
    expect(find.text('Title'), findsOneWidget);
  });

  testWidgets('checkbox calls onChanged', (tester) async {
    bool? changed;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiTableRowItem.checkbox(
        isSelected: false,
        onChanged: (value) => changed = value,
      ),
    );
    await tester.tap(find.byType(ImpaktfullUiCheckbox));
    expect(changed, isTrue);
  });
}
