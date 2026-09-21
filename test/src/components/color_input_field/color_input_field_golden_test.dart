import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_inputs_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_color_input_field',
    columns: 2,
    goldenTests: () => [
      GoldenTest(
        child: goldenSized(ImpaktfullUiColorInputField(
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiColorInputField(
          label: 'Primary color',
          initialColor: Colors.deepPurple,
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiColorInputField(
          label: 'With alpha',
          initialColor: const Color(0x80FF0000),
          alphaEnabled: true,
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiColorInputField(
          label: 'With a color picker',
          initialColor: Colors.green,
          colorPickerType: ImpaktfullUiColorPickerType.simple,
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(const ImpaktfullUiColorInputField(
          label: 'Disabled',
          initialColor: Colors.orange,
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiColorInputField(
          label: 'A very long label for a color input field that wraps',
          initialColor: Colors.white,
          onChanged: (_) {},
        )),
      ),
    ],
  );
}
