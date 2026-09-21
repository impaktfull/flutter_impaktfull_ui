import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  Widget padded() => ColoredBox(
        color: theme.colors.border,
        child: ImpaktfullUiFluidPadding(
          topPadding: 8,
          bottomPadding: 8,
          child: Container(
            height: 40,
            color: theme.colors.accent,
          ),
        ),
      );

  runComponentTest(
    fileName: 'impaktfull_ui_fluid_padding',
    goldenTests: () => [
      for (final width in [400.0, 800.0, 1100.0, 1600.0])
        layoutGoldenCase(
          'Screen width $width',
          Align(alignment: Alignment.topLeft, child: padded()),
          size: Size(width, 56),
        ),
    ],
  );
}
