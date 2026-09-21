import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_data_display_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  const columnConfig = [
    ImpaktfullUiTableColumnConfig.fixedSize(size: 64),
    ImpaktfullUiTableColumnConfig(flex: 2),
    ImpaktfullUiTableColumnConfig(flex: 1),
  ];

  List<ImpaktfullUiTableHeaderItem> titles() => [
        ImpaktfullUiTableHeaderItem.checkbox(
          isSelected: null,
          onChanged: (_) {},
        ),
        ImpaktfullUiTableHeaderItem(
          title: 'Name',
          ascending: true,
          onTap: () {},
        ),
        const ImpaktfullUiTableHeaderItem(title: 'Status'),
      ];

  final people = [
    ('Jane Doe', 'jane@example.com', 'Active', ImpaktfullUiBadgeType.success),
    ('John Doe', 'john@example.com', 'Pending', ImpaktfullUiBadgeType.warning),
    ('Max Power', longText, 'Blocked', ImpaktfullUiBadgeType.error),
  ];

  List<ImpaktfullUiTableRow> rows() => [
        for (final (index, (name, email, status, badgeType)) in people.indexed)
          ImpaktfullUiTableRow(
            columnConfig: columnConfig,
            onTap: () {},
            columns: [
              ImpaktfullUiTableRowItem.checkbox(
                isSelected: index.isEven,
                onChanged: (_) {},
              ),
              ImpaktfullUiTableRowItem.text(
                title: name,
                subtitle: email,
              ),
              ImpaktfullUiTableRowItem.badge(
                title: status,
                badgeType: badgeType,
              ),
            ],
          ),
      ];

  runComponentTest(
    fileName: 'impaktfull_ui_table',
    goldenTests: () => [
      GoldenTest(
        description: 'header and rows',
        child: goldenBox(
          width: 840,
          height: 280,
          child: ImpaktfullUiTable(
            columnConfig: columnConfig,
            titles: titles(),
            content: rows(),
          ),
        ),
      ),
      GoldenTest(
        description: 'shrinkWrap',
        child: goldenBox(
          width: 840,
          child: ImpaktfullUiTable(
            shrinkWrap: true,
            columnConfig: columnConfig,
            titles: titles(),
            content: rows(),
          ),
        ),
      ),
      GoldenTest(
        description: 'empty',
        child: goldenBox(
          width: 840,
          child: ImpaktfullUiTable(
            shrinkWrap: true,
            columnConfig: columnConfig,
            titles: titles(),
            content: const [],
          ),
        ),
      ),
    ],
  );

  runComponentTest(
    fileName: 'impaktfull_ui_table_horizontal_scroll',
    goldenTests: () => [
      GoldenTest(
        description: 'narrower than the min width: scrolls horizontally',
        child: goldenBox(
          width: 400,
          height: 200,
          child: ImpaktfullUiTable(
            titles: const [
              ImpaktfullUiTableHeaderItem(title: 'Column 1'),
              ImpaktfullUiTableHeaderItem(title: 'Column 2'),
            ],
            content: [
              ImpaktfullUiTableRow(
                columns: const [
                  ImpaktfullUiTableRowItem.text(title: 'Cell 1'),
                  ImpaktfullUiTableRowItem.text(title: 'Cell 2'),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );

  runComponentTest(
    fileName: 'impaktfull_ui_table_loading',
    goldenTests: () => [
      GoldenTest(
        description: 'loading',
        child: frozen(
          goldenBox(
            width: 840,
            height: 200,
            child: ImpaktfullUiTable(
              isLoading: true,
              columnConfig: columnConfig,
              titles: titles(),
              content: rows(),
            ),
          ),
        ),
      ),
    ],
  );
}
