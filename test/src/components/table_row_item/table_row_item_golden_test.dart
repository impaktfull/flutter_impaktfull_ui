import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_data_display_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_table_row_item',
    columns: 3,
    goldenTests: () => [
      GoldenTest(
        description: 'text',
        child: goldenBox(
          width: 200,
          child: const ImpaktfullUiTableRowItem.text(title: 'Title'),
        ),
      ),
      GoldenTest(
        description: 'text + subtitle',
        child: goldenBox(
          width: 200,
          child: const ImpaktfullUiTableRowItem.text(
            title: 'Title',
            subtitle: 'Subtitle',
          ),
        ),
      ),
      GoldenTest(
        description: 'long text (ellipsis)',
        child: goldenBox(
          width: 200,
          child: const ImpaktfullUiTableRowItem.text(
            title: longText,
            subtitle: longText,
          ),
        ),
      ),
      for (final isSelected in [false, true])
        GoldenTest(
          description: 'checkbox $isSelected',
          child: goldenBox(
            width: 200,
            child: ImpaktfullUiTableRowItem.checkbox(
              title: 'Title',
              isSelected: isSelected,
              onChanged: (_) {},
            ),
          ),
        ),
      GoldenTest(
        description: 'custom',
        child: goldenBox(
          width: 200,
          child: ImpaktfullUiTableRowItem.custom(
            builder: (context, theme) => Container(
              height: 24,
              color: Colors.orange,
            ),
          ),
        ),
      ),
      for (final type in ImpaktfullUiBadgeType.values)
        GoldenTest(
          description: 'badge ${type.name}',
          child: goldenBox(
            width: 200,
            child: ImpaktfullUiTableRowItem.badge(
              title: type.name,
              badgeType: type,
            ),
          ),
        ),
      GoldenTest(
        description: 'badge without a title',
        child: goldenBox(
          width: 200,
          child: const ImpaktfullUiTableRowItem.badge(title: null),
        ),
      ),
    ],
  );
}
