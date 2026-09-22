import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../_core_golden_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  runScreenGoldenTest(
    fileName: 'impaktfull_ui_bb_login',
    builder: () => ImpaktfullUiBBLogin(
      email: 'hello@impaktfull.com',
      password: 'password',
      onEmailChanged: (_) {},
      onPasswordChanged: (_) {},
      onLoginTapped: () async {},
      onRegisterTapped: () {},
    ),
  );

  runScreenGoldenTest(
    fileName: 'impaktfull_ui_bb_login_localized',
    builder: () => ImpaktfullUiBBLogin(
      email: '',
      password: '',
      onEmailChanged: (_) {},
      onPasswordChanged: (_) {},
      onLoginTapped: () async {},
      localizations: const ImpaktfullUiBBLoginLocalizations(
        title: 'Welkom terug!',
        subtitle: 'Log in om verder te gaan',
        emailInputLabel: 'E-mail',
        emailInputPlaceholder: 'Vul je e-mail in',
        passwordInputLabel: 'Wachtwoord',
        passwordInputPlaceholder: 'Vul je wachtwoord in',
        loginBtn: 'Inloggen',
      ),
    ),
  );
}
