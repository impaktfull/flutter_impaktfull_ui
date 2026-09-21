import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/virtual_keyboard/widget/virtual_keyboard_button.dart';

import '../../../util/test_util.dart';

void main() {
  ImpaktfullUiVirtualKeyboardTextEditController buildController(
          [String text = '']) =>
      ImpaktfullUiVirtualKeyboardTextEditController(
        text: text,
        config: ImpaktfullUiVirtualQwertyKeyboardConfig(),
      );

  /// The text shown in the input of the keyboard (the cursor is a placeholder)
  String shownText(WidgetTester tester) {
    final richText = tester
        .widgetList<RichText>(find.descendant(
          of: find.byType(ImpaktfullUiCard),
          matching: find.byType(RichText),
        ))
        .firstWhere((richText) => richText.text.toPlainText().contains('￼'));
    return richText.text.toPlainText().replaceAll('￼', '');
  }

  Finder keyButton(LogicalKeyboardKey key) => find.byWidgetPredicate(
        (widget) =>
            widget is ImpaktfullUiVirtualKeyboardButton &&
            widget.virtualKeyboardKey.defaultKey.key == key,
      );

  Future<void> tapKey(WidgetTester tester, LogicalKeyboardKey key) async {
    await tester.tap(keyButton(key));
    await tester.pump();
  }

  testWidgets('the show/hide password button toggles the obscured text',
      (tester) async {
    final controller = buildController('abc');
    await pumpComponent(
      tester,
      ImpaktfullUiVirtualKeyboard(
        controller: controller,
        obscureText: true,
      ),
    );
    expect(shownText(tester), '•••');

    await tester.tap(find.byType(ImpaktfullUiIconButton));
    await tester.pump();
    expect(shownText(tester), 'abc');

    await tester.tap(find.byType(ImpaktfullUiIconButton));
    await tester.pump();
    expect(shownText(tester), '•••');
  });

  testWidgets('shift + a symbol key types the shifted symbol', (tester) async {
    final controller = buildController();
    await pumpComponent(
      tester,
      ImpaktfullUiVirtualKeyboard(controller: controller),
    );
    await tapKey(tester, LogicalKeyboardKey.shiftLeft);
    await tapKey(tester, LogicalKeyboardKey.digit1);
    expect(controller.text, '!');

    // Shift is released after one character
    await tapKey(tester, LogicalKeyboardKey.digit1);
    expect(controller.text, '!1');
  });

  testWidgets('shift + a letter types the uppercase letter', (tester) async {
    final controller = buildController();
    await pumpComponent(
      tester,
      ImpaktfullUiVirtualKeyboard(controller: controller),
    );
    await tapKey(tester, LogicalKeyboardKey.shiftLeft);
    await tapKey(tester, LogicalKeyboardKey.keyA);
    await tapKey(tester, LogicalKeyboardKey.keyA);
    expect(controller.text, 'Aa');
  });

  testWidgets('clearing the controller does not throw', (tester) async {
    final controller = buildController('hello');
    await pumpComponent(
      tester,
      ImpaktfullUiVirtualKeyboard(controller: controller),
    );
    expect(shownText(tester), 'hello');

    controller.clear();
    await tester.pump();
    expect(tester.takeException(), isNull);
    expect(shownText(tester), '');

    await tapKey(tester, LogicalKeyboardKey.keyB);
    expect(tester.takeException(), isNull);
    expect(controller.text, 'b');
  });

  testWidgets('shortening the text from outside does not throw',
      (tester) async {
    final controller = buildController('hello');
    await pumpComponent(
      tester,
      ImpaktfullUiVirtualKeyboard(controller: controller),
    );
    controller.text = 'hi';
    await tester.pump();
    expect(tester.takeException(), isNull);

    await tapKey(tester, LogicalKeyboardKey.backspace);
    expect(tester.takeException(), isNull);
    expect(controller.text, 'h');
  });

  testWidgets('holding a key waits before repeating it', (tester) async {
    final controller = buildController();
    await pumpComponent(
      tester,
      ImpaktfullUiVirtualKeyboard(controller: controller),
    );
    final gesture = await tester
        .startGesture(tester.getCenter(keyButton(LogicalKeyboardKey.keyA)));
    // The tap down is reported after the press timeout
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pump(const Duration(milliseconds: 150));
    expect(controller.text, 'a');

    // Keeps repeating after the initial delay
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pump(const Duration(milliseconds: 250));
    expect(controller.text.length, greaterThan(1));

    await gesture.up();
    await tester.pump();
    final length = controller.text.length;
    await tester.pump(const Duration(seconds: 1));
    expect(controller.text.length, length);
  });
}
