import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../_layout_test_helpers.dart';

void main() {
  Widget row({
    int count = 4,
    double horizontalSpacing = 0,
    double verticalSpacing = 0,
    int maxColumns = 1,
    int? mediumMaxColumns,
    int? largeMaxColumns,
    int? extraLargeMaxColumns,
  }) =>
      Align(
        alignment: Alignment.topLeft,
        child: ImpaktfullUiResponsiveRow(
          horizontalSpacing: horizontalSpacing,
          verticalSpacing: verticalSpacing,
          maxColumns: maxColumns,
          mediumMaxColumns: mediumMaxColumns,
          largeMaxColumns: largeMaxColumns,
          extraLargeMaxColumns: extraLargeMaxColumns,
          children: [
            for (var i = 0; i < count; i++)
              SizedBox(height: 20, key: Key('$i')),
          ],
        ),
      );

  Rect rect(WidgetTester tester, int index) =>
      tester.getRect(find.byKey(Key('$index')));

  /// The amount of distinct rows the children are in.
  int rowCount(WidgetTester tester, int count) =>
      {for (var i = 0; i < count; i++) rect(tester, i).top}.length;

  testWidgets('spaces the columns and rows', (tester) async {
    await pumpLayoutApp(
      tester,
      row(maxColumns: 2, horizontalSpacing: 10, verticalSpacing: 20),
    );
    // (400 - 10) / 2 = 195
    expect(rect(tester, 0), const Rect.fromLTWH(0, 0, 195, 20));
    expect(rect(tester, 1), const Rect.fromLTWH(205, 0, 195, 20));
    expect(rect(tester, 2), const Rect.fromLTWH(0, 40, 195, 20));
    expect(rect(tester, 3), const Rect.fromLTWH(205, 40, 195, 20));
  });

  final columnCases = <Size, int>{
    smallScreenSize: 1,
    mediumScreenSize: 2,
    largeScreenSize: 3,
    const Size(2000, 800): 4,
  };
  for (final entry in columnCases.entries) {
    testWidgets('${entry.value} columns at width ${entry.key.width}',
        (tester) async {
      await pumpLayoutApp(
        tester,
        row(
          count: 12,
          maxColumns: 1,
          mediumMaxColumns: 2,
          largeMaxColumns: 3,
          extraLargeMaxColumns: 4,
        ),
        size: entry.key,
      );
      expect(rowCount(tester, 12), 12 ~/ entry.value);
      expect(rect(tester, 0).width, entry.key.width / entry.value);
    });
  }

  testWidgets('bigger screens fall back to the smaller max columns',
      (tester) async {
    await pumpLayoutApp(
      tester,
      row(count: 6, maxColumns: 1, mediumMaxColumns: 3),
      size: const Size(2000, 800),
    );
    expect(rowCount(tester, 6), 2);
  });

  testWidgets('without responsive columns every width uses maxColumns',
      (tester) async {
    for (final size in [smallScreenSize, largeScreenSize]) {
      await pumpLayoutApp(tester, row(count: 6, maxColumns: 2), size: size);
      expect(rowCount(tester, 6), 3, reason: '$size');
    }
  });

  testWidgets('the last row is filled by its children', (tester) async {
    await pumpLayoutApp(
      tester,
      row(count: 3, maxColumns: 2),
    );
    // The children are Expanded: the last child takes the full row.
    expect(rect(tester, 2).width, smallScreenSize.width);
  });
}
