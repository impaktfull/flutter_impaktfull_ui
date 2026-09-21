import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_layout_test_helpers.dart';

void main() {
  setUp(() => setupComponentTest());

  List<Widget> items() => [
        for (var i = 0; i < 3; i++)
          ImpaktfullUiListItem(title: 'Item $i', onTap: () {}),
      ];

  runComponentTest(
    fileName: 'impaktfull_ui_separated_column',
    columns: 2,
    goldenTests: () => [
      layoutGoldenCase(
        'Without title',
        ImpaktfullUiSeparatedColumn(children: items()),
        width: 300,
      ),
      layoutGoldenCase(
        'With title',
        ImpaktfullUiSeparatedColumn(title: 'Title', children: items()),
        width: 300,
      ),
      layoutGoldenCase(
        'First and last divider',
        ImpaktfullUiSeparatedColumn(
          showFirstDivider: true,
          showLastDivider: true,
          children: items(),
        ),
        width: 300,
      ),
      layoutGoldenCase(
        'Custom margins',
        ImpaktfullUiSeparatedColumn(
          title: 'Title',
          titleMargin: EdgeInsets.zero,
          separatorMargin: EdgeInsets.zero,
          children: items(),
        ),
        width: 300,
      ),
      layoutGoldenCase(
        'Empty',
        const ImpaktfullUiSeparatedColumn(title: 'Title', children: []),
        width: 300,
      ),
    ],
  );
}
