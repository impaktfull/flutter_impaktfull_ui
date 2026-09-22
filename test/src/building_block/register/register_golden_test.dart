import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../_core_golden_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  runScreenGoldenTest(
    fileName: 'impaktfull_ui_bb_register',
    builder: () => ImpaktfullUiBBRegister(
      email: 'hello@impaktfull.com',
      password: 'password',
      onEmailChanged: (_) {},
      onPasswordChanged: (_) {},
      onRegisterTapped: () async {},
      onBackToLoginTapped: () {},
    ),
  );
}
