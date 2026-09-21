import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  testWidgets('numpad keys are added to the code', (tester) async {
    final codes = <String>[];
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiPinCode(
        code: '',
        onChanged: codes.add,
      ),
    );
    await tester.sendKeyEvent(LogicalKeyboardKey.numpad1);
    await tester.sendKeyEvent(LogicalKeyboardKey.numpad9);
    await tester.pump();
    expect(codes, ['1', '19']);
  });

  testWidgets('digit keys are added to the code', (tester) async {
    final codes = <String>[];
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiPinCode(
        code: '',
        onChanged: codes.add,
      ),
    );
    await tester.sendKeyEvent(LogicalKeyboardKey.digit4);
    await tester.pump();
    expect(codes, ['4']);
  });
}
