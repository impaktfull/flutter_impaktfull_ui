import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../_data_display_test_helpers.dart';

void main() {
  Future<void> pumpHeader(WidgetTester tester, Widget header) => pumpSized(
        tester,
        Align(
          alignment: Alignment.topLeft,
          child: SizedBox(width: 600, child: header),
        ),
        size: const Size(600, 400),
      );

  double width(WidgetTester tester, String title) => tester
      .getSize(find.ancestor(
        of: find.textContaining(title),
        matching: find.byType(ImpaktfullUiTableHeaderItem),
      ))
      .width;

  testWidgets('without column config every title gets the same width',
      (tester) async {
    await pumpHeader(
      tester,
      const ImpaktfullUiTableHeader(
        titles: [
          ImpaktfullUiTableHeaderItem(title: 'A'),
          ImpaktfullUiTableHeaderItem(title: 'B'),
        ],
      ),
    );
    expect(width(tester, 'A'), 300);
    expect(width(tester, 'B'), 300);
  });

  testWidgets('uses the same column config as the rows', (tester) async {
    const columnConfig = [
      ImpaktfullUiTableColumnConfig.fixedSize(size: 120),
      ImpaktfullUiTableColumnConfig(flex: 1),
    ];
    await pumpHeader(
      tester,
      Column(
        children: [
          const ImpaktfullUiTableHeader(
            columnConfig: columnConfig,
            titles: [
              ImpaktfullUiTableHeaderItem(title: 'Header 1'),
              ImpaktfullUiTableHeaderItem(title: 'Header 2'),
            ],
          ),
          ImpaktfullUiTableRow(
            columnConfig: columnConfig,
            columns: const [
              ImpaktfullUiTableRowItem.text(title: 'Cell 1'),
              ImpaktfullUiTableRowItem.text(title: 'Cell 2'),
            ],
          ),
        ],
      ),
    );
    expect(width(tester, 'Header 1'), 120);
    // The columns of the header and the row are aligned.
    expect(
      tester.getTopLeft(find.textContaining('Header 2')).dx,
      tester.getTopLeft(find.text('Cell 2')).dx,
    );
  });

  testWidgets('uses the background color of the theme', (tester) async {
    final defaultTheme = ImpaktfullUiTheme.getDefault().components.tableHeader;
    await pumpHeader(
      tester,
      const ImpaktfullUiTableHeader(
        titles: [ImpaktfullUiTableHeaderItem(title: 'A')],
      ),
    );
    final decoration = tester
        .widget<Container>(find
            .descendant(
              of: find.byType(ImpaktfullUiTableHeader),
              matching: find.byType(Container),
            )
            .first)
        .decoration as BoxDecoration;
    expect(decoration.color, defaultTheme.colors.background);
  });

  testWidgets('the header is at least 48 high', (tester) async {
    await pumpHeader(
      tester,
      const ImpaktfullUiTableHeader(
        titles: [ImpaktfullUiTableHeaderItem()],
      ),
    );
    expect(tester.getSize(find.byType(ImpaktfullUiTableHeader)).height, 48);
  });
}
