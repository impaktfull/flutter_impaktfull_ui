import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_data_display_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_selectable_list_item',
    columns: 2,
    goldenTests: () => [
      for (final isSelected in [false, true]) ...[
        GoldenTest(
          description: 'selected: $isSelected',
          child: goldenBox(
            child: ImpaktfullUiSelectableListItem(
              title: 'Title',
              isSelected: isSelected,
              onChanged: (_) {},
            ),
          ),
        ),
        GoldenTest(
          description: 'selected: $isSelected, subtitle + leading',
          child: goldenBox(
            child: ImpaktfullUiSelectableListItem(
              title: 'Title',
              subtitle: 'Subtitle',
              leading: testIcon,
              isSelected: isSelected,
              onChanged: (_) {},
            ),
          ),
        ),
        GoldenTest(
          description: 'selected: $isSelected, custom trailing',
          child: goldenBox(
            child: ImpaktfullUiSelectableListItem(
              title: 'Title',
              isSelected: isSelected,
              trailingBuilder: (context, isSelected) => Container(
                width: 16,
                height: 16,
                color: isSelected ? Colors.green : Colors.grey,
              ),
              onChanged: (_) {},
            ),
          ),
        ),
        GoldenTest(
          description: 'selected: $isSelected, disabled',
          child: goldenBox(
            child: ImpaktfullUiSelectableListItem(
              title: 'Disabled',
              isSelected: isSelected,
            ),
          ),
        ),
      ],
    ],
  );

  runComponentTest(
    fileName: 'impaktfull_ui_selectable_list_item_long_text',
    goldenTests: () => [
      GoldenTest(
        description: 'long title and subtitle',
        child: goldenBox(
          child: ImpaktfullUiSelectableListItem(
            title: longText,
            subtitle: longText,
            leading: testIcon,
            isSelected: true,
            onChanged: (_) {},
          ),
        ),
      ),
    ],
  );
}
