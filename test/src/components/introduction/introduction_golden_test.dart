import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  final icons = ImpaktfullUiTheme.getDefault().assets.icons;
  const size = Size(360, 480);

  List<ImpaktfullUiIntroductionPage> pages() => [
        ImpaktfullUiIntroductionPage(
          title: 'Welcome',
          subtitle: 'Everything you need to build your app, in one library.',
          asset: icons.home,
        ),
        ImpaktfullUiIntroductionPage(
          title: 'Stay in control',
          subtitle: 'Change every component with a theme.',
          asset: icons.edit,
        ),
        const ImpaktfullUiIntroductionPage(
          title: 'Ready?',
          subtitle: 'Let us get started.',
          child: Text('A custom child'),
        ),
      ];

  runComponentTest(
    fileName: 'impaktfull_ui_introduction',
    columns: 3,
    goldenTests: () => [
      layoutGoldenCase(
        'First page with skip and next',
        ImpaktfullUiIntroduction(
          pages: pages(),
          onSkip: () {},
          onDone: () {},
        ),
        size: size,
      ),
      layoutGoldenCase(
        'Without skip',
        ImpaktfullUiIntroduction(
          pages: pages(),
          initialIndex: 1,
          onDone: () {},
        ),
        size: size,
      ),
      layoutGoldenCase(
        'Last page with done',
        ImpaktfullUiIntroduction(
          pages: pages(),
          initialIndex: 2,
          onSkip: () {},
          onDone: () {},
        ),
        size: size,
      ),
    ],
  );

  runComponentTest(
    fileName: 'impaktfull_ui_introduction_empty',
    goldenTests: () => [
      layoutGoldenCase(
        'Without pages',
        const SizedBox(
          width: 200,
          height: 50,
          child: ImpaktfullUiIntroduction(),
        ),
      ),
    ],
  );
}
