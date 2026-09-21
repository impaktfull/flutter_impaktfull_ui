import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  List<Widget> blocks([int count = 3]) => [
        for (var i = 0; i < count; i++)
          Container(
            width: 40 + i * 10.0,
            height: 30 + i * 5.0,
            color: theme.colors.accent,
          ),
      ];

  Widget frame(Widget child) => Container(
        width: 200,
        height: 120,
        color: theme.colors.border,
        child: child,
      );

  runComponentTest(
    fileName: 'impaktfull_ui_auto_layout',
    columns: 3,
    goldenTests: () => [
      layoutGoldenCase(
        'Horizontal, spacing 8',
        frame(ImpaktfullUiAutoLayout.horizontal(
          spacing: 8,
          children: blocks(),
        )),
      ),
      layoutGoldenCase(
        'Vertical, spacing 4',
        frame(ImpaktfullUiAutoLayout.vertical(
          spacing: 4,
          children: blocks(),
        )),
      ),
      layoutGoldenCase(
        'Horizontal, center/center',
        frame(ImpaktfullUiAutoLayout.horizontal(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: blocks(),
        )),
      ),
      layoutGoldenCase(
        'Horizontal, spaceBetween/end',
        frame(ImpaktfullUiAutoLayout.horizontal(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: blocks(),
        )),
      ),
      layoutGoldenCase(
        'Horizontal wrap, spacing 8',
        frame(ImpaktfullUiAutoLayout.horizontal(
          wrap: true,
          spacing: 8,
          children: blocks(5),
        )),
      ),
      layoutGoldenCase(
        'Vertical wrap, spacing 8',
        frame(ImpaktfullUiAutoLayout.vertical(
          wrap: true,
          spacing: 8,
          children: blocks(4),
        )),
      ),
    ],
  );
}
