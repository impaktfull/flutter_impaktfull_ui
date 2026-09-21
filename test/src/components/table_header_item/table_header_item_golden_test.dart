import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_data_display_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_table_header_item',
    columns: 3,
    goldenTests: () => [
      GoldenTest(
        description: 'title',
        child: goldenBox(
          width: 200,
          child: const ImpaktfullUiTableHeaderItem(title: 'Title'),
        ),
      ),
      GoldenTest(
        description: 'ascending',
        child: goldenBox(
          width: 200,
          child: ImpaktfullUiTableHeaderItem(
            title: 'Title',
            ascending: true,
            onTap: () {},
          ),
        ),
      ),
      GoldenTest(
        description: 'descending',
        child: goldenBox(
          width: 200,
          child: ImpaktfullUiTableHeaderItem(
            title: 'Title',
            ascending: false,
            onTap: () {},
          ),
        ),
      ),
      for (final isSelected in [false, true, null])
        GoldenTest(
          description: 'checkbox $isSelected',
          child: goldenBox(
            width: 200,
            child: ImpaktfullUiTableHeaderItem.checkbox(
              isSelected: isSelected,
              onChanged: (_) {},
            ),
          ),
        ),
      GoldenTest(
        description: 'checkbox with title',
        child: goldenBox(
          width: 200,
          child: ImpaktfullUiTableHeaderItem.checkbox(
            title: 'Title',
            isSelected: true,
            onChanged: (_) {},
          ),
        ),
      ),
      GoldenTest(
        description: 'empty',
        child: goldenBox(
          width: 200,
          child: const ImpaktfullUiTableHeaderItem(),
        ),
      ),
      GoldenTest(
        description: 'long title',
        child: goldenBox(
          width: 200,
          child: const ImpaktfullUiTableHeaderItem(title: longText),
        ),
      ),
    ],
  );
}
