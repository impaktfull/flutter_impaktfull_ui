import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../_core_golden_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  runScreenGoldenTest(
    fileName: 'impaktfull_ui_bb_verify_register_code',
    builder: () => ImpaktfullUiBBVerifyRegisterCode(
      code: '123456',
      onChangedVerificationCode: (_) {},
      onVerifyCodeTapped: () async {},
      onBackTapped: () {},
    ),
  );
}
