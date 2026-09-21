import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  List<Widget> items() => [
        ImpaktfullUiSidebarNavigationItem(
          leading: testAsset,
          title: 'Home',
          isSelected: true,
          onTap: () {},
        ),
        ImpaktfullUiSidebarNavigationItem(
          leading: testAsset,
          title: 'Settings',
          onTap: () {},
        ),
        ImpaktfullUiSidebarNavigationItem(
          leading: testAsset,
          title: 'Group',
          items: [
            ImpaktfullUiSidebarNavigationItem(title: 'Sub item', onTap: () {}),
          ],
        ),
      ];

  const header = Text('Header');

  runComponentTest(
    fileName: 'impaktfull_ui_sidebar_navigation',
    columns: 3,
    goldenTests: () => [
      layoutGoldenCase(
        'Items',
        ImpaktfullUiSidebarNavigation(width: 280, items: items()),
        size: const Size(280, 400),
      ),
      layoutGoldenCase(
        'Header, items and footer',
        ImpaktfullUiSidebarNavigation(
          width: 280,
          header: header,
          items: items(),
          footerItems: [
            ImpaktfullUiSidebarNavigationItem(title: 'Help', onTap: () {}),
          ],
          footer: const Text('Footer'),
        ),
        size: const Size(280, 400),
      ),
      layoutGoldenCase(
        'Secondary items',
        ImpaktfullUiSidebarNavigation(
          width: 280,
          items: items(),
          secondaryItems: [
            ImpaktfullUiSidebarNavigationItem(
              title: 'Secondary',
              isSelected: true,
              onTap: () {},
            ),
          ],
        ),
        size: const Size(581, 400),
      ),
    ],
  );
}
