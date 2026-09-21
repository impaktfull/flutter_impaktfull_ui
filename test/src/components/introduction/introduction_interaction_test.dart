import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  testWidgets('renders an empty box without errors', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const Center(
        child:
            SizedBox(width: 100, height: 50, child: ImpaktfullUiIntroduction()),
      ),
    );
    expect(tester.takeException(), isNull);
    expect(
      tester.getSize(find.byType(ImpaktfullUiIntroduction)),
      const Size(100, 50),
    );
    expect(
      find.descendant(
        of: find.byType(ImpaktfullUiIntroduction),
        matching: find.byType(Text),
      ),
      findsNothing,
    );
  });

  testWidgets('fills the available space', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const Center(child: ImpaktfullUiIntroduction()),
    );
    expect(
      tester.getSize(find.byType(ImpaktfullUiIntroduction)),
      tester.view.physicalSize / tester.view.devicePixelRatio,
    );
  });
}
