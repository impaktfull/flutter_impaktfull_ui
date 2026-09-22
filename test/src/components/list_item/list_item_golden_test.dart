import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_data_display_golden_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_list_item',
    columns: 2,
    goldenTests: () => [
      for (final type in ImpaktfullUiListItemType.values) ...[
        GoldenTest(
          description: '${type.name} title',
          child: goldenBox(
            child: ImpaktfullUiListItem(
              type: type,
              title: 'Title',
            ),
          ),
        ),
        GoldenTest(
          description: '${type.name} title + subtitle',
          child: goldenBox(
            child: ImpaktfullUiListItem(
              type: type,
              title: 'Title',
              subtitle: 'Subtitle',
            ),
          ),
        ),
        GoldenTest(
          description: '${type.name} leading + trailing',
          child: goldenBox(
            child: ImpaktfullUiListItem(
              type: type,
              title: 'Title',
              subtitle: 'Subtitle',
              leading: testIcon,
              trailing: testIcon2,
            ),
          ),
        ),
        GoldenTest(
          description: '${type.name} clickable (chevron)',
          child: goldenBox(
            child: ImpaktfullUiListItem(
              type: type,
              title: 'Title',
              leading: testIcon,
              onTap: () {},
            ),
          ),
        ),
      ],
    ],
  );

  runComponentTest(
    fileName: 'impaktfull_ui_list_item_long_text',
    goldenTests: () => [
      GoldenTest(
        description: 'long title and subtitle',
        child: goldenBox(
          child: ImpaktfullUiListItem(
            title: longText,
            subtitle: longText,
            leading: testIcon,
            onTap: () {},
          ),
        ),
      ),
    ],
  );
}
