import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '_accessibility_test_helpers.dart';

void main() {
  group('checkbox', () {
    testWidgets('announces checked, enabled, its label and can be tapped',
        (tester) async {
      final handle = tester.ensureSemantics();
      bool? changedTo;
      await pumpAccessibilityApp(
        tester,
        ImpaktfullUiCheckbox(
          value: true,
          semanticLabel: 'Accept the terms',
          onChanged: (value) => changedTo = value,
        ),
      );
      final node = semanticsOf(tester, find.byType(ImpaktfullUiCheckbox));
      expect(
        node,
        matchesSemantics(
          label: 'Accept the terms',
          hasCheckedState: true,
          isChecked: true,
          hasEnabledState: true,
          isEnabled: true,
          isFocusable: true,
          hasTapAction: true,
          hasFocusAction: true,
        ),
      );
      tester.semantics.tap(find.semantics.byLabel('Accept the terms'));
      expect(changedTo, false);
      handle.dispose();
    });

    testWidgets('a disabled checkbox is announced as disabled', (tester) async {
      final handle = tester.ensureSemantics();
      await pumpAccessibilityApp(
        tester,
        const ImpaktfullUiCheckbox(value: false, onChanged: null),
      );
      expect(
        semanticsOf(tester, find.byType(ImpaktfullUiCheckbox)),
        matchesSemantics(
          hasCheckedState: true,
          isChecked: false,
          hasEnabledState: true,
          isEnabled: false,
        ),
      );
      handle.dispose();
    });

    testWidgets('an indeterminate checkbox is announced as mixed',
        (tester) async {
      final handle = tester.ensureSemantics();
      await pumpAccessibilityApp(
        tester,
        ImpaktfullUiCheckbox.indeterminate(value: null, onChanged: (_) {}),
      );
      expect(
        semanticsOf(tester, find.byType(ImpaktfullUiCheckbox)),
        isSemantics(hasCheckedState: true, isCheckStateMixed: true),
      );
      handle.dispose();
    });
  });

  group('radio button', () {
    testWidgets('is checked in a mutually exclusive group', (tester) async {
      final handle = tester.ensureSemantics();
      String? changedTo;
      await pumpAccessibilityApp(
        tester,
        ImpaktfullUiRadioButton<String>(
          value: 'monthly',
          groupValue: 'yearly',
          semanticLabel: 'Monthly',
          onChanged: (value) => changedTo = value,
        ),
      );
      expect(
        semanticsOf(tester, find.byType(ImpaktfullUiRadioButton<String>)),
        matchesSemantics(
          label: 'Monthly',
          hasCheckedState: true,
          isChecked: false,
          isInMutuallyExclusiveGroup: true,
          hasEnabledState: true,
          isEnabled: true,
          isFocusable: true,
          hasTapAction: true,
          hasFocusAction: true,
        ),
      );
      tester.semantics.tap(find.semantics.byLabel('Monthly'));
      expect(changedTo, 'monthly');
      handle.dispose();
    });
  });

  group('switch', () {
    testWidgets('announces toggled and enabled', (tester) async {
      final handle = tester.ensureSemantics();
      bool? changedTo;
      await pumpAccessibilityApp(
        tester,
        ImpaktfullUiSwitch(
          value: true,
          semanticLabel: 'Notifications',
          onChanged: (value) => changedTo = value,
        ),
      );
      expect(
        semanticsOf(tester, find.byType(ImpaktfullUiSwitch)),
        matchesSemantics(
          label: 'Notifications',
          hasToggledState: true,
          isToggled: true,
          hasEnabledState: true,
          isEnabled: true,
          isFocusable: true,
          hasTapAction: true,
          hasFocusAction: true,
        ),
      );
      tester.semantics.tap(find.semantics.byLabel('Notifications'));
      expect(changedTo, false);
      handle.dispose();
    });
  });

  group('list items', () {
    testWidgets('checkbox list item is one checked node with the title',
        (tester) async {
      final handle = tester.ensureSemantics();
      bool? changedTo;
      await pumpAccessibilityApp(
        tester,
        ImpaktfullUiCheckboxListItem(
          title: 'Newsletter',
          subtitle: 'Once a week',
          value: false,
          onChanged: (value) => changedTo = value,
        ),
      );
      expect(
        tester.getSemantics(find.byType(MergeSemantics)),
        matchesSemantics(
          label: 'Newsletter\nOnce a week',
          hasCheckedState: true,
          isChecked: false,
          hasEnabledState: true,
          isEnabled: true,
          isFocusable: true,
          hasTapAction: true,
          hasFocusAction: true,
        ),
      );
      tester.semantics.tap(find.semantics.byLabel('Newsletter\nOnce a week'));
      expect(changedTo, true);
      handle.dispose();
    });

    testWidgets('radio button list item is in a mutually exclusive group',
        (tester) async {
      final handle = tester.ensureSemantics();
      await pumpAccessibilityApp(
        tester,
        ImpaktfullUiRadioButtonListItem<int>(
          title: 'Monthly',
          value: 1,
          groupValue: 1,
          onChanged: (_) {},
        ),
      );
      expect(
        tester.getSemantics(find.byType(MergeSemantics)),
        isSemantics(
          label: 'Monthly',
          isChecked: true,
          isInMutuallyExclusiveGroup: true,
          isEnabled: true,
          hasTapAction: true,
        ),
      );
      handle.dispose();
    });

    testWidgets('switch list item is toggled', (tester) async {
      final handle = tester.ensureSemantics();
      await pumpAccessibilityApp(
        tester,
        const ImpaktfullUiSwitchListItem(
          title: 'Dark mode',
          value: true,
          onChanged: null,
        ),
      );
      expect(
        tester.getSemantics(find.byType(MergeSemantics)),
        isSemantics(
          label: 'Dark mode',
          isToggled: true,
          hasEnabledState: true,
          isEnabled: false,
          hasTapAction: false,
        ),
      );
      handle.dispose();
    });

    testWidgets('selectable list item is checked', (tester) async {
      final handle = tester.ensureSemantics();
      await pumpAccessibilityApp(
        tester,
        ImpaktfullUiSelectableListItem(
          title: 'Belgium',
          isSelected: true,
          onChanged: (_) {},
        ),
      );
      expect(
        tester.getSemantics(find.byType(MergeSemantics)),
        isSemantics(
          label: 'Belgium',
          isChecked: true,
          isEnabled: true,
          hasTapAction: true,
        ),
      );
      handle.dispose();
    });

    testWidgets('the control of a list item is not a second tab stop',
        (tester) async {
      await pumpAccessibilityApp(
        tester,
        ImpaktfullUiCheckboxListItem(
          title: 'Newsletter',
          value: false,
          onChanged: (_) {},
        ),
      );
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();
      // The row has the focus.
      final focusContext = FocusManager.instance.primaryFocus?.context;
      expect(
        focusContext
            ?.findAncestorWidgetOfExactType<ImpaktfullUiSimpleListItem>(),
        isNotNull,
      );
      expect(
        focusContext?.findAncestorWidgetOfExactType<ImpaktfullUiCheckbox>(),
        isNull,
      );
      // The checkbox in the row can not be focused.
      final checkboxFocus = Focus.of(tester.element(find
          .descendant(
            of: find.byType(ImpaktfullUiCheckbox),
            matching: find.byType(ColoredBox),
          )
          .last));
      expect(checkboxFocus.canRequestFocus, isFalse);
    });
  });

  group('tap target', () {
    testWidgets('keeps the size of a checkbox and radio button by default',
        (tester) async {
      await pumpAccessibilityApp(
        tester,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImpaktfullUiRadioButton<int>(
              value: 1,
              groupValue: 1,
              onChanged: (_) {},
            ),
          ],
        ),
      );
      expect(
        tester.getSize(find.byType(ImpaktfullUiRadioButton<int>)),
        const Size(20, 20),
      );
    });

    testWidgets('minTapTargetSize makes the tap area 48x48, not the control',
        (tester) async {
      var taps = 0;
      await pumpAccessibilityApp(
        tester,
        Center(
          child: ImpaktfullUiRadioButton<int>(
            value: 1,
            groupValue: 2,
            onChanged: (_) => taps++,
          ),
        ),
        theme: themeWithMinTapTargets(),
      );
      final radio = find.byType(ImpaktfullUiRadioButton<int>);
      expect(tester.getSize(radio), const Size(48, 48));
      // The visible control keeps its size.
      expect(
        tester.getSize(find.descendant(
          of: radio,
          matching: find.byType(ImpaktfullUiTouchFeedback),
        )),
        const Size(20, 20),
      );
      // A tap next to the visible control, inside the tap area.
      await tester.tapAt(tester.getTopLeft(radio) + const Offset(2, 2));
      expect(taps, 1);
    });

    testWidgets('list items keep their controls at their own size',
        (tester) async {
      await pumpAccessibilityApp(
        tester,
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImpaktfullUiCheckboxListItem(
              title: 'Newsletter',
              value: false,
              onChanged: (_) {},
            ),
          ],
        ),
        theme: themeWithMinTapTargets(),
      );
      expect(
        tester.getSize(find.descendant(
          of: find.byType(ImpaktfullUiCheckbox),
          matching: find.byType(ImpaktfullUiTouchFeedback),
        )),
        const Size(24, 24),
      );
      // The whole row is the tap target: 16 + 24 + 16, at least 48 high.
      expect(
        tester.getSize(find.byType(ImpaktfullUiCheckboxListItem)).height,
        56,
      );
    });
  });
}
