import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../_core_test_helpers.dart';

/// Proves that the padding, the spacing and the sort caret of a header cell
/// come from [ImpaktfullUiTableHeaderItemTheme]. Without the tokens the cell
/// renders like before they existed: 16 horizontal padding, an 8 wide gap and
/// a 16 caret in the color of the surrounding icon theme.

ImpaktfullUiTableHeaderItemTheme _headerItemTheme({
  EdgeInsetsGeometry? padding,
  double? sortIconSize,
  double? sortIconSpacing,
  double? spacing,
  Color? sortIcon,
}) {
  final base = ImpaktfullUiTheme.getDefault().components.tableHeaderItem;
  return base.copyWith(
    colors: base.colors.copyWith(sortIcon: sortIcon),
    dimens: base.dimens.copyWith(
      padding: padding,
      sortIconSize: sortIconSize,
      sortIconSpacing: sortIconSpacing,
      spacing: spacing,
    ),
  );
}

Future<void> _pumpHeaderItem(WidgetTester tester, Widget child) =>
    pumpImpaktfullUiApp(
      tester,
      Material(
        child: Align(
          alignment: Alignment.topLeft,
          child: SizedBox(width: 300, child: child),
        ),
      ),
    );

/// The space between the start of the header cell and [of].
double _startPadding(WidgetTester tester, Finder of) =>
    tester.getRect(of).left -
    tester.getRect(find.byType(ImpaktfullUiTableHeaderItem)).left;

Icon _caret(WidgetTester tester) => tester.widget<Icon>(find.byType(Icon));

