import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../_core_test_helpers.dart';

void main() {
  late List<String> emails;
  late int resetTaps;
  late int backTaps;

  setUp(() {
    emails = [];
    resetTaps = 0;
    backTaps = 0;
  });

  Widget buildForgetPassword({String email = '', bool withBack = true}) =>
      ImpaktfullUiScreen(
        child: ImpaktfullUiBBForgetPassword(
          email: email,
          onChangedEmail: emails.add,
          onResetPasswordTapped: () async => resetTaps++,
          onBackToLoginTapped: withBack ? () => backTaps++ : null,
        ),
      );

  testWidgets('shows the texts', (tester) async {
    await pumpImpaktfullUiApp(tester, buildForgetPassword());
    expect(find.text('Forgot password?'), findsOneWidget);
    expect(
        find.text(
            'No problem, we will send you a link to reset your password.'),
        findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Enter your email'), findsOneWidget);
    expect(find.text('Reset password'), findsOneWidget);
    expect(find.text('Back to login'), findsOneWidget);
  });

  testWidgets('shows the given email in an email field', (tester) async {
    await pumpImpaktfullUiApp(
        tester, buildForgetPassword(email: 'hello@impaktfull.com'));
    final field = tester.widget<TextField>(find.byType(TextField));
    expect(field.controller?.text, 'hello@impaktfull.com');
    expect(field.keyboardType, TextInputType.emailAddress);
    expect(field.autofillHints, [AutofillHints.email]);
  });

  testWidgets('entering an email calls onChangedEmail', (tester) async {
    await pumpImpaktfullUiApp(tester, buildForgetPassword());
    await tester.enterText(find.byType(TextField), 'hello@impaktfull.com');
    expect(emails.last, 'hello@impaktfull.com');
  });

  testWidgets('tapping reset password calls onResetPasswordTapped',
      (tester) async {
    await pumpImpaktfullUiApp(tester, buildForgetPassword());
    await tester.tap(find.text('Reset password'));
    await tester.pumpAndSettle();
    expect(resetTaps, 1);
    expect(backTaps, 0);
  });

  testWidgets('tapping back to login calls onBackToLoginTapped',
      (tester) async {
    await pumpImpaktfullUiApp(tester, buildForgetPassword());
    await tester.tap(find.text('Back to login'));
    await tester.pumpAndSettle();
    expect(backTaps, 1);
    expect(resetTaps, 0);
  });

  testWidgets('hides back to login without onBackToLoginTapped',
      (tester) async {
    await pumpImpaktfullUiApp(tester, buildForgetPassword(withBack: false));
    expect(find.text('Back to login'), findsNothing);
    expect(find.byType(ImpaktfullUiButton), findsOneWidget);
  });
}
