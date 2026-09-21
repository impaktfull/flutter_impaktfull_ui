import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  final cases = <Alignment, MainAxisAlignment>{
    Alignment.topLeft: MainAxisAlignment.start,
    Alignment.topCenter: MainAxisAlignment.start,
    Alignment.topRight: MainAxisAlignment.start,
    Alignment.centerLeft: MainAxisAlignment.center,
    Alignment.center: MainAxisAlignment.center,
    Alignment.centerRight: MainAxisAlignment.center,
    Alignment.bottomLeft: MainAxisAlignment.end,
    Alignment.bottomCenter: MainAxisAlignment.end,
    Alignment.bottomRight: MainAxisAlignment.end,
  };

  for (final entry in cases.entries) {
    testWidgets('${entry.key} aligns ${entry.value.name}', (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiUnifiedScreenLayout(
          alignment: entry.key,
          centerChild: const Text('center'),
        ),
      );
      final column = tester.widget<ImpaktfullUiAutoLayout>(find
          .ancestor(
            of: find.text('center'),
            matching: find.byType(ImpaktfullUiAutoLayout),
          )
          .first);
      expect(column.orientation, ImpaktfullUiAutoLayoutOrientation.vertical);
      expect(column.mainAxisAlignment, entry.value);
    });
  }
}
