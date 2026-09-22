import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_pagination',
    columns: 2,
    goldenTests: () => [
      layoutGoldenCase(
        'First page',
        ImpaktfullUiPagination(
          page: 0,
          itemsPerPage: 10,
          amountOfItems: 45,
          onPageChanged: (_) {},
        ),
        width: 350,
      ),
      layoutGoldenCase(
        'Middle page',
        ImpaktfullUiPagination(
          page: 2,
          itemsPerPage: 10,
          amountOfItems: 45,
          onPageChanged: (_) {},
        ),
        width: 350,
      ),
      layoutGoldenCase(
        'Last page',
        ImpaktfullUiPagination.withAmountOfPages(
          page: 4,
          itemsPerPage: 10,
          amountOfPages: 5,
          onPageChanged: (_) {},
        ),
        width: 350,
      ),
      layoutGoldenCase(
        'No items',
        ImpaktfullUiPagination(
          page: 0,
          itemsPerPage: 10,
          amountOfItems: 0,
          onPageChanged: (_) {},
        ),
        width: 350,
      ),
    ],
  );
}
