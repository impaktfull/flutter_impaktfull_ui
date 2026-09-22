import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_data_display_golden_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_table_row',
    goldenTests: () => [
      GoldenTest(
        description: 'equal columns',
        child: goldenBox(
          width: 480,
          child: ImpaktfullUiTableRow(
            onTap: () {},
            columns: const [
              ImpaktfullUiTableRowItem.text(title: 'Jane Doe'),
              ImpaktfullUiTableRowItem.text(
                title: 'jane@example.com',
                subtitle: 'Work',
              ),
              ImpaktfullUiTableRowItem.badge(title: 'Active'),
            ],
          ),
        ),
      ),
      GoldenTest(
        description: 'column config',
        child: goldenBox(
          width: 480,
          child: ImpaktfullUiTableRow(
            columnConfig: const [
              ImpaktfullUiTableColumnConfig.fixedSize(size: 64),
              ImpaktfullUiTableColumnConfig(flex: 3),
              ImpaktfullUiTableColumnConfig.size(minWidth: 80, maxWidth: 120),
            ],
            columns: [
              ImpaktfullUiTableRowItem.checkbox(
                isSelected: true,
                onChanged: (_) {},
              ),
              const ImpaktfullUiTableRowItem.text(title: longText),
              const ImpaktfullUiTableRowItem.badge(
                title: 'Error',
                badgeType: ImpaktfullUiBadgeType.error,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
