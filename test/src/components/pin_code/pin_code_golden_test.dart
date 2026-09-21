import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_inputs_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  Widget pinCode({
    required String code,
    int length = 4,
    bool withSubmit = true,
  }) =>
      goldenSized(
        ImpaktfullUiPinCode(
          code: code,
          length: length,
          onChanged: (_) {},
          onSubmit: withSubmit ? (_) {} : null,
        ),
        width: 280,
        height: 380,
      );

  runComponentTest(
    fileName: 'impaktfull_ui_pin_code',
    columns: 3,
    goldenTests: () => [
      GoldenTest(child: pinCode(code: '', withSubmit: false)),
      GoldenTest(child: pinCode(code: '')),
      GoldenTest(child: pinCode(code: '12')),
      GoldenTest(child: pinCode(code: '1234')),
      GoldenTest(child: pinCode(code: '123', length: 6)),
      GoldenTest(child: pinCode(code: '123456', length: 6)),
    ],
  );
}
