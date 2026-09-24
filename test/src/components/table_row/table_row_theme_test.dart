import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../_core_test_helpers.dart';

/// Proves that every token of [ImpaktfullUiTableRowColorTheme] changes what a
/// row renders, and that a row without tokens is transparent and has no
/// border, like before the tokens existed.

const _background = Color(0xFF111111);
const _alternate = Color(0xFF222222);
const _hover = Color(0xFF333333);
const _selected = Color(0xFF444444);
const _border = Color(0xFF555555);

ImpaktfullUiTableRowTheme _rowTheme({
  Color? background,
  Color? backgroundAlternate,
  Color? backgroundHover,
  Color? backgroundSelected,
  Color? border,
  double? borderWidth,
}) {
  final base = ImpaktfullUiTheme.getDefault().components.tableRow;
  return base.copyWith(
    colors: base.colors.copyWith(
      background: background,
      backgroundAlternate: backgroundAlternate,
      backgroundHover: backgroundHover,
      backgroundSelected: backgroundSelected,
      border: border,
    ),
    dimens: base.dimens.copyWith(borderWidth: borderWidth),
  );
}

ImpaktfullUiTheme _appTheme(ImpaktfullUiTableRowTheme rowTheme) {
  final theme = ImpaktfullUiTheme.getDefault();
  return theme.copyWith(
    components: theme.components.copyWith(tableRow: rowTheme),
  );
}

Widget _row({
  ImpaktfullUiTableRowTheme? theme,
  bool isSelected = false,
  String title = 'A',
}) =>
    ImpaktfullUiTableRow(
      isSelected: isSelected,
      theme: theme,
      columns: [ImpaktfullUiTableRowItem.text(title: title)],
    );

Future<void> _pumpRow(
  WidgetTester tester,
  Widget row, {
  ImpaktfullUiTheme? theme,
}) =>
    pumpImpaktfullUiApp(
      tester,
      Material(
        child: Align(
          alignment: Alignment.topLeft,
          child: SizedBox(width: 400, child: row),
        ),
      ),
      theme: theme,
    );

/// The color the row paints behind its cells: the [Material] of the container
/// of the row, which is the first one inside it.
Color? _rowColor(WidgetTester tester, {int at = 0}) => tester
    .widgetList<Material>(
      find.descendant(
        of: find.byType(ImpaktfullUiTableRow).at(at),
        matching: find.byType(Material),
      ),
    )
    .first
    .color;

/// The border the row paints over its cells, or null when it paints none.
BoxBorder? _rowBorder(WidgetTester tester) {
  final container = tester
      .widgetList<Container>(
        find.descendant(
          of: find.byType(ImpaktfullUiTableRow),
          matching: find.byType(Container),
        ),
      )
      .first;
  return (container.foregroundDecoration as BoxDecoration?)?.border;
}

/// Moves a mouse over [finder] until the test ends.
Future<void> _hoverOver(WidgetTester tester, Finder finder) async {
  final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
  await gesture.addPointer(location: Offset.zero);
  addTearDown(gesture.removePointer);
  await gesture.moveTo(tester.getCenter(finder));
  await tester.pumpAndSettle();
}