void main() {
  group('padding', () {
    testWidgets('is 16 horizontal without a token and without a padding',
        (tester) async {
      await _pumpHeaderItem(
        tester,
        const ImpaktfullUiTableHeaderItem(title: 'A'),
      );
      expect(_startPadding(tester, find.text('A')), 16);
      expect(
        ImpaktfullUiTheme.getDefault()
            .components
            .tableHeaderItem
            .dimens
            .padding,
        const EdgeInsets.symmetric(horizontal: 16),
      );
    });

    testWidgets('of the theme is the padding of the header cell',
        (tester) async {
      await _pumpHeaderItem(
        tester,
        ImpaktfullUiTableHeaderItem(
          title: 'A',
          theme: _headerItemTheme(
            padding: const EdgeInsets.symmetric(horizontal: 4),
          ),
        ),
      );
      expect(_startPadding(tester, find.text('A')), 4);
    });

    testWidgets('of the header cell wins over the token', (tester) async {
      await _pumpHeaderItem(
        tester,
        ImpaktfullUiTableHeaderItem(
          title: 'A',
          padding: const EdgeInsets.symmetric(horizontal: 40),
          theme: _headerItemTheme(
            padding: const EdgeInsets.symmetric(horizontal: 4),
          ),
        ),
      );
      expect(_startPadding(tester, find.text('A')), 40);
    });

    test('the getter returns the padding of the cell, else the old default',
        () {
      expect(
        const ImpaktfullUiTableHeaderItem(
          title: 'A',
          padding: EdgeInsets.all(20),
        ).padding,
        const EdgeInsets.all(20),
      );
      expect(
        const ImpaktfullUiTableHeaderItem(title: 'A').padding,
        const EdgeInsets.symmetric(horizontal: 16),
      );
    });

    test('the getter is still nullable, like the field it replaced', () {
      // `padding` was an `EdgeInsets?` field before it became a token. The
      // `??` keeps it nullable: it becomes a dead_null_aware_expression
      // warning (an error in CI) when the getter is made non-nullable, which
      // would silently turn `padding == null` in an app into `false`.
      const item = ImpaktfullUiTableHeaderItem(title: 'A');
      expect(item.padding ?? EdgeInsets.zero, isNot(EdgeInsets.zero));
    });
  });

  group('the sort caret', () {
    testWidgets('is 16 with 8 before it by default', (tester) async {
      await _pumpHeaderItem(
        tester,
        const ImpaktfullUiTableHeaderItem(title: 'A', ascending: true),
      );
      expect(_caret(tester).size, 16);
      expect(_caret(tester).color, isNull);
      final dimens =
          ImpaktfullUiTheme.getDefault().components.tableHeaderItem.dimens;
      expect(dimens.sortIconSize, 16);
      expect(dimens.sortIconSpacing, 8);
    });

    testWidgets('sortIconSize is its size', (tester) async {
      await _pumpHeaderItem(
        tester,
        ImpaktfullUiTableHeaderItem(
          title: 'A',
          ascending: false,
          theme: _headerItemTheme(sortIconSize: 24),
        ),
      );
      expect(_caret(tester).size, 24);
      expect(tester.getSize(find.byType(Icon)).width, 24);
    });

    testWidgets('sortIconSpacing is the space before it', (tester) async {
      // The caret is a span in the paragraph of the title, so its own position
      // is what moves: 24 more spacing moves it 24 to the end.
      await _pumpHeaderItem(
        tester,
        const ImpaktfullUiTableHeaderItem(title: 'A', ascending: true),
      );
      final withDefault = tester.getRect(find.byType(Icon)).left;

      await _pumpHeaderItem(
        tester,
        ImpaktfullUiTableHeaderItem(
          title: 'A',
          ascending: true,
          theme: _headerItemTheme(sortIconSpacing: 32),
        ),
      );
      expect(tester.getRect(find.byType(Icon)).left - withDefault, 24);
    });

    testWidgets('sortIcon is its color', (tester) async {
      await _pumpHeaderItem(
        tester,
        ImpaktfullUiTableHeaderItem(
          title: 'A',
          ascending: true,
          theme: _headerItemTheme(sortIcon: const Color(0xFF00FF00)),
        ),
      );
      expect(_caret(tester).color, const Color(0xFF00FF00));
    });

    testWidgets('is not shown without an ascending', (tester) async {
      await _pumpHeaderItem(
        tester,
        const ImpaktfullUiTableHeaderItem(title: 'A'),
      );
      expect(find.byType(Icon), findsNothing);
    });
  });

  group('spacing', () {
    Widget checkboxHeader({double? spacing}) =>
        ImpaktfullUiTableHeaderItem.checkbox(
          isSelected: false,
          onChanged: (_) {},
          title: 'A',
          theme: spacing == null ? null : _headerItemTheme(spacing: spacing),
        );

    double gap(WidgetTester tester) =>
        tester.getRect(find.text('A')).left -
        tester.getRect(find.byType(ImpaktfullUiCheckbox)).right;

    testWidgets('is 8 between the checkbox and the title', (tester) async {
      await _pumpHeaderItem(tester, checkboxHeader());
      expect(gap(tester), 8);
    });

    testWidgets('of the theme is the space between them', (tester) async {
      await _pumpHeaderItem(tester, checkboxHeader(spacing: 24));
      expect(gap(tester), 24);
    });
  });

  group('the theme classes', () {
    test('copyWith changes one token and keeps the others', () {
      const dimens = ImpaktfullUiTableHeaderItemDimensTheme(
        padding: EdgeInsets.all(4),
        sortIconSize: 12,
      );
      final changed = dimens.copyWith(sortIconSpacing: 2);
      expect(changed.padding, const EdgeInsets.all(4));
      expect(changed.sortIconSize, 12);
      expect(changed.sortIconSpacing, 2);
      expect(dimens.copyWith(), dimens);

      const colors = ImpaktfullUiTableHeaderItemColorTheme();
      expect(colors.copyWith(sortIcon: const Color(0xFF00FF00)).sortIcon,
          const Color(0xFF00FF00));
      expect(colors.copyWith(), colors);
    });

    test('compare by value', () {
      expect(
        const ImpaktfullUiTableHeaderItemDimensTheme(sortIconSize: 12),
        const ImpaktfullUiTableHeaderItemDimensTheme(sortIconSize: 12),
      );
      expect(
        const ImpaktfullUiTableHeaderItemDimensTheme(sortIconSize: 12).hashCode,
        const ImpaktfullUiTableHeaderItemDimensTheme(sortIconSize: 12).hashCode,
      );
      expect(
        const ImpaktfullUiTableHeaderItemDimensTheme(sortIconSize: 12),
        isNot(const ImpaktfullUiTableHeaderItemDimensTheme()),
      );
      expect(
        const ImpaktfullUiTableHeaderItemColorTheme(
            sortIcon: Color(0xFF00FF00)),
        isNot(const ImpaktfullUiTableHeaderItemColorTheme()),
      );
    });
  });
}
