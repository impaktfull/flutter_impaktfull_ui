import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  Future<void> pump(WidgetTester tester, ImpaktfullUiSeparatedColumn column) =>
      pumpAndSettleComponent(
        tester,
        Align(alignment: Alignment.topLeft, child: column),
      );

  int dividers(WidgetTester tester) =>
      find.byType(ImpaktfullUiDivider).evaluate().length;

  final dividerCases = <String, ({bool first, bool last, int expected})>{
    'between the children': (first: false, last: false, expected: 2),
    'first divider': (first: true, last: false, expected: 3),
    'last divider': (first: false, last: true, expected: 3),
    'first and last divider': (first: true, last: true, expected: 4),
  };
  for (final entry in dividerCases.entries) {
    testWidgets('dividers: ${entry.key}', (tester) async {
      await pump(
        tester,
        ImpaktfullUiSeparatedColumn(
          showFirstDivider: entry.value.first,
          showLastDivider: entry.value.last,
          children: const [Text('a'), Text('b'), Text('c')],
        ),
      );
      expect(dividers(tester), entry.value.expected);
    });
  }

  testWidgets('no dividers without children', (tester) async {
    await pump(
      tester,
      const ImpaktfullUiSeparatedColumn(
        showFirstDivider: true,
        showLastDivider: true,
        children: [],
      ),
    );
    expect(dividers(tester), 0);
  });

  testWidgets('the children are separated in order', (tester) async {
    await pump(
      tester,
      const ImpaktfullUiSeparatedColumn(
        children: [Text('a'), Text('b')],
      ),
    );
    final a = tester.getRect(find.text('a'));
    final divider = tester.getRect(find.byType(ImpaktfullUiDivider));
    final b = tester.getRect(find.text('b'));
    expect(divider.top, a.bottom);
    expect(b.top, divider.bottom);
  });

  testWidgets('shows the title above the children', (tester) async {
    await pump(
      tester,
      const ImpaktfullUiSeparatedColumn(
        title: 'Title',
        children: [Text('a')],
      ),
    );
    expect(find.byType(ImpaktfullUiSectionTitle), findsOneWidget);
    expect(
      tester.getRect(find.text('Title')).bottom,
      lessThan(tester.getRect(find.text('a')).top),
    );
  });

  testWidgets('no section title without a title', (tester) async {
    await pump(
      tester,
      const ImpaktfullUiSeparatedColumn(children: [Text('a')]),
    );
    expect(find.byType(ImpaktfullUiSectionTitle), findsNothing);
  });

  testWidgets('uses the margins', (tester) async {
    const titleMargin = EdgeInsets.all(3);
    const separatorMargin = EdgeInsets.all(5);
    await pump(
      tester,
      const ImpaktfullUiSeparatedColumn(
        title: 'Title',
        titleMargin: titleMargin,
        separatorMargin: separatorMargin,
        children: [Text('a'), Text('b')],
      ),
    );
    expect(
      tester
          .widget<ImpaktfullUiSectionTitle>(
              find.byType(ImpaktfullUiSectionTitle))
          .margin,
      titleMargin,
    );
    expect(
      tester
          .widget<ImpaktfullUiDivider>(find.byType(ImpaktfullUiDivider))
          .margin,
      separatorMargin,
    );
  });

  testWidgets('uses the theme margins by default', (tester) async {
    await pump(
      tester,
      const ImpaktfullUiSeparatedColumn(
        title: 'Title',
        children: [Text('a'), Text('b')],
      ),
    );
    final theme = ImpaktfullUiSeparatedColumnTheme.of(
      tester.element(find.byType(ImpaktfullUiSeparatedColumn)),
    );
    expect(
      tester
          .widget<ImpaktfullUiDivider>(find.byType(ImpaktfullUiDivider))
          .margin,
      theme.dimens.separatorMargin,
    );
    expect(
      tester
          .widget<ImpaktfullUiSectionTitle>(
              find.byType(ImpaktfullUiSectionTitle))
          .margin,
      theme.dimens.titleMargin,
    );
  });
}
