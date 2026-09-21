import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  Widget screen({bool withNavBar = true}) => ImpaktfullUiAdaptiveScreen(
        title: withNavBar ? 'Title' : null,
        subtitle: withNavBar ? 'Subtitle' : null,
        badge: withNavBar ? 'Beta' : null,
        onBackTapped: withNavBar ? () {} : null,
        actions: [
          if (withNavBar)
            ImpaktfullUiAdaptiveNavBarActionItem(
              title: 'Add',
              asset: testAsset,
              onTap: () {},
            ),
        ],
        fab: ImpaktfullUiFloatingActionButton(asset: testAsset, onTap: () {}),
        builder: (context) => const Center(child: Text('small builder')),
        mediumBuilder: (context) => const Center(child: Text('medium builder')),
        largeBuilder: (context) => const Center(child: Text('large builder')),
      );

  runComponentTest(
    fileName: 'impaktfull_ui_adaptive_screen',
    goldenTests: () => [
      for (final entry in {
        'small': smallScreenSize,
        'medium': mediumScreenSize,
        'large': largeScreenSize,
      }.entries) ...[
        layoutGoldenCase(
          'Nav bar and fab (${entry.key})',
          screen(),
          size: Size(entry.value.width, 300),
        ),
      ],
      layoutGoldenCase(
        'Without nav bar (small)',
        screen(withNavBar: false),
        size: Size(smallScreenSize.width, 300),
      ),
    ],
  );
}
