import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_data_display_golden_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  const placeholderData = ImpaktfullUiListViewPlaceholderData(
    title: 'No items',
    subtitle: 'There is nothing to show yet',
  );
  final items = [for (var i = 1; i <= 4; i++) i];

  Widget item(BuildContext context, int item, int index) =>
      ImpaktfullUiSimpleListItem(title: 'Item $item');

  Widget tile(BuildContext context, int item, int index) => Container(
        height: 40,
        alignment: Alignment.center,
        color: Colors.blue.shade100,
        child: Text('$item'),
      );

  runComponentTest(
    fileName: 'impaktfull_ui_list_view',
    columns: 3,
    goldenTests: () => [
      GoldenTest(
        description: 'builder',
        child: goldenBox(
          width: 240,
          height: 260,
          child: ImpaktfullUiListView<int>.builder(
            items: items,
            itemBuilder: item,
            placeholderData: placeholderData,
          ),
        ),
      ),
      GoldenTest(
        description: 'builder with spacing',
        child: goldenBox(
          width: 240,
          height: 260,
          child: ImpaktfullUiListView<int>.builder(
            items: items,
            spacing: 8,
            itemBuilder: tile,
            placeholderData: placeholderData,
          ),
        ),
      ),
      GoldenTest(
        description: 'separated (default divider)',
        child: goldenBox(
          width: 240,
          height: 260,
          child: ImpaktfullUiListView<int>.separated(
            items: items,
            itemBuilder: item,
            placeholderData: placeholderData,
          ),
        ),
      ),
      GoldenTest(
        description: 'separated (custom separator)',
        child: goldenBox(
          width: 240,
          height: 260,
          child: ImpaktfullUiListView<int>.separated(
            items: items,
            itemBuilder: item,
            separatorBuilder: (context, item, index) =>
                Container(height: 4, color: Colors.red),
            placeholderData: placeholderData,
          ),
        ),
      ),
      GoldenTest(
        description: 'itemsPerRow: 2 with leading and trailing',
        child: goldenBox(
          width: 240,
          height: 260,
          child: ImpaktfullUiListView<int>.builder(
            items: const [1, 2, 3, 4, 5],
            itemsPerRow: 2,
            spacing: 8,
            itemBuilder: tile,
            leadingBuilder: (context) => const Text('Leading'),
            trailingBuilder: (context) => const Text('Trailing'),
            placeholderData: placeholderData,
          ),
        ),
      ),
      GoldenTest(
        description: 'children',
        child: goldenBox(
          width: 240,
          height: 260,
          child: const ImpaktfullUiListView(
            spacing: 8,
            children: [
              Text('Child 1'),
              Text('Child 2'),
              Text('Child 3'),
            ],
          ),
        ),
      ),
      GoldenTest(
        description: 'horizontal',
        child: goldenBox(
          width: 240,
          height: 80,
          child: ImpaktfullUiListView<int>.builder(
            items: items,
            spacing: 8,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, item, index) => Container(
              width: 48,
              alignment: Alignment.center,
              color: Colors.blue.shade100,
              child: Text('$item'),
            ),
            placeholderData: placeholderData,
          ),
        ),
      ),
      GoldenTest(
        description: 'reversed',
        child: goldenBox(
          width: 240,
          height: 260,
          child: ImpaktfullUiListView<int>.builder(
            items: items,
            reversed: true,
            itemBuilder: item,
            placeholderData: placeholderData,
          ),
        ),
      ),
    ],
  );

  runComponentTest(
    fileName: 'impaktfull_ui_list_view_states',
    columns: 3,
    goldenTests: () => [
      GoldenTest(
        description: 'loading',
        child: frozen(
          goldenBox(
            width: 240,
            height: 440,
            child: ImpaktfullUiListView<int>.builder(
              items: items,
              isLoading: true,
              itemBuilder: item,
              placeholderData: placeholderData,
            ),
          ),
        ),
      ),
      GoldenTest(
        description: 'empty',
        child: goldenBox(
          width: 240,
          height: 440,
          child: ImpaktfullUiListView<int>.builder(
            items: const [],
            itemBuilder: item,
            placeholderData: placeholderData,
          ),
        ),
      ),
      GoldenTest(
        description: 'empty with refresh',
        child: goldenBox(
          width: 240,
          height: 440,
          child: ImpaktfullUiListView<int>.builder(
            items: const [],
            itemBuilder: item,
            onRefresh: () async {},
            placeholderData: placeholderData,
          ),
        ),
      ),
      GoldenTest(
        description: 'empty with a custom asset and action',
        child: goldenBox(
          width: 240,
          height: 440,
          child: ImpaktfullUiListView<int>.builder(
            items: const [],
            itemBuilder: item,
            placeholderData: ImpaktfullUiListViewPlaceholderData(
              title: 'Custom',
              asset: testIcon,
              actions: [
                ImpaktfullUiButton(
                  type: ImpaktfullUiButtonType.primary,
                  title: 'Add',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      GoldenTest(
        description: 'empty with a long text',
        child: goldenBox(
          width: 240,
          height: 440,
          child: ImpaktfullUiListView<int>.builder(
            items: const [],
            itemBuilder: item,
            placeholderData: const ImpaktfullUiListViewPlaceholderData(
              title: longText,
              subtitle: longText,
            ),
          ),
        ),
      ),
    ],
  );
}
