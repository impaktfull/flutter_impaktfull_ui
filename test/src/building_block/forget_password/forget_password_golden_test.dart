import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../_core_golden_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  runScreenGoldenTest(
    fileName: 'impaktfull_ui_bb_forget_password',
    builder: () => ImpaktfullUiBBForgetPassword(
      email: 'hello@impaktfull.com',
      onChangedEmail: (_) {},
      onResetPasswordTapped: () async {},
      onBackToLoginTapped: () {},
    ),
  );
}
