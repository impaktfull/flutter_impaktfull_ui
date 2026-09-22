import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

// The theme ImpaktfullUiApp uses when it gets none.
final _theme = ImpaktfullUiTheme.getDefault();

void main() {
  setUp(() => setupComponentTest());

  Widget box({
    double widthFactor = 1,
    double? minWidth,
    double? maxWidth,
    Alignment alignment = Alignment.center,
  }) =>
      Container(
        height: 40,
        color: _theme.colors.border,
        child: ImpaktfullUiClampedFractionallySizedBox(
          widthFactor: widthFactor,
          minWidth: minWidth,
          maxWidth: maxWidth,
          alignment: alignment,
          child: Container(color: _theme.colors.accent),
        ),
      );

  runComponentTest(
    fileName: 'impaktfull_ui_clamped_fractionally_sized_box',
    goldenTests: () => [
      layoutGoldenCase('Width factor 1', box(), width: 300),
      layoutGoldenCase('Width factor 0.5', box(widthFactor: 0.5), width: 300),
      layoutGoldenCase(
        'Width factor 0.2, min width 120',
        box(widthFactor: 0.2, minWidth: 120),
        width: 300,
      ),
      layoutGoldenCase(
        'Width factor 0.8, max width 100',
        box(widthFactor: 0.8, maxWidth: 100),
        width: 300,
      ),
      layoutGoldenCase(
        'Width factor 0.5, start aligned',
        box(widthFactor: 0.5, alignment: Alignment.centerLeft),
        width: 300,
      ),
    ],
  );
}
