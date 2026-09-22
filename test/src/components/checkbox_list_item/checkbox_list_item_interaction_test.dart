import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_inputs_test_helpers.dart';

void main() {
  bool? checkboxValue(WidgetTester tester) => tester
      .widget<ImpaktfullUiCheckbox>(find.byType(ImpaktfullUiCheckbox))
      .value;

  group('normal', () {
    testWidgets('tapping the title toggles the value', (tester) async {
      final values = <bool>[];
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiCheckboxListItem(
          title: 'Title',
          value: false,
          onChanged: values.add,
        ),
      );
      await tester.tap(find.text('Title'));
      await tester.pump();
      expect(values, [true]);
    });

    testWidgets('tapping the checkbox toggles the value once', (tester) async {
      final values = <bool>[];
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiCheckboxListItem(
          title: 'Title',
          value: true,
          onChanged: values.add,
        ),
      );
      await tester.tap(find.byType(ImpaktfullUiCheckbox));
      await tester.pump();
      expect(values, [false]);
    });

    testWidgets('a disabled item does not emit', (tester) async {
      await pumpAndSettleComponent(
        tester,
        const ImpaktfullUiCheckboxListItem(
          title: 'Title',
          value: false,
          onChanged: null,
        ),
      );
      await tester.tap(find.text('Title'), warnIfMissed: false);
      await tester.tap(find.byType(ImpaktfullUiCheckbox), warnIfMissed: false);
      await tester.pump();
      expect(tester.takeException(), isNull);
      expect(
          tester
              .widget<ImpaktfullUiCheckbox>(find.byType(ImpaktfullUiCheckbox))
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
          builder: (context, current, child) => ImpaktfullUiCheckboxListItem(
            title: 'Title',
            value: current,
            onChanged: (newValue) => value.value = newValue,
          ),
        ),
      );
      await tester.tap(find.text('Title'));
      await tester.pumpAndSettle();
      expect(checkboxValue(tester), isTrue);
      value.value = false;
      await tester.pumpAndSettle();
      expect(checkboxValue(tester), isFalse);
    });
  });

  group('indeterminate', () {
    for (final entry in {null: true, false: true, true: false}.entries) {
      testWidgets('tapping the title with ${entry.key} emits ${entry.value}',
          (tester) async {
        final values = <bool?>[];
        await pumpAndSettleComponent(
          tester,
          ImpaktfullUiCheckboxListItem.indeterminate(
            title: 'Title',
            value: entry.key,
            onChanged: values.add,
          ),
        );
        await tester.tap(find.text('Title'));
        await tester.pump();
        expect(values, [entry.value]);
      });
    }

    testWidgets('tapping the checkbox with null emits true', (tester) async {
      final values = <bool?>[];
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiCheckboxListItem.indeterminate(
          title: 'Title',
          value: null,
          onChanged: values.add,
        ),
      );
      await tester.tap(find.byType(ImpaktfullUiCheckbox));
      await tester.pump();
      expect(values, [true]);
    });
  });

  testWidgets('the subtitle is shown', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiCheckboxListItem(
        title: 'Title',
        subtitle: 'Subtitle',
        value: false,
        onChanged: (_) {},
      ),
    );
    expect(find.text('Subtitle'), findsOneWidget);
  });

  testWidgets('space toggles the focused item', (tester) async {
    final values = <bool>[];
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiCheckboxListItem(
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
    final theme = defaultComponentsTheme.checkboxListItem;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiCheckboxListItem(
        title: 'Title',
        value: false,
        leading: customTestAsset,
        onChanged: (_) {},
        theme: theme.copyWith(
          colors: theme.colors.copyWith(icons: customTestColor),
        ),
      ),
    );
    expect(
      tester
          .widget<ImpaktfullUiAssetWidget>(
              find.byWidgetPredicate(isAssetWidget(customTestAsset)))
          .color,
      customTestColor,
    );
  });
}
