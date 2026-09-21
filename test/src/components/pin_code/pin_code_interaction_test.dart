import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/pin_code/widget/pin_code_button.dart';

import '../../../util/test_util.dart';
import '../_inputs_test_helpers.dart';

void main() {
  Widget sized(Widget child) =>
      Center(child: SizedBox(width: 300, height: 420, child: child));

  Finder numberButton(String number) => find.byWidgetPredicate((widget) =>
      widget is ImpaktfullUiPinCodeButton && widget.value == number);

  Finder assetButton(ImpaktfullUiAsset asset) => find.byWidgetPredicate(
      (widget) => widget is ImpaktfullUiPinCodeButton && widget.asset == asset);

  Finder backspaceButton() => find
      .byWidgetPredicate((widget) =>
          widget is ImpaktfullUiPinCodeButton && widget.value == null)
      .first;

  Finder checkButton() => find
      .byWidgetPredicate((widget) =>
          widget is ImpaktfullUiPinCodeButton && widget.value == null)
      .at(1);

  Finder iconButtons() => find.byWidgetPredicate(
      (widget) => widget is ImpaktfullUiPinCodeButton && widget.value == null);

  /// The colors of the value indicators, from left to right
  List<Color?> valueColors(WidgetTester tester) => tester
      .widgetList<Container>(find.descendant(
        of: find.byType(ImpaktfullUiPinCode),
        matching: find.byWidgetPredicate((widget) =>
            widget is Container &&
            widget.constraints?.maxWidth == 16 &&
            widget.constraints?.maxHeight == 16),
      ))
      .map((container) => (container.decoration as BoxDecoration).color)
      .toList();

  testWidgets('the number buttons add a digit to the code', (tester) async {
    final codes = <String>[];
    await pumpAndSettleComponent(
      tester,
      sized(ImpaktfullUiPinCode(code: '', onChanged: codes.add)),
    );
    for (final number in ['1', '0', '9']) {
      await tester.tap(numberButton(number));
      await tester.pump();
    }
    expect(codes, ['1', '10', '109']);
  });

  testWidgets('no digit is added when the code is complete', (tester) async {
    final codes = <String>[];
    await pumpAndSettleComponent(
      tester,
      sized(ImpaktfullUiPinCode(code: '12', length: 2, onChanged: codes.add)),
    );
    await tester.tap(numberButton('3'));
    await tester.pump();
    expect(codes, isEmpty);
  });

  testWidgets('the backspace button removes the last digit', (tester) async {
    final codes = <String>[];
    await pumpAndSettleComponent(
      tester,
      sized(ImpaktfullUiPinCode(code: '123', onChanged: codes.add)),
    );
    await tester.tap(backspaceButton());
    await tester.pump();
    expect(codes, ['12']);
  });

  testWidgets('backspace on an empty code does not call onChanged',
      (tester) async {
    final codes = <String>[];
    await pumpAndSettleComponent(
      tester,
      sized(ImpaktfullUiPinCode(code: '', onChanged: codes.add)),
    );
    await tester.tap(backspaceButton());
    await tester.pump();
    expect(codes, isEmpty);
  });

  group('submit', () {
    testWidgets('is hidden without onSubmit', (tester) async {
      await pumpAndSettleComponent(
        tester,
        sized(ImpaktfullUiPinCode(code: '', onChanged: (_) {})),
      );
      expect(iconButtons(), findsOneWidget);
    });

    testWidgets('is disabled until the code is complete', (tester) async {
      final submitted = <String>[];
      await pumpAndSettleComponent(
        tester,
        sized(ImpaktfullUiPinCode(
          code: '123',
          onChanged: (_) {},
          onSubmit: submitted.add,
        )),
      );
      expect(tester.widget<ImpaktfullUiPinCodeButton>(checkButton()).onTap,
          isNull);
      await tester.tap(checkButton(), warnIfMissed: false);
      await tester.pump();
      expect(submitted, isEmpty);

      await tester.tap(numberButton('4'));
      await tester.pump();
      await tester.tap(checkButton());
      await tester.pump();
      expect(submitted, ['1234']);
    });
  });

  group('keyboard', () {
    testWidgets('backspace removes the last digit', (tester) async {
      final codes = <String>[];
      await pumpAndSettleComponent(
        tester,
        sized(ImpaktfullUiPinCode(code: '12', onChanged: codes.add)),
      );
      await tester.sendKeyEvent(LogicalKeyboardKey.backspace);
      await tester.pump();
      expect(codes, ['1']);
    });

    testWidgets('enter submits a complete code', (tester) async {
      final submitted = <String>[];
      await pumpAndSettleComponent(
        tester,
        sized(ImpaktfullUiPinCode(
          code: '123',
          onChanged: (_) {},
          onSubmit: submitted.add,
        )),
      );
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pump();
      expect(submitted, isEmpty);

      await tester.sendKeyEvent(LogicalKeyboardKey.digit9);
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pump();
      expect(submitted, ['1239']);
    });

    testWidgets('other keys are ignored', (tester) async {
      final codes = <String>[];
      await pumpAndSettleComponent(
        tester,
        sized(ImpaktfullUiPinCode(code: '', onChanged: codes.add)),
      );
      await tester.sendKeyEvent(LogicalKeyboardKey.keyA);
      await tester.pump();
      expect(codes, isEmpty);
    });
  });

  testWidgets('a new code from the parent is shown', (tester) async {
    final theme = defaultComponentsTheme.pinCode;
    final code = ValueNotifier('');
    await pumpAndSettleComponent(
      tester,
      sized(ValueListenableBuilder<String>(
        valueListenable: code,
        builder: (context, value, child) =>
            ImpaktfullUiPinCode(code: value, onChanged: (_) {}),
      )),
    );
    expect(valueColors(tester), List.filled(4, theme.colors.valueBackground));

    code.value = '12';
    await tester.pumpAndSettle();
    expect(valueColors(tester), [
      theme.colors.valueBackgroundSelected,
      theme.colors.valueBackgroundSelected,
      theme.colors.valueBackground,
      theme.colors.valueBackground,
    ]);
  });

  testWidgets('the length sets the number of value indicators', (tester) async {
    await pumpAndSettleComponent(
      tester,
      sized(ImpaktfullUiPinCode(code: '', length: 6, onChanged: (_) {})),
    );
    expect(valueColors(tester), hasLength(6));
  });

  testWidgets('the theme override is used', (tester) async {
    final theme = defaultComponentsTheme.pinCode;
    await pumpAndSettleComponent(
      tester,
      sized(ImpaktfullUiPinCode(
        code: '1',
        onChanged: (_) {},
        theme: theme.copyWith(
          assets: theme.assets.copyWith(backspace: customTestAsset),
          colors: theme.colors.copyWith(
            valueBackgroundSelected: customTestColor,
          ),
        ),
      )),
    );
    expect(assetButton(customTestAsset), findsOneWidget);
    expect(valueColors(tester).first, customTestColor);
  });
}
