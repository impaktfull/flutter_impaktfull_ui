import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/dropdown/widget/dropdown_overlay.dart';

import '../../../util/test_util.dart';
import '../_inputs_test_helpers.dart';

void main() {
  const items = [
    ImpaktfullUiDropdownItem(title: 'One', value: 1),
    ImpaktfullUiDropdownItem(title: 'Two', value: 2),
  ];

  Widget buildSut({
    List<ImpaktfullUiDropdownItem<int>> items = items,
    ImpaktfullUiDropdownController? controller,
    ValueChanged<int>? onSelected,
    ImpaktfullUiDropdownTheme? theme,
    double? childWidth,
  }) =>
      Align(
        alignment: Alignment.topLeft,
        child: ImpaktfullUiDropdown<int>.builder(
          buttonTitle: 'Open',
          controller: controller,
          alignment: ImpaktfullUiDropdownAlignment.bottomLeft,
          childWidth: childWidth,
          theme: theme,
          items: items,
          noDataLabel: 'No items',
          itemBuilder: (context, item, index, controller) =>
              ImpaktfullUiSimpleListItem(
            title: item.title,
            onTap: () {
              onSelected?.call(item.value);
              controller.close();
            },
          ),
        ),
      );

  testWidgets('tapping the button opens and closes the dropdown',
      (tester) async {
    final controller = ImpaktfullUiDropdownController();
    await pumpAndSettleComponent(tester, buildSut(controller: controller));
    expect(controller.isOpen, isFalse);
    expect(find.text('One'), findsNothing);

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    expect(controller.isOpen, isTrue);
    expect(find.text('One'), findsOneWidget);
    expect(find.text('Two'), findsOneWidget);

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    expect(controller.isOpen, isFalse);
    expect(find.text('One'), findsNothing);
  });

  testWidgets('selecting an item calls back and closes via the controller',
      (tester) async {
    final selected = <int>[];
    await pumpAndSettleComponent(tester, buildSut(onSelected: selected.add));
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Two'));
    await tester.pumpAndSettle();
    expect(selected, [2]);
    expect(find.text('Two'), findsNothing);
  });

  testWidgets('an empty list shows the no data label', (tester) async {
    await pumpAndSettleComponent(tester, buildSut(items: const []));
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    expect(find.text('No items'), findsOneWidget);
  });

  testWidgets('the controller opens and closes the dropdown', (tester) async {
    final controller = ImpaktfullUiDropdownController();
    await pumpAndSettleComponent(tester, buildSut(controller: controller));
    unawaited(controller.open());
    await tester.pumpAndSettle();
    expect(controller.isOpen, isTrue);
    expect(find.text('One'), findsOneWidget);

    unawaited(controller.close());
    await tester.pumpAndSettle();
    expect(controller.isOpen, isFalse);
    expect(find.text('One'), findsNothing);
  });

  testWidgets('a controller without a dropdown is closed', (tester) async {
    final controller = ImpaktfullUiDropdownController();
    expect(controller.isOpen, isFalse);
    await controller.open();
    await controller.close();
    expect(controller.isOpen, isFalse);
  });

  testWidgets('childWidth sets the width of the overlay', (tester) async {
    await pumpAndSettleComponent(tester, buildSut(childWidth: 250));
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    expect(tester.getSize(find.byType(ImpaktfullUiDropdownOverlay)).width, 250);
  });

  testWidgets('the theme override is used', (tester) async {
    final theme = defaultComponentsTheme.dropdown;
    final dropUp = ImpaktfullUiAsset.icon(Icons.arrow_upward);
    await pumpAndSettleComponent(
      tester,
      buildSut(
        theme: theme.copyWith(
          assets:
              theme.assets.copyWith(dropDown: customTestAsset, dropUp: dropUp),
        ),
      ),
    );
    expect(
        tester
            .widget<ImpaktfullUiButton>(find.byType(ImpaktfullUiButton))
            .trailingAsset,
        same(customTestAsset));
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    expect(
        tester
            .widget<ImpaktfullUiButton>(find.byType(ImpaktfullUiButton))
            .trailingAsset,
        same(dropUp));
  });

  group(
    'controller',
    () {
      testWidgets('a new controller from the parent can open the dropdown',
          (tester) async {
        final controller = ValueNotifier(ImpaktfullUiDropdownController());
        await pumpAndSettleComponent(
          tester,
          ValueListenableBuilder<ImpaktfullUiDropdownController>(
            valueListenable: controller,
            builder: (context, value, child) => buildSut(controller: value),
          ),
        );
        final newController = ImpaktfullUiDropdownController();
        controller.value = newController;
        await tester.pumpAndSettle();
        unawaited(newController.open());
        await tester.pumpAndSettle();
        expect(newController.isOpen, isTrue);
        expect(find.text('One'), findsOneWidget);
      });
    },
  );
}
