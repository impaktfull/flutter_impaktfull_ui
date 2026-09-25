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

  group('the input above the keys', () {
    /// The box that draws the line of text, and the card it sits in.
    (Rect text, Rect card) inputRects(WidgetTester tester) {
      final card = find.byType(ImpaktfullUiCard).first;
      final richText = find
          .descendant(of: card, matching: find.byType(RichText))
          .evaluate()
          .map((element) => element.widget as RichText)
          .firstWhere(
              (widget) => widget.text.toPlainText().contains('\u{fffc}'));
      return (tester.getRect(find.byWidget(richText)), tester.getRect(card));
    }

    testWidgets('shows the text it is given', (tester) async {
      await pumpComponent(
        tester,
        ImpaktfullUiVirtualKeyboard(controller: buildController('Hello')),
      );
      expect(shownText(tester), 'Hello');
      final (text, card) = inputRects(tester);
      expect(
        card.contains(text.topLeft) && card.contains(text.bottomLeft),
        isTrue,
        reason: 'the line fits in the card, so nothing is cut off',
      );
    });

    testWidgets('does not take the text style of the app around it',
        (tester) async {
      await pumpComponent(
        tester,
        DefaultTextStyle(
          // Taller than what is left of `keyHeight` once the card has its
          // padding: this used to cut the text in half.
          style: const TextStyle(fontSize: 48, height: 2),
          child: ImpaktfullUiVirtualKeyboard(
            controller: buildController('Hello'),
          ),
        ),
      );
      final (text, card) = inputRects(tester);
      expect(text.height, lessThan(card.height));
      expect(
        card.contains(text.topLeft) && card.contains(text.bottomLeft),
        isTrue,
      );
    });

    testWidgets('takes the text style of its theme', (tester) async {
      const style = TextStyle(fontSize: 10, height: 1);
      final base = ImpaktfullUiTheme.getDefault().components.virtualKeyboard;
      await pumpComponent(
        tester,
        ImpaktfullUiVirtualKeyboard(
          controller: buildController('Hello'),
          theme: base.copyWith(
            textStyles: base.textStyles.copyWith(text: style),
          ),
        ),
      );
      final richText = tester
          .widgetList<RichText>(find.descendant(
            of: find.byType(ImpaktfullUiCard).first,
            matching: find.byType(RichText),
          ))
          .firstWhere(
              (widget) => widget.text.toPlainText().contains('\u{fffc}'));
      expect(richText.text.style?.fontSize, 10);
    });
  });
}
