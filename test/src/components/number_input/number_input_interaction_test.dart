import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_inputs_test_helpers.dart';

void main() {
  String shownText(WidgetTester tester) =>
      tester.widget<TextField>(find.byType(TextField)).controller!.text;

  Finder decrementButton() => find.byType(ImpaktfullUiButton).first;

  Finder incrementButton() => find.byType(ImpaktfullUiButton).last;

  /// Pumps a controlled number input, the value is stored in [value].
  Future<void> pumpNumberInput<T extends num>(
    WidgetTester tester,
    ValueNotifier<T> value, {
    List<T>? changes,
    T? min,
    T? max,
    T? step,
    ImpaktfullUiNumberInputTheme? theme,
  }) =>
      pumpAndSettleComponent(
        tester,
        ValueListenableBuilder<T>(
          valueListenable: value,
          builder: (context, current, child) => ImpaktfullUiNumberInput<T>(
            value: current,
            min: min,
            max: max,
            step: step,
            theme: theme,
            onChanged: (newValue) {
              changes?.add(newValue);
              value.value = newValue;
            },
          ),
        ),
      );

  group('buttons', () {
    testWidgets('decrement lowers the value by one', (tester) async {
      final value = ValueNotifier<int>(5);
      await pumpNumberInput(tester, value);
      await tester.tap(decrementButton());
      await tester.pumpAndSettle();
      expect(value.value, 4);
      expect(shownText(tester), '4');
    });

    testWidgets('the step is used', (tester) async {
      final value = ValueNotifier<int>(10);
      await pumpNumberInput(tester, value, step: 5);
      await tester.tap(incrementButton());
      await tester.pumpAndSettle();
      expect(value.value, 15);
      await tester.tap(decrementButton());
      await tester.pumpAndSettle();
      await tester.tap(decrementButton());
      await tester.pumpAndSettle();
      expect(value.value, 5);
    });

    testWidgets('a double step is used', (tester) async {
      final value = ValueNotifier<double>(1);
      await pumpNumberInput(tester, value, step: 0.5);
      await tester.tap(incrementButton());
      await tester.pumpAndSettle();
      expect(value.value, 1.5);
      expect(shownText(tester), '1.5');
    });

    testWidgets('decrement at min does not call onChanged', (tester) async {
      final value = ValueNotifier<int>(0);
      final changes = <int>[];
      await pumpNumberInput(tester, value, changes: changes, min: 0);
      await tester.tap(decrementButton());
      await tester.pumpAndSettle();
      expect(changes, isEmpty);
      expect(shownText(tester), '0');
    });

    testWidgets('increment at max does not call onChanged', (tester) async {
      final value = ValueNotifier<int>(10);
      final changes = <int>[];
      await pumpNumberInput(tester, value, changes: changes, max: 10);
      await tester.tap(incrementButton());
      await tester.pumpAndSettle();
      expect(changes, isEmpty);
      expect(shownText(tester), '10');
    });

    testWidgets('increment stops at max', (tester) async {
      final value = ValueNotifier<int>(8);
      await pumpNumberInput(tester, value, max: 9);
      await tester.tap(incrementButton());
      await tester.pumpAndSettle();
      await tester.tap(incrementButton());
      await tester.pumpAndSettle();
      expect(value.value, 9);
    });
  });

  group('typing', () {
    testWidgets('an int is emitted', (tester) async {
      final value = ValueNotifier<int>(0);
      await pumpNumberInput(tester, value);
      await tester.enterText(find.byType(TextField), '123');
      await tester.pumpAndSettle();
      expect(value.value, 123);
    });

    testWidgets('a value below min is clamped', (tester) async {
      final value = ValueNotifier<int>(5);
      await pumpNumberInput(tester, value, min: 1);
      await tester.enterText(find.byType(TextField), '-3');
      await tester.pumpAndSettle();
      expect(value.value, 1);
    });

    testWidgets('letters are not accepted for an int', (tester) async {
      final value = ValueNotifier<int>(7);
      final changes = <int>[];
      await pumpNumberInput(tester, value, changes: changes);
      await tester.enterText(find.byType(TextField), '7a');
      await tester.pumpAndSettle();
      expect(changes, isEmpty);
      expect(shownText(tester), '7');
    });

    testWidgets('a decimal comma is accepted for a double', (tester) async {
      final value = ValueNotifier<double>(0);
      await pumpNumberInput(tester, value);
      await tester.enterText(find.byType(TextField), '2,5');
      await tester.pumpAndSettle();
      expect(value.value, 2.5);
    });

    testWidgets('an incomplete value keeps the current value', (tester) async {
      final value = ValueNotifier<int>(4);
      final changes = <int>[];
      await pumpNumberInput(tester, value, changes: changes);
      await tester.enterText(find.byType(TextField), '-');
      await tester.pumpAndSettle();
      expect(changes, [4]);
      expect(shownText(tester), '-');

      FocusManager.instance.primaryFocus?.unfocus();
      await tester.pumpAndSettle();
      expect(shownText(tester), '4');
    });

    testWidgets('an empty field shows the value after unfocus', (tester) async {
      final value = ValueNotifier<int>(4);
      await pumpNumberInput(tester, value);
      await tester.enterText(find.byType(TextField), '');
      await tester.pumpAndSettle();
      expect(value.value, 4);
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.pumpAndSettle();
      expect(shownText(tester), '4');
    });
  });

  testWidgets('shows the label', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiNumberInput<int>(
        label: 'Quantity',
        value: 1,
        onChanged: (_) {},
      ),
    );
    expect(find.text('Quantity'), findsOneWidget);
  });

  testWidgets('the theme override is used', (tester) async {
    final theme = defaultComponentsTheme.numberInput;
    final plus = ImpaktfullUiAsset.icon(Icons.exposure_plus_1);
    await pumpNumberInput(
      tester,
      ValueNotifier<int>(0),
      theme: theme.copyWith(
        assets: theme.assets.copyWith(minus: customTestAsset, plus: plus),
      ),
    );
    expect(
      tester.widget<ImpaktfullUiButton>(decrementButton()).leadingAsset,
      same(customTestAsset),
    );
    expect(
      tester.widget<ImpaktfullUiButton>(incrementButton()).leadingAsset,
      same(plus),
    );
  });
}
