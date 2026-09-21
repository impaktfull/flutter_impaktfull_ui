import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  Widget block(String label, Color color) => Container(
        color: color,
        alignment: Alignment.center,
        child: Text(label, style: theme.textStyles.onPrimary.text.medium),
      );

  Widget layout() => ImpaktfullUiResponsiveLayout(
        small: (context) => block('small', theme.colors.primary),
        medium: (context) => block('medium', theme.colors.accent),
        large: (context) => block('large', theme.colors.secondary),
        extraLarge: (context) => block('extraLarge', theme.colors.success),
      );

  runComponentTest(
    fileName: 'impaktfull_ui_responsive_layout',
    goldenTests: () => [
      for (final width in [400.0, 1100.0, 1600.0, 2000.0])
        layoutGoldenCase(
          'Screen width $width',
          layout(),
          size: Size(width, 60),
        ),
    ],
  );
}
