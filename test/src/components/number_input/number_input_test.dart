import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  String shownText(WidgetTester tester) =>
      tester.widget<TextField>(find.byType(TextField)).controller!.text;

  testWidgets('a new value from the parent is shown', (tester) async {
    final value = ValueNotifier<int>(1);
    await pumpAndSettleComponent(
      tester,
      ValueListenableBuilder<int>(
        valueListenable: value,
        builder: (context, current, child) => ImpaktfullUiNumberInput<int>(
          value: current,
          onChanged: (newValue) => value.value = newValue,
        ),
      ),
    );
    expect(shownText(tester), '1');

    value.value = 42;
    await tester.pumpAndSettle();
    expect(shownText(tester), '42');
  });

  testWidgets('the increment button updates the text', (tester) async {
    final value = ValueNotifier<int>(1);
    await pumpAndSettleComponent(
      tester,
      ValueListenableBuilder<int>(
        valueListenable: value,
        builder: (context, current, child) => ImpaktfullUiNumberInput<int>(
          value: current,
          onChanged: (newValue) => value.value = newValue,
        ),
      ),
    );
    await tester.tap(find.byType(ImpaktfullUiButton).last);
    await tester.pumpAndSettle();
    expect(value.value, 2);
    expect(shownText(tester), '2');
  });

  testWidgets('typed text is kept while typing a decimal', (tester) async {
    final value = ValueNotifier<double>(1);
    await pumpAndSettleComponent(
      tester,
      ValueListenableBuilder<double>(
        valueListenable: value,
        builder: (context, current, child) => ImpaktfullUiNumberInput<double>(
          value: current,
          onChanged: (newValue) => value.value = newValue,
        ),
      ),
    );
    await tester.enterText(find.byType(TextField), '2.');
    await tester.pumpAndSettle();
    expect(value.value, 2);
    expect(shownText(tester), '2.');
  });

  testWidgets('out of range text shows the clamped value after unfocus',
      (tester) async {
    final value = ValueNotifier<int>(1);
    await pumpAndSettleComponent(
      tester,
      ValueListenableBuilder<int>(
        valueListenable: value,
        builder: (context, current, child) => ImpaktfullUiNumberInput<int>(
          value: current,
          max: 100,
          onChanged: (newValue) => value.value = newValue,
        ),
      ),
    );
    await tester.enterText(find.byType(TextField), '150');
    await tester.pumpAndSettle();
    expect(value.value, 100);

    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    expect(shownText(tester), '100');
  });
}
