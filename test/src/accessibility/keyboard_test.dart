import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '_accessibility_test_helpers.dart';

/// Moves the focus with tab and activates the focused element with [key].
Future<void> _tabAndPress(
  WidgetTester tester,
  LogicalKeyboardKey key, {
  int tabs = 1,
}) async {
  for (var i = 0; i < tabs; i++) {
    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pump();
  }
  await tester.sendKeyEvent(key);
  await tester.pumpAndSettle();
}

void main() {
  for (final key in [LogicalKeyboardKey.enter, LogicalKeyboardKey.space]) {
    group('${key.keyLabel} activates the focused element', () {
      testWidgets('button', (tester) async {
        var taps = 0;
        await pumpAccessibilityApp(
          tester,
          Center(
            child: ImpaktfullUiButton(
              type: ImpaktfullUiButtonType.primary,
              title: 'Save',
              onTap: () => taps++,
            ),
          ),
        );
        await _tabAndPress(tester, key);
        expect(taps, 1);
      });

      testWidgets('icon button', (tester) async {
        var taps = 0;
        await pumpAccessibilityApp(
          tester,
          Center(
            child: ImpaktfullUiIconButton(
              asset: ImpaktfullUiAsset.icon(Icons.add),
              tooltip: 'Add',
              onTap: () => taps++,
            ),
          ),
        );
        await _tabAndPress(tester, key);
        expect(taps, 1);
      });

      testWidgets('checkbox list item', (tester) async {
        bool? changedTo;
        await pumpAccessibilityApp(
          tester,
          ImpaktfullUiCheckboxListItem(
            title: 'Newsletter',
            value: false,
            onChanged: (value) => changedTo = value,
          ),
        );
        await _tabAndPress(tester, key);
        expect(changedTo, isTrue);
      });

      testWidgets('switch', (tester) async {
        bool? changedTo;
        await pumpAccessibilityApp(
          tester,
          Center(
            child: ImpaktfullUiSwitch(
              value: false,
              onChanged: (value) => changedTo = value,
            ),
          ),
        );
        await _tabAndPress(tester, key);
        expect(changedTo, isTrue);
      });

      testWidgets('badge with onTap', (tester) async {
        var taps = 0;
        await pumpAccessibilityApp(
          tester,
          Center(
            child: ImpaktfullUiBadge(
              type: ImpaktfullUiBadgeType.primary,
              label: 'Filter',
              onTap: () => taps++,
            ),
          ),
        );
        await _tabAndPress(tester, key);
        expect(taps, 1);
      });

      testWidgets('horizontal tab', (tester) async {
        var taps = 0;
        await pumpAccessibilityApp(
          tester,
          Center(
            child: ImpaktfullUiHorizontalTab(
              label: 'Unread',
              onTap: () => taps++,
            ),
          ),
        );
        await _tabAndPress(tester, key);
        expect(taps, 1);
      });

      testWidgets('bottom navigation item', (tester) async {
        var taps = 0;
        await pumpAccessibilityApp(
          tester,
          Row(
            children: [
              ImpaktfullUiBottomNavigationItem(
                asset: ImpaktfullUiAsset.icon(Icons.home),
                label: 'Home',
                isSelected: false,
                onTap: () => taps++,
              ),
            ],
          ),
        );
        await _tabAndPress(tester, key);
        expect(taps, 1);
      });

      testWidgets('tab bar item', (tester) async {
        late TabController controller;
        await pumpAccessibilityApp(
          tester,
          DefaultTabController(
            length: 2,
            child: Builder(builder: (context) {
              controller = DefaultTabController.of(context);
              return Row(
                children: [
                  ImpaktfullUiTabBarItem(
                    label: 'Details',
                    index: 0,
                    controller: controller,
                  ),
                  ImpaktfullUiTabBarItem(
                    label: 'Reviews',
                    index: 1,
                    controller: controller,
                  ),
                ],
              );
            }),
          ),
        );
        await _tabAndPress(tester, key, tabs: 2);
        expect(controller.index, 1);
      });

      testWidgets('sidebar navigation item', (tester) async {
        var taps = 0;
        await pumpAccessibilityApp(
          tester,
          ImpaktfullUiSidebarNavigationItem(
            title: 'Home',
            onTap: () => taps++,
          ),
        );
        await _tabAndPress(tester, key);
        expect(taps, 1);
      });
    });
  }

  testWidgets('the focused element shows the focus ring', (tester) async {
    await pumpAccessibilityApp(
      tester,
      Center(
        child: ImpaktfullUiButton(
          type: ImpaktfullUiButtonType.tertiary,
          title: 'Save',
          onTap: () {},
        ),
      ),
    );
    FocusManager.instance.highlightStrategy =
        FocusHighlightStrategy.alwaysTraditional;
    addTearDown(() => FocusManager.instance.highlightStrategy =
        FocusHighlightStrategy.automatic);
    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pump();
    expect(
      tester
          .widget<ImpaktfullUiFocusFeedback>(
              find.byType(ImpaktfullUiFocusFeedback))
          .hasFocus,
      isTrue,
    );
  });

  group('slider', () {
    Future<List<double>> pumpSlider(
      WidgetTester tester, {
      TextDirection textDirection = TextDirection.ltr,
      double? step,
    }) async {
      final values = <double>[];
      var value = 50.0;
      await pumpAccessibilityApp(
        tester,
        StatefulBuilder(
          builder: (context, setState) => ImpaktfullUiSlider(
            value: value,
            min: 0,
            max: 100,
            step: step,
            onChanged: (newValue) => setState(() {
              value = newValue;
              values.add(newValue);
            }),
          ),
        ),
        textDirection: textDirection,
      );
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();
      return values;
    }

    testWidgets('the arrow keys change the value', (tester) async {
      final values = await pumpSlider(tester);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      expect(values, [60, 70, 60, 50, 40]);
    });

    testWidgets('home and end go to the minimum and maximum', (tester) async {
      final values = await pumpSlider(tester);
      await tester.sendKeyEvent(LogicalKeyboardKey.end);
      await tester.sendKeyEvent(LogicalKeyboardKey.home);
      expect(values, [100, 0]);
    });

    testWidgets('the step is configurable and clamped', (tester) async {
      final values = await pumpSlider(tester, step: 30);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      expect(values, [80, 100]);
    });

    testWidgets('left and right follow the reading direction (rtl)',
        (tester) async {
      final values = await pumpSlider(tester, textDirection: TextDirection.rtl);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
      expect(values, [60, 50]);
    });

    testWidgets('a disabled slider can not be focused', (tester) async {
      await pumpAccessibilityApp(
        tester,
        const ImpaktfullUiSlider(value: 5, min: 0, max: 10),
      );
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();
      expect(
        FocusManager.instance.primaryFocus?.context
            ?.findAncestorWidgetOfExactType<ImpaktfullUiSlider>(),
        isNull,
      );
    });
  });

  group('command menu', () {
    const shortcut = SingleActivator(LogicalKeyboardKey.keyK, control: true);

    Future<List<String>> pumpMenu(WidgetTester tester) async {
      final selected = <String>[];
      await pumpAccessibilityApp(
        tester,
        ImpaktfullUiCommandMenu(
          shortcutActivator: shortcut,
          autofocus: true,
          builder: (context, theme, controller) =>
              ImpaktfullUiCommandMenuWindow(
            onInputChanged: (_) {},
            onCloseWindow: controller.hide,
            bottomBuilder: (context) => ListView(
              children: [
                for (final result in ['Settings', 'Profile'])
                  ImpaktfullUiSimpleListItem(
                    title: result,
                    onTap: () => selected.add(result),
                  ),
              ],
            ),
          ),
          child: const Center(child: Text('Page')),
        ),
      );
      await tester.sendKeyDownEvent(LogicalKeyboardKey.controlLeft);
      await tester.sendKeyEvent(LogicalKeyboardKey.keyK);
      await tester.sendKeyUpEvent(LogicalKeyboardKey.controlLeft);
      await tester.pumpAndSettle();
      return selected;
    }

    bool inputHasFocus(WidgetTester tester) => tester
        .widget<EditableText>(find.byType(EditableText))
        .focusNode
        .hasFocus;

    String? focusedResult() => FocusManager.instance.primaryFocus?.context
        ?.findAncestorWidgetOfExactType<ImpaktfullUiSimpleListItem>()
        ?.title;

    testWidgets('tab moves from the input to the results', (tester) async {
      await pumpMenu(tester);
      expect(inputHasFocus(tester), isTrue);
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pumpAndSettle();
      // The input no longer takes the focus back.
      expect(inputHasFocus(tester), isFalse);
      expect(focusedResult(), 'Settings');
    });

    testWidgets('the arrow keys move through the results, enter selects',
        (tester) async {
      final selected = await pumpMenu(tester);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pumpAndSettle();
      expect(focusedResult(), 'Settings');
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pumpAndSettle();
      expect(focusedResult(), 'Profile');
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pumpAndSettle();
      expect(selected, ['Profile']);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
      await tester.pumpAndSettle();
      expect(inputHasFocus(tester), isTrue);
    });

    testWidgets('the focus stays in the window', (tester) async {
      await pumpMenu(tester);
      for (var i = 0; i < 5; i++) {
        await tester.sendKeyEvent(LogicalKeyboardKey.tab);
        await tester.pumpAndSettle();
        final focusContext = FocusManager.instance.primaryFocus?.context;
        expect(
          focusContext
              ?.findAncestorWidgetOfExactType<ImpaktfullUiCommandMenuWindow>(),
          isNotNull,
        );
      }
    });

    testWidgets('the window is a named modal route for screen readers',
        (tester) async {
      final handle = tester.ensureSemantics();
      await pumpMenu(tester);
      expect(
        semanticsWithLabel('Command menu'),
        isSemantics(
          scopesRoute: true,
          namesRoute: true,
          hasDismissAction: true,
        ),
      );
      // The page behind the window is hidden from screen readers.
      expect(find.semantics.byLabel('Page'), findsNothing);
      handle.dispose();
    });
  });

  group('dropdown', () {
    testWidgets('opens with the keyboard, escape closes it and refocuses',
        (tester) async {
      await pumpAccessibilityApp(
        tester,
        Align(
          alignment: Alignment.topCenter,
          child: ImpaktfullUiDropdown<String>(
            buttonText: 'Sort',
            height: 150,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImpaktfullUiSimpleListItem(title: 'Newest', onTap: () {}),
                ImpaktfullUiSimpleListItem(title: 'Oldest', onTap: () {}),
              ],
            ),
          ),
        ),
      );
      await _tabAndPress(tester, LogicalKeyboardKey.enter);
      expect(find.text('Newest'), findsOne);

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pumpAndSettle();
      expect(
        FocusManager.instance.primaryFocus?.context
            ?.findAncestorWidgetOfExactType<ImpaktfullUiSimpleListItem>()
            ?.title,
        'Newest',
      );

      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await tester.pumpAndSettle();
      expect(find.text('Newest'), findsNothing);
      expect(
        FocusManager.instance.primaryFocus?.context
            ?.findAncestorWidgetOfExactType<ImpaktfullUiButton>()
            ?.title,
        'Sort',
      );
    });
  });
}
