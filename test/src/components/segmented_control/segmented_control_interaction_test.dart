import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_inputs_test_helpers.dart';

void main() {
  const items = ['Day', 'Week', 'Month'];

  Widget wrap(Widget child) =>
      Center(child: SizedBox(width: 400, child: child));

  double indicatorX(WidgetTester tester) => (tester
          .widget<AnimatedAlign>(find.descendant(
            of: find.byType(ImpaktfullUiSegmentedControl<String>),
            matching: find.byType(AnimatedAlign),
          ))
          .alignment as AlignmentDirectional)
      .start;

  testWidgets('tapping an item calls onChanged with the item', (tester) async {
    final values = <String>[];
    await pumpAndSettleComponent(
      tester,
      wrap(ImpaktfullUiSegmentedControl<String>(
        value: 'Day',
        items: items,
        onChanged: values.add,
      )),
    );
    await tester.tap(find.text('Month'));
    await tester.pump();
    expect(values, ['Month']);
  });

  testWidgets('the indicator follows the value of the parent', (tester) async {
    final value = ValueNotifier('Day');
    await pumpAndSettleComponent(
      tester,
      wrap(ValueListenableBuilder<String>(
        valueListenable: value,
        builder: (context, current, child) =>
            ImpaktfullUiSegmentedControl<String>(
          value: current,
          items: items,
          onChanged: (newValue) => value.value = newValue,
        ),
      )),
    );
    expect(indicatorX(tester), -1);
    await tester.tap(find.text('Week'));
    await tester.pumpAndSettle();
    expect(value.value, 'Week');
    expect(indicatorX(tester), 0);
    value.value = 'Month';
    await tester.pumpAndSettle();
    expect(indicatorX(tester), 1);
  });

  testWidgets('the selected item uses the active label style', (tester) async {
    final theme = defaultComponentsTheme.segmentedControl;
    await pumpAndSettleComponent(
      tester,
      wrap(ImpaktfullUiSegmentedControl<String>(
        value: 'Week',
        items: items,
        onChanged: (_) {},
      )),
    );
    expect(tester.widget<Text>(find.text('Week')).style,
        theme.textStyles.activeLabel);
    expect(tester.widget<Text>(find.text('Day')).style, theme.textStyles.label);
  });

  testWidgets('an empty list of items does not throw', (tester) async {
    await pumpAndSettleComponent(
      tester,
      wrap(ImpaktfullUiSegmentedControl<String>(
        value: 'Day',
        items: const [],
        onChanged: (_) {},
      )),
    );
    expect(tester.takeException(), isNull);
    expect(find.byType(AnimatedAlign), findsNothing);
  });

  testWidgets('the leading and trailing builders are used', (tester) async {
    await pumpAndSettleComponent(
      tester,
      wrap(ImpaktfullUiSegmentedControl<int>(
        value: 1,
        items: const [1, 2],
        titleBuilder: (context, item) => 'Item $item',
        leadingBuilder: (context, item) => Text('L$item'),
        trailingBuilder: (context, item) => Text('T$item'),
        onChanged: (_) {},
      )),
    );
    for (final text in ['Item 1', 'Item 2', 'L1', 'L2', 'T1', 'T2']) {
      expect(find.text(text), findsOneWidget);
    }
  });

  testWidgets('enter selects the focused item', (tester) async {
    final values = <String>[];
    await pumpAndSettleComponent(
      tester,
      wrap(ImpaktfullUiSegmentedControl<String>(
        value: 'Day',
        items: items,
        onChanged: values.add,
      )),
    );
    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();
    expect(values, ['Week']);
  });

  group(
    'long labels',
    () {
      testWidgets('a long label does not overflow', (tester) async {
        await pumpAndSettleComponent(
          tester,
          wrap(ImpaktfullUiSegmentedControl<String>(
            value: 'Day',
            items: const [
              'Day',
              'A very long label that does not fit in a segment',
            ],
            onChanged: (_) {},
          )),
        );
        expect(tester.takeException(), isNull);
      });
    },
  );

  testWidgets('the theme override is used', (tester) async {
    final theme = defaultComponentsTheme.segmentedControl;
    await pumpAndSettleComponent(
      tester,
      wrap(ImpaktfullUiSegmentedControl<String>(
        value: 'Day',
        items: items,
        onChanged: (_) {},
        theme: theme.copyWith(
          colors: theme.colors.copyWith(activeBackground: customTestColor),
        ),
      )),
    );
    final indicator = tester.widget<Container>(find.descendant(
      of: find.byType(AnimatedAlign),
      matching: find.byType(Container),
    ));
    expect((indicator.decoration as BoxDecoration).color, customTestColor);
  });
}