void main() {
  group('without tokens', () {
    testWidgets('a row is transparent and has no border', (tester) async {
      await _pumpRow(tester, _row());
      expect(_rowColor(tester), Colors.transparent);
      expect(_rowBorder(tester), isNull);
    });

    testWidgets('a hovered row stays transparent', (tester) async {
      await _pumpRow(tester, _row());
      await _hoverOver(tester, find.text('A'));
      expect(_rowColor(tester), Colors.transparent);
    });

    testWidgets('a selected row stays transparent', (tester) async {
      await _pumpRow(tester, _row(isSelected: true));
      expect(_rowColor(tester), Colors.transparent);
    });

    test('every color of the default theme is null', () {
      final colors = ImpaktfullUiTheme.getDefault().components.tableRow.colors;
      expect(colors.background, isNull);
      expect(colors.backgroundAlternate, isNull);
      expect(colors.backgroundHover, isNull);
      expect(colors.backgroundSelected, isNull);
      expect(colors.border, isNull);
    });
  });

  testWidgets('background is the background of the row', (tester) async {
    await _pumpRow(tester, _row(theme: _rowTheme(background: _background)));
    expect(_rowColor(tester), _background);
  });

  group('backgroundHover', () {
    testWidgets('is used while a pointer hovers over the row', (tester) async {
      await _pumpRow(
        tester,
        _row(
            theme: _rowTheme(background: _background, backgroundHover: _hover)),
      );
      expect(_rowColor(tester), _background);

      await _hoverOver(tester, find.text('A'));
      expect(_rowColor(tester), _hover);
    });

    testWidgets('is not used after the pointer left the row', (tester) async {
      await _pumpRow(
        tester,
        _row(
            theme: _rowTheme(background: _background, backgroundHover: _hover)),
      );
      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);
      await gesture.moveTo(tester.getCenter(find.text('A')));
      await tester.pumpAndSettle();
      expect(_rowColor(tester), _hover);

      await gesture.moveTo(const Offset(700, 500));
      await tester.pumpAndSettle();
      expect(_rowColor(tester), _background);
    });

    testWidgets('is used by a row without an onTap', (tester) async {
      await _pumpRow(
        tester,
        ImpaktfullUiTableRow(
          theme: _rowTheme(backgroundHover: _hover),
          columns: const [ImpaktfullUiTableRowItem.text(title: 'A')],
        ),
      );
      await _hoverOver(tester, find.text('A'));
      expect(_rowColor(tester), _hover);
    });

    testWidgets(
        'makes the row observe the pointer, a theme without it does not',
        (tester) async {
      await _pumpRow(tester, _row(theme: _rowTheme(background: _background)));
      expect(
        find.descendant(
          of: find.byType(ImpaktfullUiTableRow),
          matching: find.byType(ImpaktfullUiHoverFeedback),
        ),
        findsNothing,
        reason: 'a row of a table without a hover background keeps the widget '
            'tree it had before the token existed',
      );

      await _pumpRow(
        tester,
        _row(
            theme: _rowTheme(background: _background, backgroundHover: _hover)),
      );
      expect(
        find.descendant(
          of: find.byType(ImpaktfullUiTableRow),
          matching: find.byType(ImpaktfullUiHoverFeedback),
        ),
        findsOneWidget,
      );
    });
  });

  group('backgroundSelected', () {
    testWidgets('is used by a selected row', (tester) async {
      await _pumpRow(
        tester,
        _row(
          isSelected: true,
          theme: _rowTheme(
            background: _background,
            backgroundSelected: _selected,
          ),
        ),
      );
      expect(_rowColor(tester), _selected);
    });

    testWidgets('wins over backgroundHover', (tester) async {
      await _pumpRow(
        tester,
        _row(
          isSelected: true,
          theme: _rowTheme(
            backgroundHover: _hover,
            backgroundSelected: _selected,
          ),
        ),
      );
      await _hoverOver(tester, find.text('A'));
      expect(_rowColor(tester), _selected);
    });

    testWidgets('a selected row is announced as selected', (tester) async {
      await _pumpRow(tester, _row(isSelected: true));
      expect(
        tester.getSemantics(find.text('A')),
        matchesSemantics(
          label: 'A',
          hasSelectedState: true,
          isSelected: true,
        ),
      );
    });

    testWidgets('a row that is not selected has no selected state',
        (tester) async {
      await _pumpRow(tester, _row());
      expect(
        tester.getSemantics(find.text('A')),
        matchesSemantics(label: 'A'),
      );
    });
  });

  group('backgroundAlternate', () {
    Widget table({required ImpaktfullUiTableRowTheme rowTheme}) => SizedBox(
          width: 400,
          height: 400,
          child: ImpaktfullUiTable(
            titles: const [ImpaktfullUiTableHeaderItem(title: 'Title')],
            content: [
              for (final title in ['A', 'B', 'C'])
                ImpaktfullUiTableRow(
                  columns: [ImpaktfullUiTableRowItem.text(title: title)],
                ),
            ],
          ),
        );

    testWidgets('is the background of every second row of a table',
        (tester) async {
      final rowTheme = _rowTheme(
        background: _background,
        backgroundAlternate: _alternate,
      );
      await pumpImpaktfullUiApp(
        tester,
        Material(child: table(rowTheme: rowTheme)),
        theme: _appTheme(rowTheme),
      );
      expect(_rowColor(tester, at: 0), _background);
      expect(_rowColor(tester, at: 1), _alternate);
      expect(_rowColor(tester, at: 2), _background);
    });

    testWidgets('is not used outside of a table', (tester) async {
      final rowTheme = _rowTheme(
        background: _background,
        backgroundAlternate: _alternate,
      );
      await _pumpRow(tester, _row(theme: rowTheme));
      expect(_rowColor(tester), _background);
    });

    testWidgets('without it every row of a table uses background',
        (tester) async {
      final rowTheme = _rowTheme(background: _background);
      await pumpImpaktfullUiApp(
        tester,
        Material(child: table(rowTheme: rowTheme)),
        theme: _appTheme(rowTheme),
      );
      expect(_rowColor(tester, at: 0), _background);
      expect(_rowColor(tester, at: 1), _background);
    });
  });

  group('border', () {
    testWidgets('is drawn below the row', (tester) async {
      await _pumpRow(tester, _row(theme: _rowTheme(border: _border)));
      final border = _rowBorder(tester)! as Border;
      expect(border.bottom.color, _border);
      expect(border.bottom.width, 1);
      expect(border.top, BorderSide.none);
    });

    testWidgets('borderWidth is its thickness', (tester) async {
      await _pumpRow(
        tester,
        _row(theme: _rowTheme(border: _border, borderWidth: 4)),
      );
      expect((_rowBorder(tester)! as Border).bottom.width, 4);
    });

    testWidgets('borderWidth alone draws nothing', (tester) async {
      await _pumpRow(tester, _row(theme: _rowTheme(borderWidth: 4)));
      expect(_rowBorder(tester), isNull);
    });
  });

  group('the theme class', () {
    test('copyWith changes one color and keeps the others', () {
      const colors = ImpaktfullUiTableRowColorTheme(
        background: _background,
        backgroundHover: _hover,
      );
      final changed = colors.copyWith(backgroundSelected: _selected);
      expect(changed.background, _background);
      expect(changed.backgroundHover, _hover);
      expect(changed.backgroundSelected, _selected);
      expect(colors.copyWith(), colors);
    });

    test('compares by value', () {
      expect(
        const ImpaktfullUiTableRowColorTheme(background: _background),
        const ImpaktfullUiTableRowColorTheme(background: _background),
      );
      expect(
        const ImpaktfullUiTableRowColorTheme(background: _background).hashCode,
        const ImpaktfullUiTableRowColorTheme(background: _background).hashCode,
      );
      expect(
        const ImpaktfullUiTableRowColorTheme(background: _background),
        isNot(const ImpaktfullUiTableRowColorTheme(background: _alternate)),
      );
      expect(
        const ImpaktfullUiTableRowDimensTheme(borderWidth: 2),
        isNot(const ImpaktfullUiTableRowDimensTheme()),
      );
    });
  });
}
