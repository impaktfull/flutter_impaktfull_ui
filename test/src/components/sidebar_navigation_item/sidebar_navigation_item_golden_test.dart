import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_sidebar_navigation_item',
    columns: 3,
    goldenTests: () => [
      layoutGoldenCase(
        'Unselected',
        ImpaktfullUiSidebarNavigationItem(title: 'Item', onTap: () {}),
        width: 250,
      ),
      layoutGoldenCase(
        'Selected',
        ImpaktfullUiSidebarNavigationItem(
          title: 'Item',
          isSelected: true,
          onTap: () {},
        ),
        width: 250,
      ),
      layoutGoldenCase(
        'Leading asset',
        ImpaktfullUiSidebarNavigationItem(
          title: 'Item',
          leading: testAsset,
          onTap: () {},
        ),
        width: 250,
      ),
      layoutGoldenCase(
        'Collapsed group',
        ImpaktfullUiSidebarNavigationItem(
          title: 'Group',
          leading: testAsset,
          items: [
            ImpaktfullUiSidebarNavigationItem(title: 'Sub item', onTap: () {}),
          ],
        ),
        width: 250,
      ),
      layoutGoldenCase(
        'Expanded group (selected sub item)',
        ImpaktfullUiSidebarNavigationItem(
          title: 'Group',
          leading: testAsset,
          items: [
            ImpaktfullUiSidebarNavigationItem(
              title: 'Sub item 1',
              isSelected: true,
              onTap: () {},
            ),
            ImpaktfullUiSidebarNavigationItem(
              title: 'Sub item 2',
              onTap: () {},
            ),
          ],
        ),
        width: 250,
      ),
    ],
  );
}
