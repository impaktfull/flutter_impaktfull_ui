import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../_core_test_helpers.dart';

void main() {
  late List<String> emails;
  late List<String> passwords;
  late int registerTaps;
  late int backTaps;

  setUp(() {
    emails = [];
    passwords = [];
    registerTaps = 0;
    backTaps = 0;
  });

  Widget buildRegister({
    String email = '',
    String password = '',
    bool withBack = true,
  }) =>
      ImpaktfullUiScreen(
        child: ImpaktfullUiBBRegister(
          email: email,
          password: password,
          onEmailChanged: emails.add,
          onPasswordChanged: passwords.add,
          onRegisterTapped: () async => registerTaps++,
          onBackToLoginTapped: withBack ? () => backTaps++ : null,
        ),
      );

  testWidgets('shows the texts', (tester) async {
    await pumpImpaktfullUiApp(tester, buildRegister());
    expect(find.text('Hi there!'), findsOneWidget);
    expect(find.text('Create your account to get started'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Enter your email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Enter your password'), findsOneWidget);
    expect(find.text('Register'), findsOneWidget);
    expect(find.text('Back to login'), findsOneWidget);
  });

  testWidgets('shows the given email and password', (tester) async {
    await pumpImpaktfullUiApp(
      tester,
      buildRegister(email: 'hello@impaktfull.com', password: 'secret'),
    );
    final fields = tester.widgetList<TextField>(find.byType(TextField));
    expect(fields.map((e) => e.controller?.text),
        ['hello@impaktfull.com', 'secret']);
  });

  testWidgets('the fields autofill a new account', (tester) async {
    await pumpImpaktfullUiApp(tester, buildRegister());
    final fields = tester.widgetList<TextField>(find.byType(TextField));
    expect(fields.first.keyboardType, TextInputType.emailAddress);
    expect(fields.first.autofillHints,
        [AutofillHints.email, AutofillHints.newUsername]);
    expect(fields.last.obscureText, isTrue);
    expect(fields.last.autofillHints, [AutofillHints.newPassword]);
  });

  testWidgets('entering an email and password calls the callbacks',
      (tester) async {
    await pumpImpaktfullUiApp(tester, buildRegister());
    await tester.enterText(find.byType(TextField).first, 'new@impaktfull.com');
    await tester.enterText(find.byType(TextField).last, 'secret');
    expect(emails.last, 'new@impaktfull.com');
    expect(passwords.last, 'secret');
  });

  testWidgets('tapping register calls onRegisterTapped', (tester) async {
    await pumpImpaktfullUiApp(tester, buildRegister());
    await tester.tap(find.text('Register'));
    await tester.pumpAndSettle();
    expect(registerTaps, 1);
    expect(backTaps, 0);
  });

  testWidgets('tapping back to login calls onBackToLoginTapped',
      (tester) async {
    await pumpImpaktfullUiApp(tester, buildRegister());
    await tester.tap(find.text('Back to login'));
    await tester.pumpAndSettle();
    expect(backTaps, 1);
    expect(registerTaps, 0);
  });

  testWidgets('hides back to login without onBackToLoginTapped',
      (tester) async {
    await pumpImpaktfullUiApp(tester, buildRegister(withBack: false));
    expect(find.text('Back to login'), findsNothing);
    expect(find.byType(ImpaktfullUiButton), findsOneWidget);
  });
}
