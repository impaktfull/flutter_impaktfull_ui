import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../_core_test_helpers.dart';

/// Proves that the padding of a cell comes from
/// [ImpaktfullUiTableRowItemDimensTheme], and that a `padding` on the cell
/// itself still wins. Without either, the padding is the one from before the
/// tokens existed: 16 horizontal, or 8 at the end for a custom cell.

const _customKey = Key('custom');

ImpaktfullUiTableRowItemTheme _itemTheme({
  EdgeInsetsGeometry? padding,
  EdgeInsetsGeometry? customPadding,
  double? spacing,
}) {
  final base = ImpaktfullUiTheme.getDefault().components.tableRowItem;
  return base.copyWith(
    dimens: base.dimens.copyWith(
      padding: padding,
      customPadding: customPadding,
      spacing: spacing,
    ),
  );
}

/// Puts [child] in a list, like an `ImpaktfullUiTable` puts its rows in one:
/// a cell fills the height it is given.
Future<void> _pumpCell(WidgetTester tester, Widget child) =>
    pumpImpaktfullUiApp(
      tester,
      Material(
        child: Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: 300,
            height: 400,
            child: ListView(children: [child]),
          ),
        ),
      ),
    );

/// The space between the start of the cell and [of].
double _startPadding(WidgetTester tester, Finder of) =>
    tester.getRect(of).left -
    tester.getRect(find.byType(ImpaktfullUiTableRowItem)).left;

/// The space between [of] and the end of the cell.
double _endPadding(WidgetTester tester, Finder of) =>
    tester.getRect(find.byType(ImpaktfullUiTableRowItem)).right -
    tester.getRect(of).right;

Widget _custom({
  EdgeInsets? padding,
  ImpaktfullUiTableRowItemTheme? theme,
}) =>
    ImpaktfullUiTableRowItem.custom(
      padding: padding,
      theme: theme,
      builder: (context, theme) => const SizedBox(key: _customKey, height: 20),
    );

