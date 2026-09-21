import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  Widget masterDetail({required bool hasDetail}) => ImpaktfullUiMasterDetail(
        title: 'Master',
        actions: [
          ImpaktfullUiAdaptiveNavBarActionItem(
            title: 'Add',
            asset: testAsset,
            onTap: () {},
          ),
        ],
        onCloseDetail: () {},
        emptyDetail: const Center(child: Text('Select an item')),
        navigation: ImpaktfullUiSeparatedColumn(
          children: [
            for (var i = 0; i < 3; i++)
              ImpaktfullUiListItem(title: 'Item $i', onTap: () {}),
          ],
        ),
        detail: (context) {
          if (!hasDetail) return null;
          return const ImpaktfullUiMasterDetailItemScreen(
            title: 'Item 1',
            subtitle: 'Detail',
            child: Center(child: Text('Detail of item 1')),
          );
        },
      );

  runComponentTest(
    fileName: 'impaktfull_ui_master_detail',
    columns: 2,
    goldenTests: () => [
      for (final hasDetail in [false, true]) ...[
        layoutGoldenCase(
          'Small, ${hasDetail ? 'detail open' : 'no detail'}',
          masterDetail(hasDetail: hasDetail),
          size: const Size(400, 300),
        ),
      ],
      for (final hasDetail in [false, true]) ...[
        layoutGoldenCase(
          'Large, ${hasDetail ? 'detail open' : 'no detail'}',
          masterDetail(hasDetail: hasDetail),
          size: Size(largeScreenSize.width, 300),
        ),
      ],
    ],
  );
}
