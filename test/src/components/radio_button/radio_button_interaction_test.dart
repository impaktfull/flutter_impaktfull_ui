import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_inputs_test_helpers.dart';

void main() {
  Color? colorOf(WidgetTester tester, Finder radioButton) => tester
      .widget<ImpaktfullUiTouchFeedback>(find.descendant(
        of: radioButton,
        matching: find.byType(ImpaktfullUiTouchFeedback),
      ))
      .color;

  test('isSelected compares the value with the group value', () {
    expect(
      ImpaktfullUiRadioButton<String>(
              value: 'a', groupValue: 'a', onChanged: (_) {})
          .isSelected,
      isTrue,
    );
    expect(
      ImpaktfullUiRadioButton<String>(
              value: 'a', groupValue: 'b', onChanged: (_) {})
          .isSelected,
      isFalse,
    );
  });

  testWidgets('tapping calls onChanged with the value', (tester) async {
    final values = <String>[];
    await pumpAndSettleComponent(
      tester,
      Center(
        child: ImpaktfullUiRadioButton<String>(
          value: 'a',
          groupValue: 'b',
          onChanged: values.add,
        ),
      ),
    );
    await tester.tap(find.byType(ImpaktfullUiRadioButton<String>));
    await tester.pump();
    expect(values, ['a']);
  });

  testWidgets('tapping a selected radio button calls onChanged again',
      (tester) async {
    final values = <String>[];
    await pumpAndSettleComponent(
      tester,
      Center(
        child: ImpaktfullUiRadioButton<String>(
          value: 'a',
          groupValue: 'a',
          onChanged: values.add,
        ),
      ),
    );
    await tester.tap(find.byType(ImpaktfullUiRadioButton<String>));
    await tester.pump();
    expect(values, ['a']);
  });

  testWidgets('a disabled radio button does not emit', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const Center(
        child: ImpaktfullUiRadioButton<String>(
          value: 'a',
          groupValue: 'b',
          onChanged: null,
        ),
      ),
    );
    await tester.tap(find.byType(ImpaktfullUiRadioButton<String>),
        warnIfMissed: false);
    await tester.pump();
    expect(tester.takeException(), isNull);
    expect(
      tester
          .widget<ImpaktfullUiTouchFeedback>(
              find.byType(ImpaktfullUiTouchFeedback))
          .onTap,
      isNull,
    );
  });

  testWidgets('a group follows the group value of the parent', (tester) async {
    final theme = defaultComponentsTheme.radioButton;
    final groupValue = ValueNotifier(1);
    await pumpAndSettleComponent(
      tester,
      ValueListenableBuilder<int>(
        valueListenable: groupValue,
        builder: (context, current, child) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (final value in [1, 2, 3])
              ImpaktfullUiRadioButton<int>(
                key: ValueKey(value),
                value: value,
                groupValue: current,
                onChanged: (newValue) => groupValue.value = newValue,
              ),
          ],
        ),
      ),
    );
    expect(
        colorOf(tester, find.byKey(const ValueKey(1))), theme.colors.selected);
    expect(colorOf(tester, find.byKey(const ValueKey(3))),
        theme.colors.unselected);

    await tester.tap(find.byKey(const ValueKey(3)));
    await tester.pumpAndSettle();
    expect(groupValue.value, 3);
    expect(colorOf(tester, find.byKey(const ValueKey(1))),
        theme.colors.unselected);
    expect(
        colorOf(tester, find.byKey(const ValueKey(3))), theme.colors.selected);
  });

  testWidgets('space selects the focused radio button', (tester) async {
    final values = <int>[];
    await pumpAndSettleComponent(
      tester,
      Center(
        child: ImpaktfullUiRadioButton<int>(
          value: 1,
          groupValue: 0,
          onChanged: values.add,
        ),
      ),
    );
    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.space);
    await tester.pump();
    expect(values, [1]);
  });

  testWidgets('the theme override is used', (tester) async {
    final theme = defaultComponentsTheme.radioButton;
    await pumpAndSettleComponent(
      tester,
      Center(
        child: ImpaktfullUiRadioButton<int>(
          value: 1,
          groupValue: 1,
          onChanged: (_) {},
          theme: theme.copyWith(
            colors: theme.colors.copyWith(selected: customTestColor),
          ),
        ),
      ),
    );
    expect(colorOf(tester, find.byType(ImpaktfullUiRadioButton<int>)),
        customTestColor);
  });
}
