import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_data_display_golden_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  // The shimmer repeats forever: every skeleton is frozen at the first frame.
  runComponentTest(
    fileName: 'impaktfull_ui_skeleton',
    columns: 3,
    goldenTests: () => [
      GoldenTest(
        description: 'box',
        child: frozen(
          goldenBox(
            width: 140,
            child: const ImpaktfullUiSkeleton.box(width: 120, height: 40),
          ),
        ),
      ),
      GoldenTest(
        description: 'box with border radius',
        child: frozen(
          goldenBox(
            width: 140,
            child: const ImpaktfullUiSkeleton.box(
              width: 120,
              height: 40,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
      ),
      GoldenTest(
        description: 'circle',
        child: frozen(
          goldenBox(
            width: 140,
            child: const ImpaktfullUiSkeleton.circle(width: 40, height: 40),
          ),
        ),
      ),
      GoldenTest(
        description: 'factor',
        child: frozen(
          goldenBox(
            width: 140,
            height: 80,
            // Aligned: with tight constraints the factor has no effect.
            child: const Align(
              alignment: Alignment.topLeft,
              child: ImpaktfullUiSkeleton.factor(
                widthFactor: 0.5,
                heightFactor: 0.5,
              ),
            ),
          ),
        ),
      ),
      GoldenTest(
        description: 'factor with a fixed height',
        child: frozen(
          goldenBox(
            width: 140,
            height: 80,
            child: const Align(
              alignment: Alignment.topLeft,
              child: ImpaktfullUiSkeleton.factor(height: 16),
            ),
          ),
        ),
      ),
      GoldenTest(
        description: 'list item placeholder',
        child: frozen(
          goldenBox(
            width: 140,
            height: 80,
            child: const Row(
              spacing: 8,
              children: [
                ImpaktfullUiSkeleton.circle(width: 32, height: 32),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 4,
                    children: [
                      ImpaktfullUiSkeleton.factor(height: 12),
                      ImpaktfullUiSkeleton.factor(
                        widthFactor: 0.6,
                        height: 12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
