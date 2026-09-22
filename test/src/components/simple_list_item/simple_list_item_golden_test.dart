import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';
import '../_data_display_golden_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  runComponentTest(
    fileName: 'impaktfull_ui_simple_list_item',
    columns: 2,
    goldenTests: () => [
      for (final type in ImpaktfullUiSimpleListItemType.values) ...[
        GoldenTest(
          description: '${type.name} title',
          child: goldenBox(
            child: ImpaktfullUiSimpleListItem(
              type: type,
              title: 'Title',
            ),
          ),
        ),
        GoldenTest(
          description: '${type.name} subtitle, leading and trailing',
          child: goldenBox(
            child: ImpaktfullUiSimpleListItem(
              type: type,
              title: 'Title',
              subtitle: 'Subtitle',
              // Asset widgets without a color get the color of the title.
              leadingWidgetBuilder: (context) =>
                  ImpaktfullUiAssetWidget(asset: testIcon),
              trailingWidgetBuilder: (context) =>
                  ImpaktfullUiAssetWidget(asset: testIcon2),
            ),
          ),
        ),
        GoldenTest(
          description: '${type.name} custom center',
          child: goldenBox(
            child: ImpaktfullUiSimpleListItem(
              type: type,
              title: 'Not shown',
              centerWidgetBuilder: (context) => Container(
                height: 24,
                color: Colors.orange,
              ),
              trailingWidgetBuilder: (context) =>
                  ImpaktfullUiAssetWidget(asset: testIcon2),
            ),
          ),
        ),
      ],
    ],
  );

  runComponentTest(
    fileName: 'impaktfull_ui_simple_list_item_long_text',
    goldenTests: () => [
      GoldenTest(
        description: 'long title and subtitle',
        child: goldenBox(
          child: ImpaktfullUiSimpleListItem(
            title: longText,
            subtitle: longText,
            leadingWidgetBuilder: (context) =>
                ImpaktfullUiAssetWidget(asset: testIcon),
          ),
        ),
      ),
      GoldenTest(
        description: 'custom padding',
        child: goldenBox(
          child: const ImpaktfullUiSimpleListItem(
            title: 'Custom padding',
            padding: EdgeInsets.all(32),
          ),
        ),
      ),
    ],
  );
}
