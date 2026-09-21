import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  final action = ImpaktfullUiIconButton(
    onTap: () {},
    asset: testAsset,
    tooltip: 'Action',
  );

  runComponentTest(
    fileName: 'impaktfull_ui_nav_bar',
    columns: 2,
    goldenTests: () => [
      layoutGoldenCase(
        'Title',
        const ImpaktfullUiNavBar(title: 'Title'),
        width: 400,
      ),
      layoutGoldenCase(
        'Title and subtitle',
        const ImpaktfullUiNavBar(title: 'Title', subtitle: 'Subtitle'),
        width: 400,
      ),
      layoutGoldenCase(
        'Badge',
        const ImpaktfullUiNavBar(title: 'Title', badge: 'Beta'),
        width: 400,
      ),
      layoutGoldenCase(
        'Back and actions',
        ImpaktfullUiNavBar(
          title: 'Title',
          onBackTapped: () {},
          actions: [action, action],
        ),
        width: 400,
      ),
      layoutGoldenCase(
        'Centered title',
        ImpaktfullUiNavBar(
          title: 'Title',
          subtitle: 'Subtitle',
          centerTitle: true,
          onBackTapped: () {},
          actions: [action],
        ),
        width: 400,
      ),
      layoutGoldenCase(
        'Full screen (close button)',
        ImpaktfullUiNavBar(
          title: 'Title',
          isFullScreen: true,
          onBackTapped: () {},
        ),
        width: 400,
      ),
      layoutGoldenCase(
        'Drawer',
        ImpaktfullUiNavBar(
          title: 'Title',
          onDrawerTapped: () {},
        ),
        width: 400,
      ),
      layoutGoldenCase(
        'Bottom child',
        const ImpaktfullUiNavBar(
          title: 'Title',
          bottomChild: SizedBox(
            height: 40,
            child: Center(child: Text('bottom child')),
          ),
        ),
        width: 400,
      ),
      layoutGoldenCase(
        'No title',
        ImpaktfullUiNavBar(onBackTapped: () {}),
        width: 400,
      ),
    ],
  );
}
