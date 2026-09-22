import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_horizontal_tab',
    columns: 4,
    goldenTests: () => [
      for (final isSelected in [true, false]) ...[
        layoutGoldenCase(
          isSelected ? 'Selected' : 'Unselected',
          ImpaktfullUiHorizontalTab(
            title: 'Tab',
            isSelected: isSelected,
            onTap: () {},
          ),
        ),
        layoutGoldenCase(
          isSelected ? 'Selected, badge' : 'Unselected, badge',
          ImpaktfullUiHorizontalTab(
            title: 'Tab',
            badge: '3',
            isSelected: isSelected,
            onTap: () {},
          ),
        ),
        for (final badgeType in [
          ImpaktfullUiBadgeType.error,
          ImpaktfullUiBadgeType.neutral,
        ])
          layoutGoldenCase(
            '${isSelected ? 'Selected' : 'Unselected'}, ${badgeType.name}',
            ImpaktfullUiHorizontalTab(
              title: 'Tab',
              badge: '3',
              badgeType: badgeType,
              isSelected: isSelected,
              onTap: () {},
            ),
          ),
      ],
    ],
  );
}
