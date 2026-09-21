import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';

void main() {
  setUp(() => setupComponentTest());

  ImpaktfullUiVirtualKeyboardTextEditController controller(String text) =>
      ImpaktfullUiVirtualKeyboardTextEditController(
        text: text,
        config: ImpaktfullUiVirtualQwertyKeyboardConfig(),
      );

  /// The blinking cursor repeats forever, disable the tickers so the golden
  /// test can settle.
  Widget keyboard({
    required String text,
    bool obscureText = false,
    double width = 500,
  }) =>
      TickerMode(
        enabled: false,
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: ImpaktfullUiVirtualKeyboard(
            controller: controller(text),
            obscureText: obscureText,
            width: width,
          ),
        ),
      );

  runComponentTest(
    fileName: 'impaktfull_ui_virtual_keyboard',
    columns: 1,
    goldenTests: () => [
      GoldenTest(child: keyboard(text: '')),
      GoldenTest(child: keyboard(text: 'Hello world')),
      GoldenTest(child: keyboard(text: 'password', obscureText: true)),
      GoldenTest(child: keyboard(text: 'Narrow', width: 320)),
    ],
  );
}
