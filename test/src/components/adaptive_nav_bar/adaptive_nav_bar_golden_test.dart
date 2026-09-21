import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  final actions = [
    ImpaktfullUiAdaptiveNavBarActionItem(
      title: 'Add',
      asset: testAsset,
      onTap: () {},
    ),
    ImpaktfullUiAdaptiveNavBarActionItem(
      title: 'Delete',
      asset: testAsset,
      type: ImpaktfullUiAdaptiveNavBarActionItemType.destructiveSecondary,
      onTap: () {},
    ),
  ];

  Widget navBar({bool withActions = true, bool withBottomChild = false}) =>
      Align(
        alignment: Alignment.topCenter,
        child: ImpaktfullUiAdaptiveNavBar(
          title: 'Title',
          subtitle: 'Subtitle',
          badge: 'Beta',
          onBackTapped: () {},
          actions: withActions ? actions : const [],
          bottomChild: withBottomChild
              ? ImpaktfullUiHorizontalTabs<int>(
                  selectedValue: 0,
                  onTabSelected: (_) {},
                  tabs: [
                    ImpaktfullUiHorizontalTabConfig(label: 'Tab 1', value: 0),
                    ImpaktfullUiHorizontalTabConfig(label: 'Tab 2', value: 1),
                  ],
                )
              : null,
        ),
      );

  runComponentTest(
    fileName: 'impaktfull_ui_adaptive_nav_bar',
    goldenTests: () => [
      for (final entry in {
        'small': smallScreenSize,
        'medium': mediumScreenSize,
        'large': largeScreenSize,
      }.entries) ...[
        layoutGoldenCase(
          'With actions (${entry.key})',
          navBar(),
          size: Size(entry.value.width, 140),
        ),
        layoutGoldenCase(
          'Without actions, with tabs (${entry.key})',
          navBar(withActions: false, withBottomChild: true),
          size: Size(entry.value.width, 160),
        ),
      ],
    ],
  );
}
