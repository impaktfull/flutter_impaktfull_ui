import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  ImpaktfullUiHorizontalTabs<int> tabs(int selected) =>
      ImpaktfullUiHorizontalTabs<int>(
        selectedValue: selected,
        onTabSelected: (_) {},
        tabs: [
          ImpaktfullUiHorizontalTabConfig(label: 'Overview', value: 0),
          ImpaktfullUiHorizontalTabConfig(
            label: 'Inbox',
            value: 1,
            badge: '12',
          ),
          ImpaktfullUiHorizontalTabConfig(
            label: 'Errors',
            value: 2,
            badge: '3',
            badgeType: ImpaktfullUiBadgeType.error,
          ),
        ],
      );

  runComponentTest(
    fileName: 'impaktfull_ui_horizontal_tabs',
    goldenTests: () => [
      layoutGoldenCase('First tab selected', tabs(0), width: 400),
      layoutGoldenCase('Badge tab selected', tabs(1), width: 400),
      layoutGoldenCase('Nothing selected', tabs(-1), width: 400),
      layoutGoldenCase('Overflowing (scrolls)', tabs(2), width: 250),
    ],
  );
}
