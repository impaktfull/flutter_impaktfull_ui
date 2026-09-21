import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/navigator_test_util.dart';

void main() {
  Future<void> tapClose(WidgetTester tester) async {
    await tester.tap(
      find.descendant(
        of: find.byType(ImpaktfullUiBottomSheet),
        matching: find.byType(ImpaktfullUiIconButton),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('closes when onCloseTapped returns true', (tester) async {
    final context = await pumpNestedNavigator(tester);
    var calls = 0;
    unawaited(ImpaktfullUiBottomSheet.showSimple<void>(
      context: context,
      title: 'Sheet',
      onCloseTapped: () async {
        calls++;
        return true;
      },
    ));
    await tester.pumpAndSettle();
    expect(find.text('Sheet'), findsOneWidget);

    await tapClose(tester);
    expect(calls, 1);
    expect(find.text('Sheet'), findsNothing);
    expect(find.text('Second page'), findsOneWidget);
  });

  testWidgets('stays open when onCloseTapped returns false', (tester) async {
    final context = await pumpNestedNavigator(tester);
    unawaited(ImpaktfullUiBottomSheet.showSimple<void>(
      context: context,
      title: 'Sheet',
      onCloseTapped: () async => false,
    ));
    await tester.pumpAndSettle();

    await tapClose(tester);
    expect(find.text('Sheet'), findsOneWidget);
  });

  testWidgets('does not pop twice when onCloseTapped pops itself',
      (tester) async {
    final context = await pumpNestedNavigator(tester);
    unawaited(ImpaktfullUiBottomSheet.show<void>(
      context: context,
      builder: (sheetContext) => ImpaktfullUiBottomSheet(
        title: 'Sheet',
        onCloseTapped: () async {
          Navigator.of(sheetContext).pop();
          return true;
        },
      ),
    ));
    await tester.pumpAndSettle();

    await tapClose(tester);
    expect(find.text('Sheet'), findsNothing);
    expect(find.text('Second page'), findsOneWidget);
  });
}
