import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../_core_test_helpers.dart';

/// Proves that the border and the dividers of a table are themeable. Without
/// a `divider` color the dividers use the `ImpaktfullUiDividerTheme`, like
/// before the token existed, and the border is 1 wide.

ImpaktfullUiTableTheme _tableTheme({
  Color? border,
  Color? divider,
  double? borderWidth,
}) {
  final base = ImpaktfullUiTheme.getDefault().components.table;
  return base.copyWith(
    colors: base.colors.copyWith(border: border, divider: divider),
    dimens: base.dimens.copyWith(borderWidth: borderWidth),
  );
}

Future<void> _pumpTable(
  WidgetTester tester, {
  ImpaktfullUiTableTheme? theme,
}) =>
    pumpImpaktfullUiApp(
      tester,
      Material(
        child: Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: 400,
            height: 400,
            child: ImpaktfullUiTable(
              theme: theme,
              titles: const [ImpaktfullUiTableHeaderItem(title: 'Title')],
              content: const [
                ImpaktfullUiTableRow(
                  columns: [ImpaktfullUiTableRowItem.text(title: 'A')],
                ),
                ImpaktfullUiTableRow(
                  columns: [ImpaktfullUiTableRowItem.text(title: 'B')],
                ),
              ],
            ),
          ),
        ),
      ),
    );

/// The decoration of the table itself: the border around it.
BoxDecoration _decoration(WidgetTester tester) => tester
    .widgetList<Container>(
      find.descendant(
        of: find.byType(ImpaktfullUiTable),
        matching: find.byType(Container),
      ),
    )
    .first
    .decoration! as BoxDecoration;

/// The colors of the dividers of the table: below the header and between the
/// rows.
List<Color?> _dividerColors(WidgetTester tester) => tester
    .widgetList<Container>(
      find.descendant(
        of: find.byType(ImpaktfullUiDivider),
        matching: find.byType(Container),
      ),
    )
    .map((container) => container.color)
    .toList();

void main() {
  group('divider', () {
    testWidgets('is the color of the divider theme without the token',
        (tester) async {
      await _pumpTable(tester);
      final theme = ImpaktfullUiTheme.getDefault();
      expect(
        _dividerColors(tester),
        everyElement(theme.components.divider.colors.color),
      );
      expect(_dividerColors(tester), hasLength(2));
      expect(theme.components.table.colors.divider, isNull);
    });

    testWidgets('of the theme is the color of every divider of the table',
        (tester) async {
      await _pumpTable(tester, theme: _tableTheme(divider: Colors.amber));
      expect(_dividerColors(tester), hasLength(2));
      expect(_dividerColors(tester), everyElement(Colors.amber));
    });
  });

  group('borderWidth', () {
    testWidgets('is 1 by default', (tester) async {
      await _pumpTable(tester);
      final border = _decoration(tester).border! as Border;
      expect(border.top.color, ImpaktfullUiTheme.getDefault().colors.border);
      expect(border.top.width, 1);
      expect(
        ImpaktfullUiTheme.getDefault().components.table.dimens.borderWidth,
        1,
      );
    });

    testWidgets('is the thickness of the border of the table', (tester) async {
      await _pumpTable(
        tester,
        theme: _tableTheme(border: Colors.red, borderWidth: 4),
      );
      final border = _decoration(tester).border! as Border;
      expect(border.top.color, Colors.red);
      expect(border.top.width, 4);
    });
  });

  group('the theme classes', () {
    test('copyWith changes one token and keeps the others', () {
      const colors = ImpaktfullUiTableColorTheme(
        background: Color(0xFF111111),
        border: Color(0xFF222222),
      );
      final changed = colors.copyWith(divider: const Color(0xFF333333));
      expect(changed.background, const Color(0xFF111111));
      expect(changed.border, const Color(0xFF222222));
      expect(changed.divider, const Color(0xFF333333));
      expect(colors.copyWith(), colors);

      final dimens = ImpaktfullUiTheme.getDefault().components.table.dimens;
      expect(dimens.copyWith(borderWidth: 2).borderWidth, 2);
      expect(dimens.copyWith(borderWidth: 2).minColumnWidth, 250);
    });

    test('compare by value', () {
      const colors = ImpaktfullUiTableColorTheme(
        background: Color(0xFF111111),
        border: null,
      );
      expect(colors, colors.copyWith());
      expect(colors.hashCode, colors.copyWith().hashCode);
      expect(colors, isNot(colors.copyWith(divider: const Color(0xFF333333))));
      final dimens = ImpaktfullUiTheme.getDefault().components.table.dimens;
      expect(dimens.copyWith(borderWidth: 2), isNot(dimens.copyWith()));
    });
  });
}
