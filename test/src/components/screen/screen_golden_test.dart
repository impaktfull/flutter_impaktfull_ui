import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  const content = Center(child: Text('content'));
  const size = Size(320, 400);

  runComponentTest(
    fileName: 'impaktfull_ui_screen',
    columns: 3,
    goldenTests: () => [
      layoutGoldenCase(
        'Without nav bar',
        const ImpaktfullUiScreen(child: content),
        size: size,
      ),
      layoutGoldenCase(
        'Title and subtitle',
        const ImpaktfullUiScreen(
          title: 'Title',
          subtitle: 'Subtitle',
          child: content,
        ),
        size: size,
      ),
      layoutGoldenCase(
        'Back and actions',
        ImpaktfullUiScreen(
          title: 'Title',
          onBackTapped: () {},
          actions: [
            ImpaktfullUiIconButton(onTap: () {}, asset: testAsset),
          ],
          child: content,
        ),
        size: size,
      ),
      layoutGoldenCase(
        'Drawer',
        const ImpaktfullUiScreen(
          title: 'Title',
          drawer: SizedBox(width: 200, child: Text('drawer')),
          child: content,
        ),
        size: size,
      ),
      layoutGoldenCase(
        'Fab and bottom child',
        ImpaktfullUiScreen(
          title: 'Title',
          fab: ImpaktfullUiFloatingActionButton(
            onTap: () {},
            asset: testAsset,
          ),
          bottomChild: ImpaktfullUiBottomActions(
            children: [
              ImpaktfullUiButton(
                type: ImpaktfullUiButtonType.primary,
                title: 'Continue',
                onTap: () {},
              ),
            ],
          ),
          child: content,
        ),
        size: size,
      ),
      layoutGoldenCase(
        'Centered title, full screen',
        ImpaktfullUiScreen(
          title: 'Title',
          centerTitle: true,
          isFullScreen: true,
          onBackTapped: () {},
          child: content,
        ),
        size: size,
      ),
    ],
  );
}
