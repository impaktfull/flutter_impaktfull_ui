import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  Finder inkWell() => find.descendant(
        of: find.byType(ImpaktfullUiCheckbox),
        matching: find.byType(InkWell),
      );

  testWidgets('a disabled checkbox has no touch feedback', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiCheckbox(value: false, onChanged: null),
    );
    expect(inkWell(), findsNothing);
  });

  testWidgets('a disabled indeterminate checkbox has no touch feedback',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiCheckbox.indeterminate(value: null, onChanged: null),
    );
    expect(inkWell(), findsNothing);
  });

  testWidgets('an enabled checkbox can be tapped', (tester) async {
    final values = <bool>[];
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiCheckbox(value: false, onChanged: values.add),
    );
    expect(inkWell(), findsOneWidget);
    await tester.tap(find.byType(ImpaktfullUiCheckbox));
    await tester.pumpAndSettle();
    expect(values, [true]);
  });
}
