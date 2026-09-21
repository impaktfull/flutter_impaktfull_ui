import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_data_display_golden_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_metric_impact_types',
    columns: 2,
    goldenTests: () => [
      for (final impactType in ImpaktfullUiMetricImpactType.values)
        GoldenTest(
          description: impactType.name,
          child: goldenBox(
            child: ImpaktfullUiMetric(
              title: 'Revenue',
              value: '€ 12.345',
              extraTextValue: '12%',
              leadingExtraTextValue: testIcon2,
              impactType: impactType,
            ),
          ),
        ),
    ],
  );

  runComponentTest(
    fileName: 'impaktfull_ui_metric',
    columns: 2,
    goldenTests: () => [
      GoldenTest(
        description: 'simple',
        child: goldenBox(
          child: const ImpaktfullUiMetric(
            title: 'Users',
            value: '1.024',
          ),
        ),
      ),
      GoldenTest(
        description: 'leading asset and more button',
        child: goldenBox(
          child: ImpaktfullUiMetric(
            title: 'Users',
            value: '1.024',
            leadingAsset: testIcon3,
            onMoreTapped: () {},
          ),
        ),
      ),
      GoldenTest(
        description: 'left and bottom value builders',
        child: goldenBox(
          child: ImpaktfullUiMetric(
            title: 'Users',
            value: '1.024',
            leftValueBuilder: (context) => Container(
              width: 60,
              height: 24,
              color: Colors.blue.shade100,
            ),
            bottomValueBuilder: (context) => Container(
              height: 8,
              color: Colors.green.shade200,
            ),
          ),
        ),
      ),
      GoldenTest(
        description: 'actions',
        child: goldenBox(
          child: ImpaktfullUiMetric(
            title: 'Users',
            value: '1.024',
            actions: [
              ImpaktfullUiButton(
                type: ImpaktfullUiButtonType.secondary,
                title: 'Details',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      GoldenTest(
        description: 'icon button actions',
        child: goldenBox(
          child: ImpaktfullUiMetric(
            title: 'Users',
            value: '1.024',
            actions: [
              ImpaktfullUiIconButton(asset: testIcon, onTap: () {}),
              ImpaktfullUiIconButton(asset: testIcon2, onTap: () {}),
            ],
          ),
        ),
      ),
      GoldenTest(
        description: 'long title',
        child: goldenBox(
          child: const ImpaktfullUiMetric(
            title: longText,
            value: '1.024',
          ),
        ),
      ),
    ],
  );
}
