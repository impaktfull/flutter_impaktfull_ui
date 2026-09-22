import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/virtual_keyboard/widget/virtual_keyboard_button.dart';

import '../../../util/test_util.dart';
import '../_inputs_test_helpers.dart';

void main() {
  ImpaktfullUiVirtualKeyboardTextEditController buildController(
          [String text = '']) =>
      ImpaktfullUiVirtualKeyboardTextEditController(
        text: text,
        config: ImpaktfullUiVirtualQwertyKeyboardConfig(),
      );

  Finder keyButton(LogicalKeyboardKey key) => find.byWidgetPredicate(
        (widget) =>
            widget is ImpaktfullUiVirtualKeyboardButton &&
            widget.virtualKeyboardKey.defaultKey.key == key,
      );

  Future<void> tapKey(WidgetTester tester, LogicalKeyboardKey key) async {
    await tester.tap(keyButton(key));
    await tester.pump();
  }

  testWidgets('tapping keys types the text and calls onChanged',
      (tester) async {
    final controller = buildController();
    final changes = <String>[];
    await pumpComponent(
      tester,
      ImpaktfullUiVirtualKeyboard(
        controller: controller,
        onChanged: changes.add,
      ),
    );
    await tapKey(tester, LogicalKeyboardKey.keyH);
    await tapKey(tester, LogicalKeyboardKey.keyI);
    await tapKey(tester, LogicalKeyboardKey.space);
    await tapKey(tester, LogicalKeyboardKey.digit7);
    expect(controller.text, 'hi 7');
    expect(changes, ['h', 'hi', 'hi ', 'hi 7']);
  });

  testWidgets('backspace removes the last character', (tester) async {
    final controller = buildController('abc');
    final changes = <String>[];
    await pumpComponent(
      tester,
      ImpaktfullUiVirtualKeyboard(
        controller: controller,
        onChanged: changes.add,
      ),
    );
    await tapKey(tester, LogicalKeyboardKey.backspace);
    expect(controller.text, 'ab');
    expect(changes, ['ab']);
  });

  testWidgets('backspace on an empty text does not call onChanged',
      (tester) async {
    final controller = buildController();
    final changes = <String>[];
    await pumpComponent(
      tester,
      ImpaktfullUiVirtualKeyboard(
        controller: controller,
        onChanged: changes.add,
      ),
    );
    await tapKey(tester, LogicalKeyboardKey.backspace);
    expect(controller.text, isEmpty);
    expect(changes, isEmpty);
  });

  testWidgets('the arrow keys move the cursor', (tester) async {
    final controller = buildController('ac');
    await pumpComponent(
      tester,
      ImpaktfullUiVirtualKeyboard(controller: controller),
    );
    await tapKey(tester, LogicalKeyboardKey.arrowLeft);
    await tapKey(tester, LogicalKeyboardKey.keyB);
    expect(controller.text, 'abc');

    // The cursor can not move before the start or after the end
    for (var i = 0; i < 5; i++) {
      await tapKey(tester, LogicalKeyboardKey.arrowLeft);
    }
    await tapKey(tester, LogicalKeyboardKey.keyX);
    expect(controller.text, 'xabc');
    for (var i = 0; i < 10; i++) {
      await tapKey(tester, LogicalKeyboardKey.arrowRight);
    }
    await tapKey(tester, LogicalKeyboardKey.keyY);
    expect(controller.text, 'xabcy');
  });

  testWidgets('backspace removes the character before the cursor',
      (tester) async {
    final controller = buildController('abc');
    await pumpComponent(
      tester,
      ImpaktfullUiVirtualKeyboard(controller: controller),
    );
    await tapKey(tester, LogicalKeyboardKey.arrowLeft);
    await tapKey(tester, LogicalKeyboardKey.backspace);
    expect(controller.text, 'ac');
  });

  testWidgets('enter calls onSubmitted', (tester) async {
    var submits = 0;
    await pumpComponent(
      tester,
      ImpaktfullUiVirtualKeyboard(
        controller: buildController('abc'),
        onSubmitted: () => submits++,
      ),
    );
    await tapKey(tester, LogicalKeyboardKey.enter);
    expect(submits, 1);
  });

  testWidgets('caps lock keeps typing uppercase letters until toggled off',
      (tester) async {
    final controller = buildController();
    await pumpComponent(
      tester,
      ImpaktfullUiVirtualKeyboard(controller: controller),
    );
    await tapKey(tester, LogicalKeyboardKey.capsLock);
    await tapKey(tester, LogicalKeyboardKey.keyA);
    await tapKey(tester, LogicalKeyboardKey.keyB);
    await tapKey(tester, LogicalKeyboardKey.digit1);
    await tapKey(tester, LogicalKeyboardKey.capsLock);
    await tapKey(tester, LogicalKeyboardKey.keyC);
    expect(controller.text, 'AB1c');
  });

  testWidgets('a new controller from the parent is used', (tester) async {
    final first = buildController('first');
    final second = buildController('second');
    final controller = ValueNotifier(first);
    await pumpComponent(
      tester,
      ValueListenableBuilder<ImpaktfullUiVirtualKeyboardTextEditController>(
        valueListenable: controller,
        builder: (context, value, child) =>
            ImpaktfullUiVirtualKeyboard(controller: value),
      ),
    );
    controller.value = second;
    await tester.pump();
    await tapKey(tester, LogicalKeyboardKey.keyX);
    expect(second.text, 'secondx');
    expect(first.text, 'first');

    // The old controller is no longer listened to
    first.text = 'changed';
    await tester.pump();
    expect(tester.takeException(), isNull);
  });

  testWidgets('a new obscureText from the parent is used', (tester) async {
    final obscure = ValueNotifier(false);
    await pumpComponent(
      tester,
      ValueListenableBuilder<bool>(
        valueListenable: obscure,
        builder: (context, value, child) => ImpaktfullUiVirtualKeyboard(
          controller: buildController('abc'),
          obscureText: value,
        ),
      ),
    );
    expect(find.byType(ImpaktfullUiIconButton), findsNothing);
    obscure.value = true;
    await tester.pump();
    expect(find.byType(ImpaktfullUiIconButton), findsOneWidget);
    expect(find.textContaining('•••', findRichText: true), findsOneWidget);
  });

  testWidgets('the theme override is used', (tester) async {
    final theme = defaultComponentsTheme.virtualKeyboard;
    await pumpComponent(
      tester,
      ImpaktfullUiVirtualKeyboard(
        controller: buildController('abc'),
        obscureText: true,
        theme: theme.copyWith(
          assets: theme.assets.copyWith(passwordHide: customTestAsset),
          colors: theme.colors.copyWith(cursor: customTestColor),
        ),
      ),
    );
    expect(
      tester
          .widget<ImpaktfullUiIconButton>(find.byType(ImpaktfullUiIconButton))
          .asset,
      same(customTestAsset),
    );
    expect(
      find.byWidgetPredicate(
          (widget) => widget is Container && widget.color == customTestColor),
      findsOneWidget,
    );
  });
}
