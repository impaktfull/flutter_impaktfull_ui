import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  List<Widget> items({required int selected, bool showLabel = true}) => [
        for (var i = 0; i < 4; i++)
          ImpaktfullUiBottomNavigationItem(
            asset: testAsset,
            selectedAsset: testSelectedAsset,
            title: 'Item $i',
            showTitle: showLabel,
            isSelected: i == selected,
            badgeShow: i == 2,
            badgeText: i == 3 ? '3' : null,
            onTap: () {},
          ),
      ];

  runComponentTest(
    fileName: 'impaktfull_ui_bottom_navigation',
    goldenTests: () => [
      layoutGoldenCase(
        'First item selected, with badges',
        ImpaktfullUiBottomNavigation(items: items(selected: 0)),
        width: 400,
      ),
      layoutGoldenCase(
        'Last item selected',
        ImpaktfullUiBottomNavigation(items: items(selected: 3)),
        width: 400,
      ),
      layoutGoldenCase(
        'Without labels',
        ImpaktfullUiBottomNavigation(
          items: items(selected: 1, showLabel: false),
        ),
        width: 400,
      ),
    ],
  );
}
