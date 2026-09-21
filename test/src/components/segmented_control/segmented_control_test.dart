import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  Finder indicator() => find.descendant(
        of: find.byType(ImpaktfullUiSegmentedControl<String>),
        matching: find.byType(AnimatedAlign),
      );

  testWidgets('a single item does not throw', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiSegmentedControl<String>(
        value: 'A',
        items: const ['A'],
        onChanged: (_) {},
      ),
    );
    expect(tester.takeException(), isNull);
    final align = tester.widget<AnimatedAlign>(indicator());
    expect((align.alignment as AlignmentDirectional).start, 0);
  });

  testWidgets('a value that is not an item does not show the indicator',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiSegmentedControl<String>(
        value: 'C',
        items: const ['A', 'B'],
        onChanged: (_) {},
      ),
    );
    expect(tester.takeException(), isNull);
    expect(indicator(), findsNothing);
  });

  testWidgets('items that are not a String use toString without labelBuilder',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiSegmentedControl<int>(
        value: 1,
        items: const [1, 2],
        onChanged: (_) {},
      ),
    );
    expect(tester.takeException(), isNull);
    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
  });

  testWidgets('tapping an item calls onChanged once', (tester) async {
    final values = <String>[];
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiSegmentedControl<String>(
        value: 'A',
        items: const ['A', 'B'],
        onChanged: values.add,
      ),
    );
    await tester.tap(find.text('B'));
    await tester.pumpAndSettle();
    expect(values, ['B']);
  });
}
