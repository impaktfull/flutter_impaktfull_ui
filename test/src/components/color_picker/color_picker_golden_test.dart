import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_inputs_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_color_picker',
    columns: 2,
    goldenTests: () => [
      GoldenTest(
        child: goldenSized(ImpaktfullUiColorPicker(
          selectedColor: null,
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiColorPicker(
          selectedColor: Colors.teal,
          showActiveColor: true,
          allowedColors: const [
            Colors.black,
            Colors.white,
            Colors.teal,
            Color(0x80FF0000),
            Colors.amber,
            Colors.pink,
            Colors.indigo,
            Colors.brown,
            Colors.grey,
            Colors.lime,
          ],
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiColorPicker(
          type: ImpaktfullUiColorPickerType.slider,
          selectedColor: null,
          onChanged: (_) {},
        )),
      ),
      GoldenTest(
        child: goldenSized(ImpaktfullUiColorPicker(
          type: ImpaktfullUiColorPickerType.slider,
          selectedColor: null,
          allowedColors: const [Colors.black, Colors.white],
          onChanged: (_) {},
        )),
      ),
    ],
  );
}
