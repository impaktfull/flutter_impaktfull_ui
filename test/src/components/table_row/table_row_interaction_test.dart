import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../_data_display_test_helpers.dart';

void main() {
  Future<void> pumpRow(WidgetTester tester, Widget row) => pumpSized(
        tester,
        Align(
          alignment: Alignment.topLeft,
          child: SizedBox(width: 600, child: row),
        ),
        size: const Size(600, 400),
      );

  testWidgets('onTap is called when the row is tapped', (tester) async {
    var taps = 0;
    await pumpRow(
      tester,
      ImpaktfullUiTableRow(
        onTap: () => taps++,
        columns: const [
          ImpaktfullUiTableRowItem.badge(title: 'Badge'),
          ImpaktfullUiTableRowItem.custom(builder: _customCell),
        ],
      ),
    );
    await tester.tap(find.text('Badge'));
    await tester.tap(find.text('Custom'));
    expect(taps, 2);
  });

  testWidgets('without column config every column gets the same width',
      (tester) async {
    await pumpRow(
      tester,
      ImpaktfullUiTableRow(
        columns: const [
          ImpaktfullUiTableRowItem.text(title: 'A'),
          ImpaktfullUiTableRowItem.text(title: 'B'),
          ImpaktfullUiTableRowItem.text(title: 'C'),
        ],
      ),
    );
    final widths = [
      for (final title in ['A', 'B', 'C'])
        tester
            .getSize(find.ancestor(
              of: find.text(title),
              matching: find.byType(ImpaktfullUiTableRowItem),
            ))
            .width,
    ];
    expect(widths, [200, 200, 200]);
  });

  testWidgets('uses the column config: fixed, flex and min/max',
      (tester) async {
    await pumpRow(
      tester,
      ImpaktfullUiTableRow(
        columnConfig: const [
          ImpaktfullUiTableColumnConfig.fixedSize(size: 100),
          ImpaktfullUiTableColumnConfig(flex: 2),
          ImpaktfullUiTableColumnConfig(flex: 1),
          ImpaktfullUiTableColumnConfig.size(minWidth: 50, maxWidth: 80),
        ],
        columns: const [
          ImpaktfullUiTableRowItem.text(title: 'Fixed'),
          ImpaktfullUiTableRowItem.text(title: 'Flex 2'),
          ImpaktfullUiTableRowItem.text(title: 'Flex 1'),
          ImpaktfullUiTableRowItem.text(title: 'Size'),
        ],
      ),
    );
    double width(String title) => tester
        .getSize(find.ancestor(
          of: find.text(title),
          matching: find.byType(ImpaktfullUiTableRowItem),
        ))
        .width;
    expect(width('Fixed'), 100);
    // The last column gets 8px extra.
    expect(width('Size'), 88);
    // 600 - 100 - 88 = 412, split 2:1.
    expect(width('Flex 2'), closeTo(412 * 2 / 3, 1));
    expect(width('Flex 1'), closeTo(412 / 3, 1));
  });

  testWidgets('a row is at least 48 high', (tester) async {
    await pumpRow(
      tester,
      ImpaktfullUiTableRow(
        columns: const [
          ImpaktfullUiTableRowItem.custom(builder: _customCell),
        ],
      ),
    );
    expect(tester.getSize(find.byType(ImpaktfullUiTableRow)).height, 48);
  });
}

Widget _customCell(BuildContext context, ImpaktfullUiTableRowItemTheme theme) =>
    const Text('Custom');
