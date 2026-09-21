import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/command_menu/commander/commander.dart';

import '../../../util/font_loader.dart';
import '../_overlays_test_helpers.dart';

const _shortcut = SingleActivator(LogicalKeyboardKey.keyK, control: true);

class _Menu {
  late ImpaktfullUiCommandMenuController controller;
  final inputs = <String>[];
  var closeRequests = 0;
}

Future<_Menu> _pumpMenu(
  WidgetTester tester, {
  ShortcutActivator? shortcutActivator = _shortcut,
}) async {
  final menu = _Menu();
  await pumpOverlayApp(
    tester,
    home: ImpaktfullUiCommandMenu(
      shortcutActivator: shortcutActivator,
      autofocus: true,
      builder: (context, theme, controller) {
        menu.controller = controller;
        return ImpaktfullUiCommandMenuWindow(
          onInputChanged: menu.inputs.add,
          onCloseWindow: () {
            menu.closeRequests++;
            controller.hide();
          },
          bottomBuilder: (context) => const Text('Results'),
        );
      },
      child: const Center(child: Text('Page')),
    ),
  );
  return menu;
}

Future<void> _pressShortcut(WidgetTester tester) async {
  await tester.sendKeyDownEvent(LogicalKeyboardKey.controlLeft);
  await tester.sendKeyEvent(LogicalKeyboardKey.keyK);
  await tester.sendKeyUpEvent(LogicalKeyboardKey.controlLeft);
  await tester.pumpAndSettle();
}

Finder get _window => find.byType(ImpaktfullUiCommandMenuWindow);

void main() {
  setUpAll(() async => loadImpaktfullUiFonts());

  testWidgets('without a shortcut only the child is shown', (tester) async {
    await _pumpMenu(tester, shortcutActivator: null);
    expect(find.text('Page'), findsOneWidget);
    expect(find.byType(CommanderConfiguratorWidget), findsNothing);

    await _pressShortcut(tester);
    expect(_window, findsNothing);
  });

  testWidgets('the shortcut shows the menu and hides it again', (tester) async {
    final menu = await _pumpMenu(tester);
    expect(_window, findsNothing);

    await _pressShortcut(tester);
    expect(_window, findsOneWidget);
    expect(menu.controller.isShowingCommandMenu, isTrue);
    expect(find.text('Results'), findsOneWidget);

    await _pressShortcut(tester);
    expect(_window, findsNothing);
    expect(menu.controller.isShowingCommandMenu, isFalse);
  });

  testWidgets('the input field has the focus and reports the input',
      (tester) async {
    final menu = await _pumpMenu(tester);
    await _pressShortcut(tester);

    final editable = tester.widget<EditableText>(find.byType(EditableText));
    expect(editable.focusNode.hasFocus, isTrue);

    await tester.enterText(find.byType(EditableText), 'settings');
    await tester.pumpAndSettle();
    expect(menu.inputs.last, 'settings');
  });

  testWidgets('escape asks to close the window', (tester) async {
    final menu = await _pumpMenu(tester);
    await _pressShortcut(tester);

    await tester.sendKeyEvent(LogicalKeyboardKey.escape);
    await tester.pumpAndSettle();
    expect(menu.closeRequests, 1);
    expect(_window, findsNothing);
  });

  testWidgets('a tap outside the card asks to close the window',
      (tester) async {
    final menu = await _pumpMenu(tester);
    await _pressShortcut(tester);

    await tester.tapAt(const Offset(5, 5));
    await tester.pumpAndSettle();
    expect(menu.closeRequests, 1);
    expect(_window, findsNothing);
  });

  testWidgets('a tap on the card keeps the window open', (tester) async {
    final menu = await _pumpMenu(tester);
    await _pressShortcut(tester);

    await tester.tap(find.text('Results'));
    await tester.pumpAndSettle();
    expect(menu.closeRequests, 0);
    expect(_window, findsOneWidget);
  });

  testWidgets('the controller shows and hides the menu', (tester) async {
    final menu = await _pumpMenu(tester);
    await _pressShortcut(tester);
    await _pressShortcut(tester);

    menu.controller.show();
    await tester.pumpAndSettle();
    expect(_window, findsOneWidget);

    menu.controller.hide();
    await tester.pumpAndSettle();
    expect(_window, findsNothing);
  });

  group(
    'show while it is showing',
    () {
      testWidgets('hide removes the menu', (tester) async {
        final menu = await _pumpMenu(tester);
        await _pressShortcut(tester);

        menu.controller.show();
        await tester.pumpAndSettle();
        menu.controller.hide();
        await tester.pumpAndSettle();
        expect(_window, findsNothing);
      });
    },
  );

  group(
    'small screens',
    () {
      testWidgets('the window fits in a landscape phone', (tester) async {
        setOverlayTestViewSize(tester, const Size(800, 400));
        await _pumpMenu(tester);
        await _pressShortcut(tester);
        expect(_window, findsOneWidget);
        expect(tester.takeException(), isNull);
      });
    },
  );
}
