import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  Widget row() => ImpaktfullUiResponsiveRow(
        maxColumns: 1,
        mediumMaxColumns: 2,
        largeMaxColumns: 3,
        verticalSpacing: 8,
        horizontalSpacing: 16,
        children: [
          for (var i = 0; i < 5; i++) ImpaktfullUiCard(child: Text('Card $i')),
        ],
      );

  runComponentTest(
    fileName: 'impaktfull_ui_responsive_row',
    goldenTests: () => [
      layoutGoldenCase(
        'Small (1 column)',
        row(),
        size: const Size(400, 420),
      ),
      layoutGoldenCase(
        'Medium (2 columns)',
        row(),
        size: Size(mediumScreenSize.width, 240),
      ),
      layoutGoldenCase(
        'Large (3 columns)',
        row(),
        size: Size(largeScreenSize.width, 160),
      ),
    ],
  );
}
