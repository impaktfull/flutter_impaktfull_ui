import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

/// ImpaktfullUiIntroduction is a placeholder that renders an empty box.
void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_introduction',
    goldenTests: () => [
      layoutGoldenCase(
        'Empty placeholder',
        const SizedBox(
          width: 200,
          height: 50,
          child: ImpaktfullUiIntroduction(),
        ),
      ),
    ],
  );
}
