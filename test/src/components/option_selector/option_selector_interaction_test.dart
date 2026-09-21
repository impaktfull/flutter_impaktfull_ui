import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/screen_size_util.dart';
import '../../../util/test_util.dart';
import '../_inputs_test_helpers.dart';

void main() {
  const options = ['Belgium', 'France', 'The Netherlands'];

  /// Pumps a button that opens the option selector, the result is added to
  /// [results].
  Future<void> pumpOpener(
    WidgetTester tester,
    List<Object?> results, {
    String? selectedValue,
  }) async {
    await pumpAndSettleComponent(
      tester,
      Builder(
        builder: (context) => Center(
          child: ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: 'Open',
            onTap: () async {
              final result = await ImpaktfullUiOptionSelector.show<String>(
                context: context,
                title: 'Country',
                options: options,
                selectedValue: selectedValue,
              );
              results.add(result);
            },
          ),
        ),
      ),
    );
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
  }

  bool isSelected(WidgetTester tester, String title) => tester
      .widget<ImpaktfullUiSelectableListItem>(find.ancestor(
        of: find.text(title),
        matching: find.byType(ImpaktfullUiSelectableListItem),
      ))
      .isSelected;

  group('show', () {
    testWidgets('a small screen opens a screen and returns the tapped option',
        (tester) async {
      setScreenSize(tester, const Size(400, 800));
      final results = <Object?>[];
      await pumpOpener(tester, results);
      expect(find.byType(ImpaktfullUiScreen), findsOneWidget);
      expect(find.byType(ImpaktfullUiModal), findsNothing);
      await tester.tap(find.text('France'));
      await tester.pumpAndSettle();
      expect(results, ['France']);
      expect(find.byType(ImpaktfullUiOptionSelector<String>), findsNothing);
    });

    testWidgets('a large screen opens a modal and returns the tapped option',
        (tester) async {
      setScreenSize(tester, const Size(1400, 1000));
      final results = <Object?>[];
      await pumpOpener(tester, results);
      expect(find.byType(ImpaktfullUiModal), findsOneWidget);
      expect(find.text('Country'), findsOneWidget);
      await tester.tap(find.text('The Netherlands'));
      await tester.pumpAndSettle();
      expect(results, ['The Netherlands']);
    });

    testWidgets('the selected value is marked as selected', (tester) async {
      setScreenSize(tester, const Size(400, 800));
      await pumpOpener(tester, [], selectedValue: 'Belgium');
      expect(isSelected(tester, 'Belgium'), isTrue);
      expect(isSelected(tester, 'France'), isFalse);
    });

    testWidgets('tapping the selected value returns null', (tester) async {
      setScreenSize(tester, const Size(400, 800));
      final results = <Object?>[];
      await pumpOpener(tester, results, selectedValue: 'Belgium');
      await tester.tap(find.text('Belgium'));
      await tester.pumpAndSettle();
      expect(results, [null]);
    });

    testWidgets('going back returns null', (tester) async {
      setScreenSize(tester, const Size(400, 800));
      final results = <Object?>[];
      await pumpOpener(tester, results);
      final navigator = tester.state<NavigatorState>(find.byType(Navigator));
      navigator.pop();
      await tester.pumpAndSettle();
      expect(results, [null]);
    });
  });

  testWidgets('the title builder is used for other types', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiOptionSelector<int>(
        options: const [1, 2],
        selectedValue: 2,
        titleBuilder: (item) => 'Option $item',
      ),
    );
    expect(find.text('Option 1'), findsOneWidget);
    expect(isSelected(tester, 'Option 2'), isTrue);
  });

  testWidgets('an empty list shows the placeholder', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiOptionSelector<String>(options: []),
    );
    expect(find.text('No options'), findsOneWidget);
  });

  testWidgets('a theme override can be passed', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiOptionSelector<String>(
        options: options,
        theme: defaultComponentsTheme.optionSelector.copyWith(),
      ),
    );
    expect(tester.takeException(), isNull);
    expect(find.text('Belgium'), findsOneWidget);
  });

  group(
    'without a title builder',
    () {
      testWidgets('options that are not a String use toString', (tester) async {
        await pumpAndSettleComponent(
          tester,
          const ImpaktfullUiOptionSelector<int>(options: [1, 2]),
        );
        expect(tester.takeException(), isNull);
        expect(find.text('1'), findsOneWidget);
      });
    },
  );
}
