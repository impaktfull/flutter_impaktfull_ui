import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../util/golden_test_util.dart';
import '../../util/golden_test_variant.dart';

/// Every component twice: left-to-right in the first column, right-to-left in
/// the second column.
List<GoldenTest> _bothDirections(List<Widget> children) => [
      for (final child in children) ...[
        for (final textDirection in [TextDirection.ltr, TextDirection.rtl])
          GoldenTest(
            child: Directionality(
              textDirection: textDirection,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(width: 300, child: child),
              ),
            ),
          ),
      ],
    ];

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_rtl',
    columns: 2,
    goldenTests: () => _bothDirections([
      Align(
        alignment: AlignmentDirectional.centerStart,
        child: ImpaktfullUiSwitch(value: true, onChanged: (_) {}),
      ),
      ImpaktfullUiSegmentedControl<String>(
        value: 'One',
        items: const ['One', 'Two', 'Three'],
        onChanged: (_) {},
      ),
      ImpaktfullUiInputField(
        value: 'Input',
        onChanged: (_) {},
        leadingIcon: const ImpaktfullUiAsset.icon(Icons.search),
      ),
      const Align(
        alignment: AlignmentDirectional.centerStart,
        child: ImpaktfullUiBadge(
          type: ImpaktfullUiBadgeType.primary,
          title: 'Badge',
          leadingAsset: ImpaktfullUiAsset.icon(Icons.star),
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(8),
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: ImpaktfullUiNotificationBadge(
            show: true,
            color: Colors.red,
            text: '3',
            child: SizedBox(
              width: 40,
              height: 40,
              child: ColoredBox(color: Colors.grey),
            ),
          ),
        ),
      ),
      ImpaktfullUiSlider(value: 25, min: 0, max: 100, onChanged: (_) {}),
    ]),
  );
}
