import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../_core_test_helpers.dart';

void main() {
  late List<String> emails;
  late List<String> passwords;
  late int loginTaps;
  late int registerTaps;

  setUp(() {
    emails = [];
    passwords = [];
    loginTaps = 0;
    registerTaps = 0;
  });

  Widget buildLogin({
    String email = '',
    String password = '',
    bool withRegister = true,
    ImpaktfullUiBBLoginLocalizations? localizations,
    Future<void> Function()? onLoginTapped,
  }) =>
      ImpaktfullUiScreen(
        child: ImpaktfullUiBBLogin(
          email: email,
          password: password,
          onEmailChanged: emails.add,
          onPasswordChanged: passwords.add,
          onLoginTapped: onLoginTapped ?? () async => loginTaps++,
          onRegisterTapped: withRegister ? () => registerTaps++ : null,
          localizations: localizations,
        ),
      );

  testWidgets('shows the default texts', (tester) async {
    await pumpImpaktfullUiApp(tester, buildLogin());
    const defaults = ImpaktfullUiBBLoginLocalizations();
    expect(find.text(defaults.title), findsOneWidget);
    expect(find.text(defaults.subtitle), findsOneWidget);
    expect(find.text(defaults.emailInputLabel), findsOneWidget);
    expect(find.text(defaults.emailInputPlaceholder), findsOneWidget);
    expect(find.text(defaults.passwordInputLabel), findsOneWidget);
    expect(find.text(defaults.passwordInputPlaceholder), findsOneWidget);
    expect(find.text(defaults.loginBtn), findsOneWidget);
    expect(find.text(defaults.createNewAccountBtn), findsOneWidget);
  });

  testWidgets('shows the given email and password', (tester) async {
    await pumpImpaktfullUiApp(
      tester,
      buildLogin(email: 'hello@impaktfull.com', password: 'secret'),
    );
    final fields = tester.widgetList<TextField>(find.byType(TextField));
    expect(fields.map((e) => e.controller?.text),
        ['hello@impaktfull.com', 'secret']);
  });

  testWidgets('the email field is an email field, the password is obscured',
      (tester) async {
    await pumpImpaktfullUiApp(tester, buildLogin());
    final fields = tester.widgetList<TextField>(find.byType(TextField));
    final email = fields.first;
    final password = fields.last;
    expect(email.keyboardType, TextInputType.emailAddress);
    expect(email.obscureText, isFalse);
    expect(email.autofillHints, [AutofillHints.email]);
    expect(email.textInputAction, TextInputAction.next);
    expect(password.obscureText, isTrue);
    expect(password.autofillHints, [AutofillHints.password]);
    expect(password.textInputAction, TextInputAction.done);
  });

  testWidgets('entering an email and password calls the callbacks',
      (tester) async {
    await pumpImpaktfullUiApp(tester, buildLogin());
    await tester.enterText(
        find.byType(TextField).first, 'hello@impaktfull.com');
    await tester.enterText(find.byType(TextField).last, 'secret');
    expect(emails.last, 'hello@impaktfull.com');
    expect(passwords.last, 'secret');
  });

  testWidgets('tapping login calls onLoginTapped', (tester) async {
    await pumpImpaktfullUiApp(tester, buildLogin());
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();
    expect(loginTaps, 1);
    expect(registerTaps, 0);
  });

  testWidgets('login can not be tapped again while it is loading',
      (tester) async {
    final completer = Completer<void>();
    var taps = 0;
    await pumpImpaktfullUiApp(
      tester,
      buildLogin(onLoginTapped: () {
        taps++;
        return completer.future;
      }),
    );
    await tester.tap(find.text('Login'));
    await tester.pump();
    await tester.tap(find.text('Login'), warnIfMissed: false);
    await tester.pump();
    expect(taps, 1);
    completer.complete();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();
    expect(taps, 2);
  });

  testWidgets('tapping create new account calls onRegisterTapped',
      (tester) async {
    await pumpImpaktfullUiApp(tester, buildLogin());
    await tester.tap(find.text('Create new account'));
    await tester.pumpAndSettle();
    expect(registerTaps, 1);
    expect(loginTaps, 0);
  });

  testWidgets('hides create new account without onRegisterTapped',
      (tester) async {
    await pumpImpaktfullUiApp(tester, buildLogin(withRegister: false));
    expect(find.text('Create new account'), findsNothing);
    expect(find.byType(ImpaktfullUiButton), findsOneWidget);
  });

  group('localizations', () {
    const dutch = ImpaktfullUiBBLoginLocalizations(
      title: 'Welkom terug!',
      subtitle: 'Log in om verder te gaan',
      emailInputLabel: 'E-mail',
      emailInputPlaceholder: 'Vul je e-mail in',
      passwordInputLabel: 'Wachtwoord',
      passwordInputPlaceholder: 'Vul je wachtwoord in',
      loginBtn: 'Inloggen',
      createNewAccountBtn: 'Account aanmaken',
    );

    void expectDutch() {
      expect(find.text('Welkom terug!'), findsOneWidget);
      expect(find.text('Log in om verder te gaan'), findsOneWidget);
      expect(find.text('E-mail'), findsOneWidget);
      expect(find.text('Vul je e-mail in'), findsOneWidget);
      expect(find.text('Wachtwoord'), findsOneWidget);
      expect(find.text('Vul je wachtwoord in'), findsOneWidget);
      expect(find.text('Inloggen'), findsOneWidget);
      expect(find.text('Account aanmaken'), findsOneWidget);
      expect(find.text('Welcome back!'), findsNothing);
    }

    testWidgets('of the widget are applied', (tester) async {
      await pumpImpaktfullUiApp(tester, buildLogin(localizations: dutch));
      expectDutch();
      await tester.tap(find.text('Inloggen'));
      await tester.pumpAndSettle();
      expect(loginTaps, 1);
    });

    testWidgets('of ImpaktfullUiApp are applied', (tester) async {
      await pumpImpaktfullUiApp(
        tester,
        buildLogin(),
        localizations: const ImpaktfullUiLocalizations(bbLogin: dutch),
      );
      expectDutch();
    });

    testWidgets('of the widget win over those of ImpaktfullUiApp',
        (tester) async {
      await pumpImpaktfullUiApp(
        tester,
        buildLogin(
          localizations: const ImpaktfullUiBBLoginLocalizations(
            title: 'From the widget',
          ),
        ),
        localizations: const ImpaktfullUiLocalizations(bbLogin: dutch),
      );
      expect(find.text('From the widget'), findsOneWidget);
      expect(find.text('Welkom terug!'), findsNothing);
    });
  });

  testWidgets('the builders and alignment are passed to the layout',
      (tester) async {
    await pumpImpaktfullUiApp(
      tester,
      ImpaktfullUiScreen(
        child: ImpaktfullUiBBLogin(
          email: '',
          password: '',
          onEmailChanged: (_) {},
          onPasswordChanged: (_) {},
          onLoginTapped: () async {},
          alignment: Alignment.topLeft,
          topBuilder: (context) => const Text('top'),
          bottomBuilder: (context) => const Text('bottom'),
          startBuilder: (context) => const Text('start'),
          endBuilder: (context) => const Text('end'),
        ),
      ),
      screenSize: desktopSize,
    );
    final layout = tester.widget<ImpaktfullUiUnifiedScreenLayout>(
        find.byType(ImpaktfullUiUnifiedScreenLayout));
    expect(layout.alignment, Alignment.topLeft);
    expect(find.text('top'), findsOneWidget);
    expect(find.text('bottom'), findsOneWidget);
  });
}
