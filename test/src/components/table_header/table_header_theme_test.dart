import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../_core_test_helpers.dart';

/// Proves that the background and the border of the header of a table come
/// from [ImpaktfullUiTableHeaderTheme]. Without a `border` the header draws
/// none, like before the token existed: the table puts a divider below it.

ImpaktfullUiTableHeaderTheme _headerTheme({
  Color? background,
  Color? border,
  double? borderWidth,
}) {
  final base = ImpaktfullUiTheme.getDefault().components.tableHeader;
  return base.copyWith(
    colors: base.colors.copyWith(background: background, border: border),
    dimens: base.dimens.copyWith(borderWidth: borderWidth),
  );
}

Future<void> _pumpHeader(
  WidgetTester tester, {
  ImpaktfullUiTableHeaderTheme? theme,
}) =>
    pumpImpaktfullUiApp(
      tester,
      Material(
        child: Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: 300,
            child: ImpaktfullUiTableHeader(
              titles: const [ImpaktfullUiTableHeaderItem(title: 'A')],
              theme: theme,
            ),
          ),
        ),
      ),
    );

/// The decoration the header paints.
BoxDecoration _decoration(WidgetTester tester) => tester
    .widgetList<Container>(
      find.descendant(
        of: find.byType(ImpaktfullUiTableHeader),
        matching: find.byType(Container),
      ),
    )
    .first
    .decoration! as BoxDecoration;

void main() {
  testWidgets('background is the background of the header', (tester) async {
    await _pumpHeader(tester);
    expect(
      _decoration(tester).color,
      ImpaktfullUiTheme.getDefault().colors.canvas,
    );

    await _pumpHeader(tester, theme: _headerTheme(background: Colors.amber));
    expect(_decoration(tester).color, Colors.amber);
  });

  group('border', () {
    testWidgets('is not drawn without the token', (tester) async {
      await _pumpHeader(tester);
      expect(_decoration(tester).border, isNull);
      expect(
        ImpaktfullUiTheme.getDefault().components.tableHeader.colors.border,
        isNull,
      );
    });

    testWidgets('is drawn below the header', (tester) async {
      await _pumpHeader(tester, theme: _headerTheme(border: Colors.red));
      final border = _decoration(tester).border! as Border;
      expect(border.bottom.color, Colors.red);
      expect(border.bottom.width, 1);
      expect(border.top, BorderSide.none);
    });

    testWidgets('borderWidth is its thickness', (tester) async {
      await _pumpHeader(
        tester,
        theme: _headerTheme(border: Colors.red, borderWidth: 3),
      );
      expect((_decoration(tester).border! as Border).bottom.width, 3);
      expect(
        ImpaktfullUiTheme.getDefault()
            .components
            .tableHeader
            .dimens
            .borderWidth,
        1,
      );
    });

    testWidgets('borderWidth alone draws nothing', (tester) async {
      await _pumpHeader(tester, theme: _headerTheme(borderWidth: 3));
      expect(_decoration(tester).border, isNull);
    });
  });

  group('the theme classes', () {
    test('copyWith changes one token and keeps the others', () {
      const colors = ImpaktfullUiTableHeaderColorTheme(
        background: Color(0xFF111111),
      );
      final changed = colors.copyWith(border: const Color(0xFF222222));
      expect(changed.background, const Color(0xFF111111));
      expect(changed.border, const Color(0xFF222222));
      expect(colors.copyWith(), colors);

      final dimens = ImpaktfullUiTheme.getDefault()
          .components
          .tableHeader
          .dimens
          .copyWith(borderWidth: 2);
      expect(dimens.borderWidth, 2);
      expect(dimens.minHeight, 48);
    });

    test('compare by value', () {
      expect(
        const ImpaktfullUiTableHeaderColorTheme(background: Color(0xFF111111)),
        const ImpaktfullUiTableHeaderColorTheme(background: Color(0xFF111111)),
      );
      expect(
        const ImpaktfullUiTableHeaderColorTheme(
          background: Color(0xFF111111),
        ).hashCode,
        const ImpaktfullUiTableHeaderColorTheme(
          background: Color(0xFF111111),
        ).hashCode,
      );
      expect(
        const ImpaktfullUiTableHeaderColorTheme(
          background: Color(0xFF111111),
          border: Color(0xFF222222),
        ),
        isNot(const ImpaktfullUiTableHeaderColorTheme(
          background: Color(0xFF111111),
        )),
      );
      final dimens =
          ImpaktfullUiTheme.getDefault().components.tableHeader.dimens;
      expect(dimens.copyWith(borderWidth: 2), isNot(dimens.copyWith()));
    });
  });
}
