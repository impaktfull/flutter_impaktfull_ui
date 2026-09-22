import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../_data_display_test_helpers.dart';

/// A table with a select-all checkbox, a sortable name column and a checkbox
/// on every row, like a real screen would build it.
class _SortableTable extends StatefulWidget {
  final List<String> names;

  const _SortableTable({required this.names});

  @override
  State<_SortableTable> createState() => _SortableTableState();
}

class _SortableTableState extends State<_SortableTable> {
  late final List<String> _names = [...widget.names];
  final _selected = <String>{};
  bool? _ascending;

  bool? get _allSelected {
    if (_selected.isEmpty) return false;
    if (_selected.length == _names.length) return true;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiTable(
      columnConfig: const [
        ImpaktfullUiTableColumnConfig.fixedSize(size: 64),
        ImpaktfullUiTableColumnConfig(flex: 1),
      ],
      titles: [
        ImpaktfullUiTableHeaderItem.checkbox(
          isSelected: _allSelected,
          onChanged: (value) => setState(() {
            if (value == true) {
              _selected.addAll(_names);
            } else {
              _selected.clear();
            }
          }),
        ),
        ImpaktfullUiTableHeaderItem(
          title: 'Name',
          ascending: _ascending,
          onTap: () => setState(() {
            _ascending = !(_ascending ?? false);
            _names.sort(
              (a, b) => _ascending! ? a.compareTo(b) : b.compareTo(a),
            );
          }),
        ),
      ],
      content: [
        for (final name in _names)
          ImpaktfullUiTableRow(
            key: ValueKey(name),
            columnConfig: const [
              ImpaktfullUiTableColumnConfig.fixedSize(size: 64),
              ImpaktfullUiTableColumnConfig(flex: 1),
            ],
            columns: [
              ImpaktfullUiTableRowItem.checkbox(
                isSelected: _selected.contains(name),
                onChanged: (value) => setState(() {
                  if (value) {
                    _selected.add(name);
                  } else {
                    _selected.remove(name);
                  }
                }),
              ),
              ImpaktfullUiTableRowItem.text(title: name),
            ],
          ),
      ],
    );
  }
}

