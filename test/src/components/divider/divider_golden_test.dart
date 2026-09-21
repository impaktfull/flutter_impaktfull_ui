import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_divider',
    columns: 4,
    goldenTests: () => [
      layoutGoldenCase(
        'Horizontal',
        const SizedBox(
          width: 150,
          height: 40,
          child: Center(child: ImpaktfullUiDivider()),
        ),
      ),
      layoutGoldenCase(
        'Horizontal, margin 16',
        const SizedBox(
          width: 150,
          height: 40,
          child: Center(
            child: ImpaktfullUiDivider(
              margin: EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ),
      ),
      layoutGoldenCase(
        'Vertical',
        const SizedBox(
          width: 150,
          height: 40,
          child: Center(child: ImpaktfullUiDivider(vertical: true)),
        ),
      ),
      layoutGoldenCase(
        'Vertical, in a row',
        const SizedBox(
          width: 150,
          height: 40,
          child: Row(
            children: [
              Expanded(child: Center(child: Text('Left'))),
              ImpaktfullUiDivider(
                vertical: true,
                margin: EdgeInsets.symmetric(vertical: 8),
              ),
              Expanded(child: Center(child: Text('Right'))),
            ],
          ),
        ),
      ),
    ],
  );
}
