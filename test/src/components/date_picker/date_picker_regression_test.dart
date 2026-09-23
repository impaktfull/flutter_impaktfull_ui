import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/date_picker/widgets/date_picker_cell.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

import '../../../util/font_loader.dart';
import '../../../util/navigator_test_util.dart';
import '../../../util/test_util.dart';

List<ImpaktfullUiDatePickerCell> selectedCells(WidgetTester tester) => tester
    .widgetList<ImpaktfullUiDatePickerCell>(
      find.byType(ImpaktfullUiDatePickerCell),
    )
    .where((cell) => cell.isSelected)
    .toList();

void main() {
  setUpAll(() async => loadImpaktfullUiFonts());

  testWidgets('next month from the 31st does not skip a month', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiDatePicker(
        selectedDate: DateTime(2023, 1, 31),
        onDateChanged: (date) {},
      ),
    );
    expect(find.text('January 2023'), findsOneWidget);

    await tester.tap(find.byIcon(PhosphorIcons.arrowRight));
    await tester.pumpAndSettle();
    expect(find.text('February 2023'), findsOneWidget);

    await tester.tap(find.byIcon(PhosphorIcons.arrowRight));
    await tester.pumpAndSettle();
    expect(find.text('March 2023'), findsOneWidget);
  });

  group('Years view', () {
    Future<StateSetter> pumpControlled(
      WidgetTester tester,
      ValueNotifier<DateTime> date,
    ) async {
      late StateSetter setState;
      await pumpAndSettleComponent(
        tester,
        StatefulBuilder(
          builder: (context, setter) {
            setState = setter;
            return ImpaktfullUiDatePicker(
              selectedDate: date.value,
              onDateChanged: (value) {},
            );
          },
        ),
      );
      return setState;
    }

    testWidgets('highlights the selected year when the month differs',
        (tester) async {
      final date = ValueNotifier(DateTime(2023, 7, 6));
      final setState = await pumpControlled(tester, date);

      setState(() => date.value = DateTime(2023, 3, 6));
      await tester.pumpAndSettle();
      await tester.tap(find.text('March 2023'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('2023'));
      await tester.pumpAndSettle();

      final cells = selectedCells(tester);
      expect(cells, hasLength(1));
      expect(cells.single.value, '2023');
    });

    testWidgets('a new selected date in the years view shows its decade',
        (tester) async {
      final date = ValueNotifier(DateTime(2023, 7, 6));
      final setState = await pumpControlled(tester, date);

      await tester.tap(find.text('July 2023'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('2023'));
      await tester.pumpAndSettle();
      expect(find.text('Select a year'), findsOneWidget);

      setState(() => date.value = DateTime(2045, 5, 5));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(find.text('2040'), findsOneWidget);
      expect(find.text('2045'), findsOneWidget);
    });

    testWidgets('opening the years view from another year of the decade',
        (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiDatePicker(
          selectedDate: DateTime(2023, 7, 6),
          onDateChanged: (date) {},
        ),
      );
      await tester.tap(find.text('July 2023'));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(PhosphorIcons.arrowRight));
      await tester.pumpAndSettle();
      await tester.tap(find.text('2024'));
      await tester.pumpAndSettle();

      expect(find.text('2020'), findsOneWidget);
      expect(find.text('2029'), findsOneWidget);
    });
  });

  group('showModal', () {
    testWidgets('Cancel with rootNavigator closes the modal, not the page',
        (tester) async {
      final context = await pumpNestedNavigator(tester);
      var result = DateTime(1);
      unawaited(ImpaktfullUiDatePicker.showModal(
        context: context,
        selectedDate: DateTime(2023, 7, 6),
        rootNavigator: true,
      ).then((value) => result = value ?? DateTime(2)));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();
      expect(find.text('Cancel'), findsNothing);
      expect(find.text('Second page'), findsOneWidget);
      expect(result, DateTime(2));
    });

    testWidgets('Apply with rootNavigator returns the date', (tester) async {
      final context = await pumpNestedNavigator(tester);
      DateTime? result;
      unawaited(ImpaktfullUiDatePicker.showModal(
        context: context,
        selectedDate: DateTime(2023, 7, 6),
        rootNavigator: true,
      ).then((value) => result = value));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Apply'));
      await tester.pumpAndSettle();
      expect(find.text('Apply'), findsNothing);
      expect(find.text('Second page'), findsOneWidget);
      expect(result, DateTime(2023, 7, 6));
    });

    testWidgets('range Cancel with rootNavigator closes the modal',
        (tester) async {
      final context = await pumpNestedNavigator(tester);
      unawaited(ImpaktfullUiDatePicker.showRangeModal(
        context: context,
        rootNavigator: true,
      ));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();
      expect(find.text('Cancel'), findsNothing);
      expect(find.text('Second page'), findsOneWidget);
    });

    testWidgets('passes showDividers to the modal', (tester) async {
      final context = await pumpNestedNavigator(tester);
      unawaited(ImpaktfullUiDatePicker.showModal(
        context: context,
        showDividers: true,
      ));
      await tester.pumpAndSettle();
      expect(find.byType(ImpaktfullUiDivider), findsWidgets);
    });
  });
}
