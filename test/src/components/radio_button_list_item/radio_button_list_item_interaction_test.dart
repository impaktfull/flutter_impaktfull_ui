import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_inputs_test_helpers.dart';

void main() {
  testWidgets('tapping the title calls onChanged with the value',
      (tester) async {
    final values = <String>[];
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiRadioButtonListItem<String>(
        title: 'Title',
        value: 'a',
        groupValue: 'b',
        onChanged: values.add,
      ),
    );
    await tester.tap(find.text('Title'));
    await tester.pump();
    expect(values, ['a']);
  });

  testWidgets('tapping the radio button calls onChanged once', (tester) async {
    final values = <String>[];
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiRadioButtonListItem<String>(
        title: 'Title',
        value: 'a',
        groupValue: 'b',
        onChanged: values.add,
      ),
    );
    await tester.tap(find.byType(ImpaktfullUiRadioButton<String>));
    await tester.pump();
    expect(values, ['a']);
  });

  testWidgets('a disabled item does not emit', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiRadioButtonListItem<String>(
        title: 'Title',
        value: 'a',
        groupValue: 'b',
        onChanged: null,
      ),
    );
    await tester.tap(find.text('Title'), warnIfMissed: false);
    await tester.pump();
    expect(tester.takeException(), isNull);
    expect(
      tester
          .widget<ImpaktfullUiRadioButton<String>>(
              find.byType(ImpaktfullUiRadioButton<String>))
          .onChanged,
      isNull,
    );
  });

  testWidgets('a group follows the group value of the parent', (tester) async {
    final groupValue = ValueNotifier('a');
    await pumpAndSettleComponent(
      tester,
      ValueListenableBuilder<String>(
        valueListenable: groupValue,
        builder: (context, current, child) => Column(
          children: [
            for (final value in ['a', 'b'])
              ImpaktfullUiRadioButtonListItem<String>(
                title: value.toUpperCase(),
                value: value,
                groupValue: current,
                onChanged: (newValue) => groupValue.value = newValue,
              ),
          ],
        ),
      ),
    );
    List<bool> selected() => tester
        .widgetList<ImpaktfullUiRadioButton<String>>(
            find.byType(ImpaktfullUiRadioButton<String>))
        .map((radio) => radio.isSelected)
        .toList();
    expect(selected(), [true, false]);
    await tester.tap(find.text('B'));
    await tester.pumpAndSettle();
    expect(selected(), [false, true]);
    groupValue.value = 'a';
    await tester.pumpAndSettle();
    expect(selected(), [true, false]);
  });

  testWidgets('space selects the focused item', (tester) async {
    final values = <String>[];
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiRadioButtonListItem<String>(
        title: 'Title',
        value: 'a',
        groupValue: 'b',
        onChanged: values.add,
      ),
    );
    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.space);
    await tester.pump();
    expect(values, ['a']);
  });

  testWidgets('the theme override is used for the leading icon',
      (tester) async {
    final theme = defaultComponentsTheme.radioButtonListItem;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiRadioButtonListItem<String>(
        title: 'Title',
        subtitle: 'Subtitle',
        value: 'a',
        groupValue: 'a',
        leading: customTestAsset,
        onChanged: (_) {},
        theme: theme.copyWith(
          colors: theme.colors.copyWith(icons: customTestColor),
        ),
      ),
    );
    expect(find.text('Subtitle'), findsOneWidget);
    expect(
      tester
          .widget<ImpaktfullUiAssetWidget>(
              find.byWidgetPredicate(isAssetWidget(customTestAsset)))
          .color,
      customTestColor,
    );
  });
}
