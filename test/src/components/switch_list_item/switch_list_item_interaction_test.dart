import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_inputs_test_helpers.dart';

void main() {
  bool switchValue(WidgetTester tester) =>
      tester.widget<ImpaktfullUiSwitch>(find.byType(ImpaktfullUiSwitch)).value;

  testWidgets('tapping the title toggles the value', (tester) async {
    final values = <bool>[];
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiSwitchListItem(
        title: 'Title',
        value: false,
        onChanged: values.add,
      ),
    );
    await tester.tap(find.text('Title'));
    await tester.pump();
    expect(values, [true]);
  });

  testWidgets('tapping the switch toggles the value once', (tester) async {
    final values = <bool>[];
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiSwitchListItem(
        title: 'Title',
        value: true,
        onChanged: values.add,
      ),
    );
    await tester.tap(find.byType(ImpaktfullUiSwitch));
    await tester.pump();
    expect(values, [false]);
  });

  testWidgets('a disabled item does not emit', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiSwitchListItem(
        title: 'Title',
        value: false,
        onChanged: null,
      ),
    );
    await tester.tap(find.text('Title'), warnIfMissed: false);
    await tester.pump();
    expect(tester.takeException(), isNull);
    expect(
        tester
            .widget<ImpaktfullUiSwitch>(find.byType(ImpaktfullUiSwitch))
            .onChanged,
        isNull);
  });

  testWidgets('a controlled item follows the value of the parent',
      (tester) async {
    final value = ValueNotifier(false);
    await pumpAndSettleComponent(
      tester,
      ValueListenableBuilder<bool>(
        valueListenable: value,
        builder: (context, current, child) => ImpaktfullUiSwitchListItem(
          title: 'Title',
          value: current,
          onChanged: (newValue) => value.value = newValue,
        ),
      ),
    );
    await tester.tap(find.text('Title'));
    await tester.pumpAndSettle();
    expect(switchValue(tester), isTrue);
    value.value = false;
    await tester.pumpAndSettle();
    expect(switchValue(tester), isFalse);
  });

  testWidgets('space toggles the focused item', (tester) async {
    final values = <bool>[];
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiSwitchListItem(
        title: 'Title',
        value: false,
        onChanged: values.add,
      ),
    );
    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.space);
    await tester.pump();
    expect(values, [true]);
  });

  testWidgets('the theme override is used for the leading icon',
      (tester) async {
    final theme = defaultComponentsTheme.switchListItem;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiSwitchListItem(
        title: 'Title',
        subtitle: 'Subtitle',
        value: false,
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
