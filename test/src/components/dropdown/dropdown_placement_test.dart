// A menu belongs inside the window: it opens under its button, above it when
// there is no room under it, it slides away from the edges instead of hanging
// out of them, and it is never taller than the space it has.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
// The overlay of the menu is internal: only the dropdown builds one.
import 'package:impaktfull_ui/src/components/dropdown/widget/dropdown_overlay.dart';

import '../../_core_test_helpers.dart';

const _screen = Size(800, 600);

/// A dropdown with [items] items, at [alignment] of a screen of [_screen].
Future<void> _pumpDropdown(
  WidgetTester tester, {
  required Alignment alignment,
  int items = 4,
  double? childWidth,
  String buttonTitle = 'Item 0',
  ImpaktfullUiDropdownAlignment dropdownAlignment =
      ImpaktfullUiDropdownAlignment.bottomLeft,
}) async {
  await pumpImpaktfullUiApp(
    tester,
    Align(
      alignment: alignment,
      child: ImpaktfullUiDropdown<String>(
        buttonTitle: buttonTitle,
        childWidth: childWidth,
        alignment: dropdownAlignment,
        child: ImpaktfullUiListView<String>.builder(
          items: List.generate(items, (index) => 'Item $index'),
          itemBuilder: (context, item, index) =>
              ImpaktfullUiListItem(title: item, onTap: () {}),
          placeholderData:
              const ImpaktfullUiListViewPlaceholderData(title: 'No data'),
          shrinkWrap: true,
        ),
      ),
    ),
    screenSize: _screen,
  );
  await tester.tap(find.byType(ImpaktfullUiButton));
  await tester.pumpAndSettle();
}

Rect _menu(WidgetTester tester) =>
    tester.getRect(find.byType(ImpaktfullUiDropdownOverlay));

Rect _button(WidgetTester tester) =>
    tester.getRect(find.byType(ImpaktfullUiButton));

void main() {
  testWidgets('opens under the button', (tester) async {
    await _pumpDropdown(tester, alignment: Alignment.topLeft);
    expect(_menu(tester).top, greaterThanOrEqualTo(_button(tester).bottom));
  });

  testWidgets('opens above the button when there is no room under it',
      (tester) async {
    await _pumpDropdown(tester, alignment: Alignment.bottomLeft);
    expect(_menu(tester).bottom, lessThanOrEqualTo(_button(tester).top));
  });

  testWidgets('stays inside the window at the end of it', (tester) async {
    await _pumpDropdown(
      tester,
      alignment: Alignment.topRight,
      dropdownAlignment: ImpaktfullUiDropdownAlignment.bottomLeft,
    );
    final menu = _menu(tester);
    expect(menu.right, lessThanOrEqualTo(_screen.width));
    expect(menu.left, greaterThanOrEqualTo(0));
  });

  testWidgets('stays inside the window at the start of it', (tester) async {
    await _pumpDropdown(
      tester,
      alignment: Alignment.topLeft,
      dropdownAlignment: ImpaktfullUiDropdownAlignment.bottomRight,
    );
    expect(_menu(tester).left, greaterThanOrEqualTo(0));
  });

  testWidgets('is never taller than the room it has', (tester) async {
    await _pumpDropdown(tester, alignment: Alignment.center, items: 100);
    final menu = _menu(tester);
    expect(menu.height, lessThan(_screen.height));
    expect(menu.top, greaterThanOrEqualTo(0));
    expect(menu.bottom, lessThanOrEqualTo(_screen.height));
  });

  testWidgets('scrolls the items that do not fit', (tester) async {
    await _pumpDropdown(tester, alignment: Alignment.center, items: 100);
    expect(find.text('Item 0'), findsWidgets);

    await tester.drag(
      find.byType(ImpaktfullUiDropdownOverlay),
      const Offset(0, -200),
    );
    await tester.pumpAndSettle();
    // A menu that could not scroll would still show the first item.
    expect(
      find.descendant(
        of: find.byType(ImpaktfullUiDropdownOverlay),
        matching: find.text('Item 0'),
      ),
      findsNothing,
    );
  });

  group('the width of the menu', () {
    testWidgets('is at least minWidth, so a narrow button gives its items room',
        (tester) async {
      await _pumpDropdown(
        tester,
        alignment: Alignment.topLeft,
        buttonTitle: 'A',
      );
      final button = _button(tester);
      expect(button.width, lessThan(176), reason: 'a narrow button');
      expect(_menu(tester).width, 176);
    });

    testWidgets('is the width of a button that is wider than minWidth',
        (tester) async {
      await _pumpDropdown(
        tester,
        alignment: Alignment.topLeft,
        buttonTitle: 'A button with a much longer title than the others',
      );
      expect(_menu(tester).width, _button(tester).width);
    });

    testWidgets('is childWidth when the caller asks for one', (tester) async {
      await _pumpDropdown(
        tester,
        alignment: Alignment.topLeft,
        childWidth: 300,
      );
      expect(_menu(tester).width, 300);
    });

    testWidgets('never grows wider than the window', (tester) async {
      await _pumpDropdown(
        tester,
        alignment: Alignment.center,
        childWidth: 2000,
      );
      expect(_menu(tester).width, lessThanOrEqualTo(_screen.width));
    });
  });

  testWidgets('an item of a narrow button does not wrap', (tester) async {
    await _pumpDropdown(
      tester,
      alignment: Alignment.topLeft,
      buttonTitle: 'A',
    );
    final title = find
        .descendant(
          of: find.byType(ImpaktfullUiDropdownOverlay),
          matching: find.text('Item 0'),
        )
        .first;
    final height = tester.getSize(title).height;
    final style = tester.widget<Text>(title).style;
    expect(
      height,
      lessThan((style?.fontSize ?? 16) * 2),
      reason: 'the title of an item is one line, not two',
    );
  });
}
