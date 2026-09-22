import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  testWidgets('a new controller is used', (tester) async {
    final controllerA = TextEditingController(text: 'A');
    final controllerB = TextEditingController(text: 'B');
    addTearDown(controllerA.dispose);
    addTearDown(controllerB.dispose);
    final controller = ValueNotifier(controllerA);
    await pumpAndSettleComponent(
      tester,
      ValueListenableBuilder<TextEditingController>(
        valueListenable: controller,
        builder: (context, current, child) => ImpaktfullUiInputField(
          value: null,
          controller: current,
          onChanged: (_) {},
        ),
      ),
    );
    expect(tester.widget<TextField>(find.byType(TextField)).controller,
        controllerA);

    controller.value = controllerB;
    await tester.pumpAndSettle();
    expect(tester.widget<TextField>(find.byType(TextField)).controller,
        controllerB);
    expect(find.text('B'), findsOneWidget);
  });

  testWidgets('a new focus node is used', (tester) async {
    final focusNodeA = FocusNode();
    final focusNodeB = FocusNode();
    addTearDown(focusNodeA.dispose);
    addTearDown(focusNodeB.dispose);
    final focusNode = ValueNotifier(focusNodeA);
    final focusChanges = <bool>[];
    await pumpAndSettleComponent(
      tester,
      ValueListenableBuilder<FocusNode>(
        valueListenable: focusNode,
        builder: (context, current, child) => ImpaktfullUiInputField(
          value: '',
          focusNode: current,
          onChanged: (_) {},
          onFocusChange: focusChanges.add,
        ),
      ),
    );
    focusNode.value = focusNodeB;
    await tester.pumpAndSettle();
    expect(
        tester.widget<TextField>(find.byType(TextField)).focusNode, focusNodeB);

    focusNodeB.requestFocus();
    await tester.pumpAndSettle();
    expect(focusChanges, [true]);
  });

  testWidgets('a new value from the parent keeps the selection',
      (tester) async {
    final controller = TextEditingController(text: 'hello');
    addTearDown(controller.dispose);
    final value = ValueNotifier('hello');
    await pumpAndSettleComponent(
      tester,
      ValueListenableBuilder<String>(
        valueListenable: value,
        builder: (context, current, child) => ImpaktfullUiInputField(
          value: current,
          controller: controller,
          onChanged: (_) {},
        ),
      ),
    );
    controller.selection = const TextSelection.collapsed(offset: 2);
    value.value = 'hello world';
    await tester.pumpAndSettle();
    expect(controller.text, 'hello world');
    expect(controller.selection, const TextSelection.collapsed(offset: 2));

    // The selection is clamped when the text becomes shorter
    controller.selection = const TextSelection.collapsed(offset: 11);
    value.value = 'hi';
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(controller.text, 'hi');
    expect(controller.selection, const TextSelection.collapsed(offset: 2));
  });
}
