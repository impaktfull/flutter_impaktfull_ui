import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  List<Widget> chips() => [
        for (var i = 0; i < 7; i++)
          ImpaktfullUiBadge(
            type: ImpaktfullUiBadgeType.primary,
            label: 'Badge ${'•' * i}',
          ),
      ];

  runComponentTest(
    fileName: 'impaktfull_ui_wrap',
    columns: 3,
    goldenTests: () => [
      layoutGoldenCase(
        'No spacing',
        ImpaktfullUiWrap(children: chips()),
        width: 250,
      ),
      layoutGoldenCase(
        'Spacing 8',
        ImpaktfullUiWrap(spacing: 8, children: chips()),
        width: 250,
      ),
      layoutGoldenCase(
        'Spacing 8, run spacing 16',
        ImpaktfullUiWrap(spacing: 8, runSpacing: 16, children: chips()),
        width: 250,
      ),
    ],
  );
}
