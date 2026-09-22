import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  /// The item is an [Expanded]: it needs a [Row] (a bottom navigation).
  Widget item(ImpaktfullUiBottomNavigationItem item) => SizedBox(
        width: 120,
        child: Row(children: [item]),
      );

  runComponentTest(
    fileName: 'impaktfull_ui_bottom_navigation_item',
    columns: 4,
    goldenTests: () => [
      for (final isSelected in [true, false]) ...[
        layoutGoldenCase(
          isSelected ? 'Selected' : 'Unselected',
          item(ImpaktfullUiBottomNavigationItem(
            asset: testAsset,
            selectedAsset: testSelectedAsset,
            title: 'Label',
            isSelected: isSelected,
            onTap: () {},
          )),
        ),
        layoutGoldenCase(
          isSelected ? 'Selected, badge' : 'Unselected, badge',
          item(ImpaktfullUiBottomNavigationItem(
            asset: testAsset,
            title: 'Label',
            isSelected: isSelected,
            badgeShow: true,
            onTap: () {},
          )),
        ),
        layoutGoldenCase(
          isSelected ? 'Selected, badge text' : 'Unselected, badge text',
          item(ImpaktfullUiBottomNavigationItem(
            asset: testAsset,
            title: 'Label',
            isSelected: isSelected,
            badgeText: '12',
            onTap: () {},
          )),
        ),
        layoutGoldenCase(
          isSelected ? 'Selected, no label' : 'Unselected, no label',
          item(ImpaktfullUiBottomNavigationItem(
            asset: testAsset,
            title: 'Label',
            showTitle: false,
            isSelected: isSelected,
            onTap: () {},
          )),
        ),
      ],
      layoutGoldenCase(
        'Custom badge color',
        item(const ImpaktfullUiBottomNavigationItem(
          asset: testAsset,
          title: 'Label',
          isSelected: false,
          badgeShow: true,
          badgeColor: Colors.green,
        )),
      ),
    ],
  );
}