void main() {
  const names = ['Charlie', 'Alice', 'Bob'];

  Future<void> pumpTable(WidgetTester tester) => pumpSized(
        tester,
        const _SortableTable(names: names),
        size: const Size(800, 400),
      );

  List<String> shownNames(WidgetTester tester) {
    final texts = tester
        .widgetList<Text>(find.descendant(
          of: find.byType(ImpaktfullUiTableRow),
          matching: find.byType(Text),
        ))
        .map((text) => text.data!)
        .toList();
    final positions = {
      for (final name in texts) name: tester.getTopLeft(find.text(name)).dy,
    };
    return texts..sort((a, b) => positions[a]!.compareTo(positions[b]!));
  }

  List<bool?> checkboxValues(WidgetTester tester) => tester
      .widgetList<ImpaktfullUiCheckbox>(find.byType(ImpaktfullUiCheckbox))
      .map((checkbox) => checkbox.value)
      .toList();

  testWidgets('shows the header and every row', (tester) async {
    await pumpTable(tester);
    expect(find.text('Name'), findsOneWidget);
    expect(shownNames(tester), names);
    expect(find.byType(ImpaktfullUiTableRow), findsNWidgets(3));
    // 1 below the header, 2 between the rows.
    expect(find.byType(ImpaktfullUiDivider), findsNWidgets(3));
  });

  testWidgets('tapping the sortable header sorts the rows', (tester) async {
    await pumpTable(tester);
    await tester.tap(find.textContaining('Name'));
    await tester.pumpAndSettle();
    expect(shownNames(tester), ['Alice', 'Bob', 'Charlie']);
    expect(find.byIcon(PhosphorIcons.caretUp()), findsOneWidget);

    await tester.tap(find.textContaining('Name'));
    await tester.pumpAndSettle();
    expect(shownNames(tester), ['Charlie', 'Bob', 'Alice']);
    expect(find.byIcon(PhosphorIcons.caretDown()), findsOneWidget);
  });

  testWidgets('row checkboxes update the select-all checkbox', (tester) async {
    await pumpTable(tester);
    expect(checkboxValues(tester), [false, false, false, false]);

    await tester.tap(find.byType(ImpaktfullUiCheckbox).at(1));
    await tester.pumpAndSettle();
    // Some rows selected: the header checkbox is indeterminate.
    expect(checkboxValues(tester), [null, true, false, false]);

    await tester.tap(find.byType(ImpaktfullUiCheckbox).at(2));
    await tester.tap(find.byType(ImpaktfullUiCheckbox).at(3));
    await tester.pumpAndSettle();
    expect(checkboxValues(tester), [true, true, true, true]);
  });

  testWidgets('the select-all checkbox selects and deselects every row',
      (tester) async {
    await pumpTable(tester);
    await tester.tap(find.byType(ImpaktfullUiCheckbox).first);
    await tester.pumpAndSettle();
    expect(checkboxValues(tester), [true, true, true, true]);

    await tester.tap(find.byType(ImpaktfullUiCheckbox).first);
    await tester.pumpAndSettle();
    expect(checkboxValues(tester), [false, false, false, false]);
  });

  testWidgets('loading shows a loading indicator instead of the rows',
      (tester) async {
    await pumpSized(
      tester,
      ImpaktfullUiTable(
        isLoading: true,
        titles: const [ImpaktfullUiTableHeaderItem(title: 'Name')],
        content: [
          ImpaktfullUiTableRow(
            columns: const [ImpaktfullUiTableRowItem.text(title: 'Row')],
          ),
        ],
      ),
      settle: false,
    );
    expect(find.text('Name'), findsOneWidget);
    expect(find.byType(ImpaktfullUiLoadingIndicator), findsOneWidget);
    expect(find.text('Row'), findsNothing);
  });

  testWidgets('scrolls horizontally when narrower than the min width',
      (tester) async {
    await pumpSized(
      tester,
      ImpaktfullUiTable(
        titles: const [
          ImpaktfullUiTableHeaderItem(title: 'Column 1'),
          ImpaktfullUiTableHeaderItem(title: 'Column 2'),
        ],
        content: [
          ImpaktfullUiTableRow(
            columns: const [
              ImpaktfullUiTableRowItem.text(title: 'Cell 1'),
              ImpaktfullUiTableRowItem.text(title: 'Cell 2'),
            ],
          ),
        ],
      ),
      size: const Size(300, 300),
    );
    // 2 columns of min 250 = 500 wide.
    final horizontalList = find.byWidgetPredicate(
      (widget) =>
          widget is ListView && widget.scrollDirection == Axis.horizontal,
    );
    expect(horizontalList, findsOneWidget);
    final before = tester.getTopLeft(find.text('Column 2')).dx;
    await tester.drag(horizontalList, const Offset(-200, 0));
    await tester.pumpAndSettle();
    expect(tester.getTopLeft(find.text('Column 2')).dx, lessThan(before));
  });

  testWidgets('does not scroll horizontally when wide enough', (tester) async {
    await pumpSized(
      tester,
      ImpaktfullUiTable(
        titles: const [ImpaktfullUiTableHeaderItem(title: 'Column 1')],
        content: const [],
      ),
      size: const Size(400, 300),
    );
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is ListView && widget.scrollDirection == Axis.horizontal,
      ),
      findsNothing,
    );
  });

  testWidgets('shrinkWrap: the table is as high as its rows', (tester) async {
    await pumpSized(
      tester,
      Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: 400,
          child: ImpaktfullUiTable(
            shrinkWrap: true,
            titles: const [ImpaktfullUiTableHeaderItem(title: 'Column 1')],
            content: [
              ImpaktfullUiTableRow(
                columns: const [ImpaktfullUiTableRowItem.text(title: 'Cell')],
              ),
            ],
          ),
        ),
      ),
    );
    expect(
        tester.getSize(find.byType(ImpaktfullUiTable)).height, lessThan(200));
  });

  testWidgets(
    'shrinkWrap: narrower than the min width does not crash',
    (tester) async {
      // shrinkWrap is used in a scrollable parent: an unbounded height.
      await pumpSized(
        tester,
        SingleChildScrollView(
          child: SizedBox(
            width: 300,
            child: ImpaktfullUiTable(
              shrinkWrap: true,
              titles: const [
                ImpaktfullUiTableHeaderItem(title: 'Column 1'),
                ImpaktfullUiTableHeaderItem(title: 'Column 2'),
              ],
              content: const [],
            ),
          ),
        ),
      );
      expect(tester.takeException(), isNull);
    },
  );

  group('columnConfig', () {
    const tableConfig = [
      ImpaktfullUiTableColumnConfig.fixedSize(size: 100),
      ImpaktfullUiTableColumnConfig(flex: 1),
    ];

    Widget buildTable({
      List<ImpaktfullUiTableColumnConfig> rowConfig = const [],
    }) =>
        ImpaktfullUiTable(
          columnConfig: tableConfig,
          titles: const [
            ImpaktfullUiTableHeaderItem(title: 'Header 1'),
            ImpaktfullUiTableHeaderItem(title: 'Header 2'),
          ],
          content: [
            ImpaktfullUiTableRow(
              columnConfig: rowConfig,
              columns: const [
                ImpaktfullUiTableRowItem.text(title: 'Cell 1'),
                ImpaktfullUiTableRowItem.text(title: 'Cell 2'),
              ],
            ),
          ],
        );

    testWidgets('a row without a columnConfig uses the one of the table',
        (tester) async {
      await pumpSized(tester, buildTable(), size: const Size(800, 400));
      expect(
        tester.getTopLeft(find.text('Cell 2')).dx,
        tester.getTopLeft(find.text('Header 2')).dx,
      );
      expect(
        tester.getSize(find.byType(ImpaktfullUiTableRowItem).first).width,
        100,
      );
    });

    testWidgets('the columnConfig of a row overrides the one of the table',
        (tester) async {
      await pumpSized(
        tester,
        buildTable(
          rowConfig: const [
            ImpaktfullUiTableColumnConfig.fixedSize(size: 200),
            ImpaktfullUiTableColumnConfig(flex: 1),
          ],
        ),
        size: const Size(800, 400),
      );
      expect(
        tester.getSize(find.byType(ImpaktfullUiTableRowItem).first).width,
        200,
      );
      expect(
        tester.getSize(find.byType(ImpaktfullUiTableHeaderItem).first).width,
        100,
      );
    });

    testWidgets('a row outside of a table uses equal columns', (tester) async {
      await pumpSized(
        tester,
        ImpaktfullUiTableRow(
          columns: const [
            ImpaktfullUiTableRowItem.text(title: 'Cell 1'),
            ImpaktfullUiTableRowItem.text(title: 'Cell 2'),
          ],
        ),
        size: const Size(800, 400),
      );
      final items = find.byType(ImpaktfullUiTableRowItem);
      expect(
        tester.getSize(items.first).width,
        tester.getSize(items.last).width,
      );
    });
  });
}
