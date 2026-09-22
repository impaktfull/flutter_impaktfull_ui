import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/font_loader.dart';
import '../../../util/test_util.dart';
import '../_inputs_test_helpers.dart';

void main() {
  Widget wrap(Widget child) =>
      Center(child: SizedBox(width: 300, child: child));

  Future<void> openPicker(WidgetTester tester) async {
    // The picker is laid out for the real fonts, the square glyphs of the
    // default test font overflow its header.
    await loadImpaktfullUiFonts();
    await tester.tap(find.byType(ImpaktfullUiCard));
    await tester.pumpAndSettle();
  }

  Finder dayInPicker(String day) => find.descendant(
        of: find.byType(ImpaktfullUiDatePicker),
        matching: find.text(day),
      );

  testWidgets('shows the formatted date', (tester) async {
    await pumpAndSettleComponent(
      tester,
      wrap(ImpaktfullUiDateInputField(
        value: DateTime(2024, 3, 5),
        onChanged: (_) {},
      )),
    );
    expect(find.text('05/03/2024'), findsOneWidget);
  });

  testWidgets('uses the date format', (tester) async {
    await pumpAndSettleComponent(
      tester,
      wrap(ImpaktfullUiDateInputField(
        value: DateTime(2024, 3, 5),
        dateFormat: 'yyyy-MM-dd',
        onChanged: (_) {},
      )),
    );
    expect(find.text('2024-03-05'), findsOneWidget);
  });

  testWidgets('shows the placeholder without a date', (tester) async {
    final theme = defaultComponentsTheme.dateInputField;
    await pumpAndSettleComponent(
      tester,
      wrap(ImpaktfullUiDateInputField(
        value: null,
        placeholder: 'Pick a date',
        onChanged: (_) {},
      )),
    );
    expect(tester.widget<Text>(find.text('Pick a date')).style,
        theme.textStyles.placeholder);
  });

  testWidgets('a new date from the parent is shown', (tester) async {
    final date = ValueNotifier<DateTime?>(DateTime(2024, 1, 1));
    await pumpAndSettleComponent(
      tester,
      wrap(ValueListenableBuilder<DateTime?>(
        valueListenable: date,
        builder: (context, value, child) => ImpaktfullUiDateInputField(
          value: value,
          placeholder: 'Empty',
          onChanged: (_) {},
        ),
      )),
    );
    date.value = DateTime(2025, 12, 31);
    await tester.pumpAndSettle();
    expect(find.text('31/12/2025'), findsOneWidget);
    date.value = null;
    await tester.pumpAndSettle();
    expect(find.text('Empty'), findsOneWidget);
  });

  group('picker', () {
    testWidgets('apply calls onChanged with the picked date', (tester) async {
      final dates = <DateTime?>[];
      await pumpAndSettleComponent(
        tester,
        wrap(ImpaktfullUiDateInputField(
          value: DateTime(2024, 3, 5),
          onChanged: dates.add,
        )),
      );
      await openPicker(tester);
      expect(find.byType(ImpaktfullUiDatePicker), findsOneWidget);
      await tester.tap(dayInPicker('20'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Apply'));
      await tester.pumpAndSettle();
      expect(dates, hasLength(1));
      expect(dates.single?.year, 2024);
      expect(dates.single?.month, 3);
      expect(dates.single?.day, 20);
      expect(find.byType(ImpaktfullUiDatePicker), findsNothing);
    });

    testWidgets('cancel does not call onChanged', (tester) async {
      final dates = <DateTime?>[];
      await pumpAndSettleComponent(
        tester,
        wrap(ImpaktfullUiDateInputField(
          value: DateTime(2024, 3, 5),
          onChanged: dates.add,
        )),
      );
      await openPicker(tester);
      await tester.tap(dayInPicker('20'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();
      expect(dates, isEmpty);
    });

    testWidgets('a disabled field does not open the picker', (tester) async {
      await pumpAndSettleComponent(
        tester,
        wrap(ImpaktfullUiDateInputField(
          value: DateTime(2024, 3, 5),
          isDisabled: true,
          onChanged: (_) {},
        )),
      );
      await tester.tap(find.byType(ImpaktfullUiCard), warnIfMissed: false);
      await tester.pumpAndSettle();
      expect(find.byType(ImpaktfullUiDatePicker), findsNothing);
      final opacity = tester.widget<Opacity>(find
          .ancestor(
            of: find.byType(ImpaktfullUiCard),
            matching: find.byType(Opacity),
          )
          .first);
      expect(opacity.opacity, 0.66);
    });
  });

  group('hint and error', () {
    testWidgets('the error replaces the hint', (tester) async {
      await pumpAndSettleComponent(
        tester,
        wrap(ImpaktfullUiDateInputField(
          value: null,
          hint: 'Hint',
          error: 'Error',
          onChanged: (_) {},
        )),
      );
      expect(find.text('Hint'), findsNothing);
      expect(find.text('Error'), findsOneWidget);
      expect(
          tester.widget<ImpaktfullUiCard>(find.byType(ImpaktfullUiCard)).error,
          isTrue);
    });

    testWidgets('the hint is shown without an error', (tester) async {
      await pumpAndSettleComponent(
        tester,
        wrap(ImpaktfullUiDateInputField(
          value: null,
          hint: 'Hint',
          onChanged: (_) {},
        )),
      );
      expect(find.text('Hint'), findsOneWidget);
    });
  });

  testWidgets('the label and label actions are shown', (tester) async {
    await pumpAndSettleComponent(
      tester,
      wrap(ImpaktfullUiDateInputField(
        value: null,
        label: 'Birthday',
        labelActions: const [Text('Action')],
        onChanged: (_) {},
      )),
    );
    expect(find.text('Birthday'), findsOneWidget);
    expect(find.text('Action'), findsOneWidget);
  });

  testWidgets('the theme override is used', (tester) async {
    final theme = defaultComponentsTheme.dateInputField;
    await pumpAndSettleComponent(
      tester,
      wrap(ImpaktfullUiDateInputField(
        value: DateTime(2024, 3, 5),
        onChanged: (_) {},
        theme: theme.copyWith(
          textStyles: theme.textStyles.copyWith(
            text: theme.textStyles.text.copyWith(color: customTestColor),
          ),
        ),
      )),
    );
    expect(tester.widget<Text>(find.text('05/03/2024')).style?.color,
        customTestColor);
  });

  group(
    'theme colors',
    () {
      testWidgets('the background color of the theme override is used',
          (tester) async {
        final theme = defaultComponentsTheme.dateInputField;
        await pumpAndSettleComponent(
          tester,
          wrap(ImpaktfullUiDateInputField(
            value: null,
            onChanged: (_) {},
            theme: theme.copyWith(
              colors: theme.colors.copyWith(background: customTestColor),
            ),
          )),
        );
        expect(
          find.descendant(
            of: find.byType(ImpaktfullUiDateInputField),
            matching: find.byWidgetPredicate((widget) =>
                widget is ImpaktfullUiContainer &&
                widget.color == customTestColor),
          ),
          findsWidgets,
        );
      });
    },
  );
}
