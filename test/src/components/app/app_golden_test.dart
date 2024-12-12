import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_app',
    goldenTests: () => [
      GoldenTest(
        description: 'App',
        child: ImpaktfullUiApp(
          title: 'impaktfull app',
          home: Container(
            width: 400,
            height: 400,
            color: theme.colors.accent,
          ),
        ),
      ),
    ],
  );
}
