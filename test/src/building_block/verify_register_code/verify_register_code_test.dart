import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../_core_test_helpers.dart';

void main() {
  late List<String> codes;
  late int verifyTaps;
  late int backTaps;

  setUp(() {
    codes = [];
    verifyTaps = 0;
    backTaps = 0;
  });

  Widget buildVerify({String code = '', bool withBack = true}) =>
      ImpaktfullUiScreen(
        child: ImpaktfullUiBBVerifyRegisterCode(
          code: code,
          onChangedVerificationCode: codes.add,
          onVerifyCodeTapped: () async => verifyTaps++,
          onBackTapped: withBack ? () => backTaps++ : null,
        ),
      );

  testWidgets('shows the texts', (tester) async {
    await pumpImpaktfullUiApp(tester, buildVerify());
    expect(find.text("You've got mail"), findsOneWidget);
    expect(find.text('Enter the verification code you received by email'),
        findsOneWidget);
    expect(find.text('Verification code'), findsOneWidget);
    expect(find.text('Enter your verification code'), findsOneWidget);
    expect(find.text('Verify'), findsOneWidget);
    expect(find.text('Go back'), findsOneWidget);
  });

  testWidgets('shows the given code with one time code autofill',
      (tester) async {
    await pumpImpaktfullUiApp(tester, buildVerify(code: '123456'));
    final field = tester.widget<TextField>(find.byType(TextField));
    expect(field.controller?.text, '123456');
    expect(field.autofillHints, [AutofillHints.oneTimeCode]);
  });

  testWidgets('entering a code calls onChangedVerificationCode',
      (tester) async {
    await pumpImpaktfullUiApp(tester, buildVerify());
    await tester.enterText(find.byType(TextField), '654321');
    expect(codes.last, '654321');
  });

  testWidgets('tapping verify calls onVerifyCodeTapped', (tester) async {
    await pumpImpaktfullUiApp(tester, buildVerify());
    await tester.tap(find.text('Verify'));
    await tester.pumpAndSettle();
    expect(verifyTaps, 1);
    expect(backTaps, 0);
  });

  testWidgets('tapping go back calls onBackTapped', (tester) async {
    await pumpImpaktfullUiApp(tester, buildVerify());
    await tester.tap(find.text('Go back'));
    await tester.pumpAndSettle();
    expect(backTaps, 1);
    expect(verifyTaps, 0);
  });

  testWidgets('hides go back without onBackTapped', (tester) async {
    await pumpImpaktfullUiApp(tester, buildVerify(withBack: false));
    expect(find.text('Go back'), findsNothing);
    expect(find.byType(ImpaktfullUiButton), findsOneWidget);
  });
}
