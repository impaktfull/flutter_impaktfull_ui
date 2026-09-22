import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_data_display_golden_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  const values = [0.0, 0.5, 1.0];

  runComponentTest(
    fileName: 'impaktfull_ui_progress_indicator_line',
    columns: 3,
    goldenTests: () => [
      for (final showText in [false, true])
        for (final value in values)
          GoldenTest(
            description: 'line $value text: $showText',
            child: goldenBox(
              width: 200,
              child: ImpaktfullUiProgressIndicator(
                value: value,
                showText: showText,
                animate: false,
              ),
            ),
          ),
      GoldenTest(
        description: 'line with color and width',
        child: goldenBox(
          width: 200,
          child: const ImpaktfullUiProgressIndicator(
            value: 0.75,
            color: Colors.green,
            width: 12,
            animate: false,
          ),
        ),
      ),
    ],
  );

  for (final type in [
    ImpaktfullUiProgressIndicatorType.circle,
    ImpaktfullUiProgressIndicatorType.halfCircle,
  ]) {
    runComponentTest(
      fileName: 'impaktfull_ui_progress_indicator_${type.name}',
      columns: 3,
      goldenTests: () => [
        for (final showText in [false, true])
          for (final value in values)
            GoldenTest(
              description: '${type.name} $value text: $showText',
              child: goldenBox(
                width: 120,
                height: 120,
                child: ImpaktfullUiProgressIndicator(
                  type: type,
                  value: value,
                  showText: showText,
                  animate: false,
                ),
              ),
            ),
        GoldenTest(
          description: '${type.name} with color and width',
          child: goldenBox(
            width: 120,
            height: 120,
            child: ImpaktfullUiProgressIndicator(
              type: type,
              value: 0.75,
              color: Colors.green,
              width: 12,
              animate: false,
            ),
          ),
        ),
      ],
    );
  }

  runComponentTest(
    fileName: 'impaktfull_ui_progress_indicator_animated',
    columns: 3,
    goldenTests: () => [
      // pumpAndSettle finishes the animation: the end value is shown.
      for (final type in ImpaktfullUiProgressIndicatorType.values)
        GoldenTest(
          description: '${type.name} animated to 0.5',
          child: goldenBox(
            width: 120,
            height: 120,
            child: ImpaktfullUiProgressIndicator(
              type: type,
              value: 0.5,
              showText: true,
            ),
          ),
        ),
    ],
  );
}
