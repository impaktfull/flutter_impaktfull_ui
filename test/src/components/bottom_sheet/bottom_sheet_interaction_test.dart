import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/font_loader.dart';
import '../../../util/navigator_test_util.dart';
import '../_overlays_test_helpers.dart';

Finder get _closeButton => find.descendant(
      of: find.byType(ImpaktfullUiBottomSheet),
      matching: find.byType(ImpaktfullUiIconButton),
    );

void main() {
  setUpAll(() async => loadImpaktfullUiFonts());

  testWidgets('show returns the value the sheet is popped with',
      (tester) async {
    final context = await pumpOverlayApp(tester);
    String? result;
    unawaited(ImpaktfullUiBottomSheet.show<String>(
      context: context,
      builder: (context) => ImpaktfullUiBottomSheet(
        title: 'Sheet',
        actions: [
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: 'Pick',
            onTap: () => Navigator.of(context).pop('picked'),
          ),
        ],
      ),
    ).then((value) => result = value));
    await tester.pumpAndSettle();

    await tapAndSettle(tester, find.text('Pick'));
    expect(result, 'picked');
    expect(find.text('Sheet'), findsNothing);
  });

  testWidgets('the close button returns null', (tester) async {
    final context = await pumpOverlayApp(tester);
    var completed = false;
    String? result = 'initial';
    unawaited(ImpaktfullUiBottomSheet.showSimple<String>(
      context: context,
      title: 'Sheet',
    ).then((value) {
      completed = true;
      result = value;
    }));
    await tester.pumpAndSettle();

    await tapAndSettle(tester, _closeButton);
    expect(completed, isTrue);
    expect(result, isNull);
  });

  testWidgets('tapping the content does not close the sheet', (tester) async {
    final context = await pumpOverlayApp(tester);
    unawaited(ImpaktfullUiBottomSheet.showSimple<void>(
      context: context,
      title: 'Sheet',
      subtitle: 'Subtitle',
      child: const SizedBox(height: 100, child: Text('Content')),
    ));
    await tester.pumpAndSettle();

    await tapAndSettle(tester, find.text('Content'));
    await tapAndSettle(tester, find.text('Subtitle'));
    expect(find.text('Sheet'), findsOneWidget);
  });

  testWidgets('tapping outside closes the sheet', (tester) async {
    final context = await pumpOverlayApp(tester);
    var completed = false;
    unawaited(ImpaktfullUiBottomSheet.showSimple<void>(
      context: context,
      title: 'Sheet',
    ).then((_) => completed = true));
    await tester.pumpAndSettle();

    await tester.tapAt(const Offset(5, 5));
    await tester.pumpAndSettle();
    expect(find.text('Sheet'), findsNothing);
    expect(completed, isTrue);
  });

  testWidgets('escape closes the sheet', (tester) async {
    final context = await pumpOverlayApp(tester);
    unawaited(ImpaktfullUiBottomSheet.showSimple<void>(
      context: context,
      title: 'Sheet',
    ));
    await tester.pumpAndSettle();

    await tester.sendKeyEvent(LogicalKeyboardKey.escape);
    await tester.pumpAndSettle();
    expect(find.text('Sheet'), findsNothing);
  });

  testWidgets('dragging it down closes the sheet', (tester) async {
    final context = await pumpOverlayApp(tester);
    unawaited(ImpaktfullUiBottomSheet.showSimple<void>(
      context: context,
      title: 'Sheet',
      child: const SizedBox(height: 200),
    ));
    await tester.pumpAndSettle();

    await tester.fling(find.text('Sheet'), const Offset(0, 400), 2000);
    await tester.pumpAndSettle();
    expect(find.text('Sheet'), findsNothing);
  });

  testWidgets('without hasClose there is no close button', (tester) async {
    final context = await pumpOverlayApp(tester);
    unawaited(ImpaktfullUiBottomSheet.showSimple<void>(
      context: context,
      title: 'Sheet',
      hasClose: false,
    ));
    await tester.pumpAndSettle();
    expect(_closeButton, findsNothing);
  });

  testWidgets('uses the background of the theme', (tester) async {
    final context = await pumpOverlayApp(tester);
    final theme = ImpaktfullUiBottomSheetTheme.of(context);
    unawaited(ImpaktfullUiBottomSheet.showSimple<void>(
      context: context,
      title: 'Sheet',
    ));
    await tester.pumpAndSettle();
    final sheet = tester.widget<BottomSheet>(find.byType(BottomSheet));
    expect(sheet.backgroundColor, theme.colors.background);
  });

  testWidgets('rootNavigator shows it on the root navigator', (tester) async {
    final context = await pumpNestedNavigator(tester);
    unawaited(ImpaktfullUiBottomSheet.showSimple<void>(
      context: context,
      title: 'Sheet',
      rootNavigator: true,
    ));
    await tester.pumpAndSettle();
    final rootNavigator = tester.state<NavigatorState>(
      find.byType(Navigator).first,
    );
    expect(Navigator.of(tester.element(find.text('Sheet'))), rootNavigator);

    await tapAndSettle(tester, _closeButton);
    expect(find.text('Sheet'), findsNothing);
    expect(find.text('Second page'), findsOneWidget);
  });

  testWidgets('used inline, a tap on it does not pop the page', (tester) async {
    final context = await pumpOverlayApp(tester);
    unawaited(Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => const Align(
          alignment: Alignment.bottomCenter,
          child: ImpaktfullUiBottomSheet(
            title: 'Inline',
            hasClose: false,
            child: SizedBox(height: 100, child: Text('Content')),
          ),
        ),
      ),
    ));
    await tester.pumpAndSettle();

    await tapAndSettle(tester, find.text('Content'));
    await tapAndSettle(tester, find.text('Inline'));
    expect(find.text('Inline'), findsOneWidget);
  });
}
