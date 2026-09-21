import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/font_loader.dart';
import '../../../util/navigator_test_util.dart';
import '../../../util/test_util.dart';

void main() {
  setUpAll(() async => loadImpaktfullUiFonts());

  final hoursField = find.byType(EditableText).first;
  String fieldText(WidgetTester tester, Finder finder) =>
      tester.widget<EditableText>(finder).controller.text;

  testWidgets('shows the initial value', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiDateTimePicker(
        value: DateTime(2023, 7, 6, 14, 30),
        onChanged: (value) {},
      ),
    );

    expect(find.text('July 2023'), findsOneWidget);
    expect(fieldText(tester, hoursField), '14');
    expect(fieldText(tester, find.byType(EditableText).last), '30');
  });

  testWidgets('changing only the time keeps the date of the value',
      (tester) async {
    DateTime? result;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiDateTimePicker(
        value: DateTime(2023, 7, 6, 14, 30),
        onChanged: (value) => result = value,
      ),
    );

    await tester.enterText(hoursField, '9');
    await tester.pumpAndSettle();
    expect(result, DateTime(2023, 7, 6, 9, 30));
  });

  testWidgets('changing only the time without a value uses today',
      (tester) async {
    DateTime? result;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiDateTimePicker(
        value: null,
        onChanged: (value) => result = value,
      ),
    );

    await tester.enterText(hoursField, '9');
    await tester.pumpAndSettle();
    final now = DateTime.now();
    expect(result?.year, now.year);
    expect(result?.month, now.month);
    expect(result?.day, now.day);
    expect(result?.hour, 9);
  });

  group('showModal', () {
    testWidgets('Cancel with rootNavigator closes the modal, not the page',
        (tester) async {
      final context = await pumpNestedNavigator(tester);
      unawaited(ImpaktfullUiDateTimePicker.showModal(
        context: context,
        value: DateTime(2023, 7, 6, 14, 30),
        rootNavigator: true,
      ));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();
      expect(find.text('Cancel'), findsNothing);
      expect(find.text('Second page'), findsOneWidget);
    });

    testWidgets('Apply with rootNavigator returns the value', (tester) async {
      final context = await pumpNestedNavigator(tester);
      DateTime? result;
      unawaited(ImpaktfullUiDateTimePicker.showModal(
        context: context,
        value: DateTime(2023, 7, 6, 14, 30),
        rootNavigator: true,
      ).then((value) => result = value));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Apply'));
      await tester.pumpAndSettle();
      expect(find.text('Apply'), findsNothing);
      expect(find.text('Second page'), findsOneWidget);
      expect(result, DateTime(2023, 7, 6, 14, 30));
    });

    testWidgets('passes showDividers to the modal', (tester) async {
      final context = await pumpNestedNavigator(tester);
      unawaited(ImpaktfullUiDateTimePicker.showModal(
        context: context,
        showDividers: true,
      ));
      await tester.pumpAndSettle();
      expect(find.byType(ImpaktfullUiDivider), findsWidgets);
    });
  });
}
