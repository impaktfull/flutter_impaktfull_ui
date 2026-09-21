import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_inputs_test_helpers.dart';

void main() {
  Color? backgroundColor(WidgetTester tester) => tester
      .widget<ImpaktfullUiTouchFeedback>(find.byType(ImpaktfullUiTouchFeedback))
      .color;

  group('normal', () {
    testWidgets('tapping an unchecked checkbox emits true', (tester) async {
      final values = <bool>[];
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiCheckbox(value: false, onChanged: values.add),
      );
      await tester.tap(find.byType(ImpaktfullUiCheckbox));
      await tester.pump();
      expect(values, [true]);
    });

    testWidgets('tapping a checked checkbox emits false', (tester) async {
      final values = <bool>[];
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiCheckbox(value: true, onChanged: values.add),
      );
      await tester.tap(find.byType(ImpaktfullUiCheckbox));
      await tester.pump();
      expect(values, [false]);
    });

    testWidgets('a disabled checkbox does not emit', (tester) async {
      await pumpAndSettleComponent(
        tester,
        const ImpaktfullUiCheckbox(value: false, onChanged: null),
      );
      await tester.tap(find.byType(ImpaktfullUiCheckbox), warnIfMissed: false);
      await tester.pump();
      expect(tester.takeException(), isNull);
    });

    testWidgets('a controlled checkbox follows the value of the parent',
        (tester) async {
      final theme = defaultComponentsTheme.checkbox;
      final value = ValueNotifier(false);
      await pumpAndSettleComponent(
        tester,
        ValueListenableBuilder<bool>(
          valueListenable: value,
          builder: (context, current, child) => ImpaktfullUiCheckbox(
            value: current,
            onChanged: (newValue) => value.value = newValue,
          ),
        ),
      );
      expect(backgroundColor(tester), theme.colors.backgroundColor);
      expect(find.byType(ImpaktfullUiAssetWidget), findsNothing);

      await tester.tap(find.byType(ImpaktfullUiCheckbox));
      await tester.pumpAndSettle();
      expect(value.value, isTrue);
      expect(backgroundColor(tester), theme.colors.activeColor);
      expect(find.byType(ImpaktfullUiAssetWidget), findsOneWidget);

      value.value = false;
      await tester.pumpAndSettle();
      expect(backgroundColor(tester), theme.colors.backgroundColor);
    });
  });

  group('indeterminate', () {
    for (final entry in {null: true, false: true, true: false}.entries) {
      testWidgets('tapping ${entry.key} emits ${entry.value}', (tester) async {
        final values = <bool?>[];
        await pumpAndSettleComponent(
          tester,
          ImpaktfullUiCheckbox.indeterminate(
            value: entry.key,
            onChanged: values.add,
          ),
        );
        await tester.tap(find.byType(ImpaktfullUiCheckbox));
        await tester.pump();
        expect(values, [entry.value]);
      });
    }

    testWidgets('null shows the indeterminate icon', (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiCheckbox.indeterminate(value: null, onChanged: (_) {}),
      );
      expect(find.byType(ImpaktfullUiAssetWidget), findsOneWidget);
      expect(backgroundColor(tester),
          defaultComponentsTheme.checkbox.colors.activeColor);
    });

    test('the type is indeterminate', () {
      final checkbox =
          ImpaktfullUiCheckbox.indeterminate(value: null, onChanged: (_) {});
      expect(checkbox.type, ImpaktfullUiCheckboxType.indeterminate);
      expect(checkbox.onChanged, isNull);
      expect(checkbox.onChangedIndeterminate, isNotNull);
    });
  });

  group('keyboard', () {
    for (final key in [LogicalKeyboardKey.space, LogicalKeyboardKey.enter]) {
      testWidgets('${key.debugName} toggles the focused checkbox',
          (tester) async {
        final values = <bool>[];
        await pumpAndSettleComponent(
          tester,
          ImpaktfullUiCheckbox(value: false, onChanged: values.add),
        );
        await tester.sendKeyEvent(LogicalKeyboardKey.tab);
        await tester.pump();
        await tester.sendKeyEvent(key);
        await tester.pump();
        expect(values, [true]);
      });
    }

    testWidgets('a disabled checkbox can not be focused', (tester) async {
      await pumpAndSettleComponent(
        tester,
        const ImpaktfullUiCheckbox(value: false, onChanged: null),
      );
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();
      expect(FocusManager.instance.primaryFocus?.context?.widget,
          isNot(isA<InkWell>()));
    });
  });

  testWidgets('the theme override is used', (tester) async {
    final theme = defaultComponentsTheme.checkbox;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiCheckbox(
        value: true,
        onChanged: (_) {},
        theme: theme.copyWith(
          colors: theme.colors.copyWith(activeColor: customTestColor),
          assets: theme.assets.copyWith(check: customTestAsset),
        ),
      ),
    );
    expect(backgroundColor(tester), customTestColor);
    expect(
        find.byWidgetPredicate(isAssetWidget(customTestAsset)), findsOneWidget);
  });
}
