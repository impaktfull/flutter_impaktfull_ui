import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  Finder previous() => find.byType(ImpaktfullUiButton).first;
  Finder next() => find.byType(ImpaktfullUiButton).last;

  bool isEnabled(WidgetTester tester, Finder button) =>
      tester.widget<ImpaktfullUiButton>(button).onTap != null;

  testWidgets('next and previous change the page', (tester) async {
    var page = 0;
    final loaded = <int>[];
    await pumpAndSettleComponent(
      tester,
      StatefulBuilder(
        builder: (context, setState) => ImpaktfullUiPagination(
          page: page,
          itemsPerPage: 10,
          amountOfItems: 25,
          onPageChanged: (value) {
            loaded.add(value);
            setState(() => page = value);
          },
        ),
      ),
    );
    expect(find.text('Page 1 of 3'), findsOneWidget);

    await tester.tap(next());
    await tester.pumpAndSettle();
    expect(find.text('Page 2 of 3'), findsOneWidget);

    await tester.tap(next());
    await tester.pumpAndSettle();
    expect(find.text('Page 3 of 3'), findsOneWidget);
    expect(isEnabled(tester, next()), isFalse);

    await tester.tap(previous());
    await tester.pumpAndSettle();
    expect(find.text('Page 2 of 3'), findsOneWidget);
    expect(loaded, [1, 2, 1]);
  });

  testWidgets('previous is disabled on the first page', (tester) async {
    final loaded = <int>[];
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiPagination(
        page: 0,
        itemsPerPage: 10,
        amountOfItems: 25,
        onPageChanged: loaded.add,
      ),
    );
    expect(isEnabled(tester, previous()), isFalse);
    expect(isEnabled(tester, next()), isTrue);
    await tester.tap(previous());
    await tester.pumpAndSettle();
    expect(loaded, isEmpty);
  });

  testWidgets('next is disabled on the last page', (tester) async {
    final loaded = <int>[];
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiPagination.withAmountOfPages(
        page: 4,
        itemsPerPage: 10,
        amountOfPages: 5,
        onPageChanged: loaded.add,
      ),
    );
    expect(find.text('Page 5 of 5'), findsOneWidget);
    expect(isEnabled(tester, previous()), isTrue);
    expect(isEnabled(tester, next()), isFalse);
    await tester.tap(next());
    await tester.pumpAndSettle();
    expect(loaded, isEmpty);
  });

  testWidgets('without items there is one page', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiPagination(
        page: 0,
        itemsPerPage: 10,
        amountOfItems: 0,
        onPageChanged: (_) {},
      ),
    );
    expect(find.text('Page 1 of 1'), findsOneWidget);
    expect(isEnabled(tester, previous()), isFalse);
    expect(isEnabled(tester, next()), isFalse);
  });

  group('amountOfPages', () {
    final cases = <int, int>{0: 0, 1: 1, 10: 1, 11: 2, 20: 2, 21: 3};
    for (final entry in cases.entries) {
      test('${entry.key} items of 10 per page', () {
        final pagination = ImpaktfullUiPagination(
          page: 0,
          itemsPerPage: 10,
          amountOfItems: entry.key,
          onPageChanged: (_) {},
        );
        expect(pagination.amountOfPages, entry.value);
      });
    }

    test('isFinalPage', () {
      ImpaktfullUiPagination pagination(int page) =>
          ImpaktfullUiPagination.withAmountOfPages(
            page: page,
            itemsPerPage: 10,
            amountOfPages: 3,
            onPageChanged: (_) {},
          );
      expect(pagination(0).isFinalPage, isFalse);
      expect(pagination(1).isFinalPage, isFalse);
      expect(pagination(2).isFinalPage, isTrue);
    });
  });
}
