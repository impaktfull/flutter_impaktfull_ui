import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_inputs_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  const requirements = [
    ImpaktfullUiPasswordStrengthIndicatorRequirement(
      requirement: 'At least 8 characters',
      isMet: true,
    ),
    ImpaktfullUiPasswordStrengthIndicatorRequirement(
      requirement: 'At least 1 number',
      isMet: false,
    ),
    ImpaktfullUiPasswordStrengthIndicatorRequirement(
      requirement: 'A very long requirement that does not fit on a single line '
          'and has to wrap',
      isMet: false,
    ),
  ];

  runComponentTest(
    fileName: 'impaktfull_ui_password_strength_indicator',
    columns: 3,
    goldenTests: () => [
      for (final index in [null, 0, 1, 2, 3, 10]) ...[
        GoldenTest(
          child: goldenSized(ImpaktfullUiPasswordStrengthIndicator(
            strengthIndicatorIndex: index,
            requirements: requirements,
          )),
        ),
      ],
      GoldenTest(
        child: goldenSized(const ImpaktfullUiPasswordStrengthIndicator(
          strengthIndicatorIndex: 1,
          strengthIndicators: [Colors.red, Colors.green],
          requirements: [],
        )),
      ),
      GoldenTest(
        child: goldenSized(const ImpaktfullUiPasswordStrengthIndicator(
          strengthIndicatorIndex: 0,
          strengthIndicators: [
            Colors.red,
            Colors.orange,
            Colors.yellow,
            Colors.lime,
            Colors.green,
            Colors.teal,
          ],
          requirements: requirements,
        )),
      ),
    ],
  );
}
