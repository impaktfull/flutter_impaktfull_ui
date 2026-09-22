import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/dropdown/widget/dropdown_overlay.dart';

import '../../../util/test_util.dart';

void main() {
  Widget buildDropdown({
    String buttonText = 'Open',
    String content = 'Dropdown content',
    ImpaktfullUiDropdownController? controller,
  }) =>
      ImpaktfullUiDropdown<void>(
        buttonTitle: buttonText,
        controller: controller,
        alignment: ImpaktfullUiDropdownAlignment.bottomLeft,
        child: Text(content),
      );

  testWidgets('the open animation is visible', (tester) async {
    await pumpAndSettleComponent(tester, Center(child: buildDropdown()));
    await tester.tap(find.text('Open'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    // Halfway the animation the overlay is already shown and fading in
    expect(find.text('Dropdown content'), findsOneWidget);
    final fadeTransition = tester.widget<FadeTransition>(
      find
          .ancestor(
            of: find.text('Dropdown content'),
            matching: find.byType(FadeTransition),
          )
          .first,
    );
    expect(fadeTransition.opacity.value, greaterThan(0));
    expect(fadeTransition.opacity.value, lessThan(1));

    await tester.pumpAndSettle();
    expect(find.text('Dropdown content'), findsOneWidget);
  });

  testWidgets('tapping outside closes the dropdown', (tester) async {
    final controller = ImpaktfullUiDropdownController();
    await pumpAndSettleComponent(
      tester,
      Center(child: buildDropdown(controller: controller)),
    );
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    expect(controller.isOpen, isTrue);

    await tester.tapAt(const Offset(5, 5));
    await tester.pumpAndSettle();
    expect(controller.isOpen, isFalse);
    expect(find.text('Dropdown content'), findsNothing);
  });

  testWidgets('disposing an open dropdown does not throw', (tester) async {
    await pumpAndSettleComponent(tester, Center(child: buildDropdown()));
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    expect(find.text('Dropdown content'), findsOneWidget);

    await pumpAndSettleComponent(tester, const SizedBox());
    expect(tester.takeException(), isNull);
  });

  testWidgets('disposing a closing dropdown does not throw', (tester) async {
    final controller = ImpaktfullUiDropdownController();
    await pumpAndSettleComponent(
      tester,
      Center(child: buildDropdown(controller: controller)),
    );
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    unawaited(controller.close());
    await tester.pump(const Duration(milliseconds: 50));

    await pumpAndSettleComponent(tester, const SizedBox());
    expect(tester.takeException(), isNull);
  });

  testWidgets('every dropdown can be closed on its own', (tester) async {
    final controllerA = ImpaktfullUiDropdownController();
    final controllerB = ImpaktfullUiDropdownController();
    await pumpAndSettleComponent(
      tester,
      Column(
        children: [
          buildDropdown(
            buttonText: 'A',
            content: 'Content A',
            controller: controllerA,
          ),
          buildDropdown(
            buttonText: 'B',
            content: 'Content B',
            controller: controllerB,
          ),
        ],
      ),
    );
    unawaited(controllerA.open());
    await tester.pumpAndSettle();
    unawaited(controllerB.open());
    await tester.pumpAndSettle();
    expect(controllerA.isOpen, isTrue);
    expect(controllerB.isOpen, isTrue);

    unawaited(controllerA.close());
    await tester.pumpAndSettle();
    expect(controllerA.isOpen, isFalse);
    expect(find.text('Content A'), findsNothing);
    expect(controllerB.isOpen, isTrue);

    unawaited(controllerB.close());
    await tester.pumpAndSettle();
    expect(controllerB.isOpen, isFalse);
  });

  testWidgets('the overlay width follows the width of the dropdown',
      (tester) async {
    final width = ValueNotifier<double>(200);
    await pumpAndSettleComponent(
      tester,
      Align(
        alignment: Alignment.topLeft,
        child: ValueListenableBuilder<double>(
          valueListenable: width,
          builder: (context, value, child) => SizedBox(
            width: value,
            child: buildDropdown(),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    expect(
      tester
          .widget<ImpaktfullUiDropdownOverlay>(
              find.byType(ImpaktfullUiDropdownOverlay))
          .width,
      200,
    );

    width.value = 300;
    await tester.pumpAndSettle();
    expect(
      tester
          .widget<ImpaktfullUiDropdownOverlay>(
              find.byType(ImpaktfullUiDropdownOverlay))
          .width,
      300,
    );
  });
}