void main() {
  group('padding', () {
    testWidgets('is 16 horizontal without a token and without a padding',
        (tester) async {
      await _pumpCell(
        tester,
        const ImpaktfullUiTableRowItem.text(title: 'A'),
      );
      expect(_startPadding(tester, find.text('A')), 16);
      expect(
        ImpaktfullUiTheme.getDefault().components.tableRowItem.dimens.padding,
        const EdgeInsets.symmetric(horizontal: 16),
      );
    });

    testWidgets('of the theme is the padding of a text cell', (tester) async {
      await _pumpCell(
        tester,
        ImpaktfullUiTableRowItem.text(
          title: 'A',
          theme: _itemTheme(padding: const EdgeInsets.symmetric(horizontal: 4)),
        ),
      );
      expect(_startPadding(tester, find.text('A')), 4);
    });

    testWidgets('of the theme is the padding of a badge cell', (tester) async {
      await _pumpCell(
        tester,
        ImpaktfullUiTableRowItem.badge(
          title: 'A',
          theme: _itemTheme(padding: const EdgeInsets.symmetric(horizontal: 4)),
        ),
      );
      expect(_startPadding(tester, find.byType(ImpaktfullUiBadge)), 4);
    });

    testWidgets('of the theme is the padding of a checkbox cell',
        (tester) async {
      await _pumpCell(
        tester,
        ImpaktfullUiTableRowItem.checkbox(
          isSelected: false,
          onChanged: (_) {},
          theme: _itemTheme(padding: const EdgeInsets.symmetric(horizontal: 4)),
        ),
      );
      expect(_startPadding(tester, find.byType(ImpaktfullUiCheckbox)), 4);
    });

    testWidgets('of the cell wins over the token', (tester) async {
      await _pumpCell(
        tester,
        ImpaktfullUiTableRowItem.text(
          title: 'A',
          padding: const EdgeInsets.symmetric(horizontal: 40),
          theme: _itemTheme(padding: const EdgeInsets.symmetric(horizontal: 4)),
        ),
      );
      expect(_startPadding(tester, find.text('A')), 40);
    });

    test('the getter returns the padding of the cell, else the old default',
        () {
      const withPadding = ImpaktfullUiTableRowItem.text(
        title: 'A',
        padding: EdgeInsets.all(20),
      );
      const withoutPadding = ImpaktfullUiTableRowItem.text(title: 'A');
      expect(withPadding.padding, const EdgeInsets.all(20));
      expect(
        withoutPadding.padding,
        const EdgeInsets.symmetric(horizontal: 16),
      );
    });
  });

  group('customPadding', () {
    testWidgets('is 8 at the end without a token and without a padding',
        (tester) async {
      await _pumpCell(tester, _custom());
      expect(_startPadding(tester, find.byKey(_customKey)), 0);
      expect(_endPadding(tester, find.byKey(_customKey)), 8);
      expect(
        ImpaktfullUiTheme.getDefault()
            .components
            .tableRowItem
            .dimens
            .customPadding,
        const EdgeInsetsDirectional.only(end: 8),
      );
    });

    testWidgets('of the theme is the padding of a custom cell', (tester) async {
      await _pumpCell(
        tester,
        _custom(
          theme: _itemTheme(
            customPadding: const EdgeInsetsDirectional.only(start: 12, end: 24),
          ),
        ),
      );
      expect(_startPadding(tester, find.byKey(_customKey)), 12);
      expect(_endPadding(tester, find.byKey(_customKey)), 24);
    });

    testWidgets('of the cell wins over the token', (tester) async {
      await _pumpCell(
        tester,
        _custom(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          theme: _itemTheme(
            customPadding: const EdgeInsetsDirectional.only(end: 24),
          ),
        ),
      );
      expect(_startPadding(tester, find.byKey(_customKey)), 30);
      expect(_endPadding(tester, find.byKey(_customKey)), 30);
    });

    testWidgets('the padding token is not used by a custom cell',
        (tester) async {
      await _pumpCell(
        tester,
        _custom(theme: _itemTheme(padding: const EdgeInsets.all(40))),
      );
      expect(_startPadding(tester, find.byKey(_customKey)), 0);
      expect(_endPadding(tester, find.byKey(_customKey)), 8);
    });
  });

  group('spacing', () {
    double gap(WidgetTester tester) =>
        tester.getRect(find.text('A')).left -
        tester.getRect(find.byType(ImpaktfullUiCheckbox)).right;

    Widget checkboxCell({double? spacing}) => ImpaktfullUiTableRowItem.checkbox(
          isSelected: false,
          onChanged: (_) {},
          title: 'A',
          theme: spacing == null ? null : _itemTheme(spacing: spacing),
        );

    testWidgets('is 8 between the checkbox and the title', (tester) async {
      await _pumpCell(tester, checkboxCell());
      expect(gap(tester), 8);
    });

    testWidgets('of the theme is the space between them', (tester) async {
      await _pumpCell(tester, checkboxCell(spacing: 24));
      expect(gap(tester), 24);
    });
  });

  group('the theme class', () {
    test('copyWith changes one token and keeps the others', () {
      const dimens = ImpaktfullUiTableRowItemDimensTheme(
        padding: EdgeInsets.all(4),
        spacing: 2,
      );
      final changed = dimens.copyWith(spacing: 6);
      expect(changed.padding, const EdgeInsets.all(4));
      expect(changed.spacing, 6);
      expect(changed.minHeight, 48);
      expect(dimens.copyWith(), dimens);
    });

    test('compares by value', () {
      expect(
        const ImpaktfullUiTableRowItemDimensTheme(padding: EdgeInsets.all(4)),
        const ImpaktfullUiTableRowItemDimensTheme(padding: EdgeInsets.all(4)),
      );
      expect(
        const ImpaktfullUiTableRowItemDimensTheme(padding: EdgeInsets.all(4))
            .hashCode,
        const ImpaktfullUiTableRowItemDimensTheme(padding: EdgeInsets.all(4))
            .hashCode,
      );
      expect(
        const ImpaktfullUiTableRowItemDimensTheme(padding: EdgeInsets.all(4)),
        isNot(const ImpaktfullUiTableRowItemDimensTheme()),
      );
      expect(
        const ImpaktfullUiTableRowItemDimensTheme(
          customPadding: EdgeInsets.all(4),
        ),
        isNot(const ImpaktfullUiTableRowItemDimensTheme()),
      );
      expect(
        const ImpaktfullUiTableRowItemDimensTheme(spacing: 4),
        isNot(const ImpaktfullUiTableRowItemDimensTheme()),
      );
    });
  });
}
