import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_data_display_golden_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_table_header',
    goldenTests: () => [
      GoldenTest(
        description: 'equal columns',
        child: goldenBox(
          width: 480,
          child: const ImpaktfullUiTableHeader(
            titles: [
              ImpaktfullUiTableHeaderItem(title: 'Name'),
              ImpaktfullUiTableHeaderItem(title: 'Email'),
              ImpaktfullUiTableHeaderItem(title: 'Status'),
            ],
          ),
        ),
      ),
      GoldenTest(
        description: 'column config, checkbox and sorting',
        child: goldenBox(
          width: 480,
          child: ImpaktfullUiTableHeader(
            columnConfig: const [
              ImpaktfullUiTableColumnConfig.fixedSize(size: 64),
              ImpaktfullUiTableColumnConfig(flex: 3),
              ImpaktfullUiTableColumnConfig.size(minWidth: 80, maxWidth: 120),
            ],
            titles: [
              ImpaktfullUiTableHeaderItem.checkbox(
                isSelected: true,
                onChanged: (_) {},
              ),
              ImpaktfullUiTableHeaderItem(
                title: 'Name',
                ascending: false,
                onTap: () {},
              ),
              const ImpaktfullUiTableHeaderItem(title: 'Status'),
            ],
          ),
        ),
      ),
    ],
  );
}
