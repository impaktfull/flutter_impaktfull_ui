import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../_overlays_golden_helpers.dart';

/// Freezes the row states of a table: an alternating background, a hovered
/// row, a selected row and a colored divider, all from the theme.

const _alternate = Color(0xFFF7F7F8);
const _hover = Color(0xFFEDEDF0);
const _selected = Color(0xFFE6F4FF);
const _divider = Color(0xFFE5E5E5);

/// A table theme in the style of a design system with row states: shadcn's
/// `hover:bg-muted/50` and Ant's `rowSelectedBg`.
ImpaktfullUiTheme _theme() {
  final theme = ImpaktfullUiTheme.getDefault();
  final table = theme.components.table;
  final row = theme.components.tableRow;
  final header = theme.components.tableHeader;
  return theme.copyWith(
    components: theme.components.copyWith(
      table: table.copyWith(
        colors: table.colors.copyWith(divider: _divider),
      ),
      tableHeader: header.copyWith(
        colors: header.colors.copyWith(border: _divider),
      ),
      tableRow: row.copyWith(
        colors: row.colors.copyWith(
          background: theme.colors.card,
          backgroundAlternate: _alternate,
          backgroundHover: _hover,
          backgroundSelected: _selected,
        ),
      ),
    ),
  );
}

Widget _table() => ImpaktfullUiTable(
      titles: const [
        ImpaktfullUiTableHeaderItem(title: 'Name'),
        ImpaktfullUiTableHeaderItem(title: 'Status'),
      ],
      content: [
        for (final (index, name) in [
          'Hovered',
          'Alternate',
          'Selected',
          'Plain',
        ].indexed)
          ImpaktfullUiTableRow(
            onTap: () {},
            isSelected: name == 'Selected',
            columns: [
              ImpaktfullUiTableRowItem.text(title: name),
              ImpaktfullUiTableRowItem.text(title: 'Row $index'),
            ],
          ),
      ],
    );

void main() {
  setUp(() => setupComponentTest());

  runOverlayGoldenTest(
    fileName: 'impaktfull_ui_table_row_states',
    size: const Size(600, 300),
    builder: () => ImpaktfullUiApp(
      showDebugFlag: false,
      title: 'impaktfull app',
      impaktfullUiTheme: _theme(),
      home: Padding(
        padding: const EdgeInsets.all(8),
        child: _table(),
      ),
    ),
    whilePerforming: (tester) async {
      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      await gesture.moveTo(tester.getCenter(find.text('Hovered')));
      await tester.pumpAndSettle();
      return gesture.removePointer;
    },
  );
}
