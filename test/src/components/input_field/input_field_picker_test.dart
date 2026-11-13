import 'package:material_ui/material_ui.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../../accessibility/_accessibility_test_helpers.dart';
import '../_inputs_test_helpers.dart';

/// The semantics node of the picker field: the only button in the tree.
SemanticsNode _pickerSemantics() => find.semantics
    .byPredicate((node) => node.flagsCollection.isButton)
    .evaluate()
    .single;

void main() {
  group('a picker field (onTap)', () {
    testWidgets('a tap calls onTap and opens no keyboard', (tester) async {
      var taps = 0;
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiInputField(
          value: 'Belgium',
          onChanged: null,
          onTap: () => taps++,
        ),
      );
      expect(find.byType(TextField), findsNothing);
      expect(find.byType(EditableText), findsNothing);
      await tester.tap(find.text('Belgium'));
      await tester.pumpAndSettle();
      expect(taps, 1);
      expect(tester.testTextInput.isVisible, isFalse);
      expect(tester.testTextInput.hasAnyClients, isFalse);
    });

    testWidgets('onTap wins over onChanged and readOnly', (tester) async {
      var taps = 0;
      final values = <String>[];
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiInputField(
          value: 'Belgium',
          readOnly: true,
          onChanged: values.add,
          onTap: () => taps++,
        ),
      );
      expect(find.byType(TextField), findsNothing);
      await tester.tap(find.text('Belgium'));
      await tester.pumpAndSettle();
      expect(taps, 1);
      expect(values, isEmpty);
    });

    testWidgets('shows the placeholder in the placeholder style without value',
        (tester) async {
      final theme = defaultComponentsTheme.inputField;
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiInputField(
          value: null,
          placeholder: 'Choose a country',
          onChanged: null,
          onTap: () {},
        ),
      );
      final text = tester.widget<Text>(find.text('Choose a country'));
      expect(text.style?.color, theme.textStyles.placeholder.color);
      expect(text.style?.fontSize, theme.textStyles.placeholder.fontSize);
    });

    testWidgets('shows the value in the text style', (tester) async {
      final theme = defaultComponentsTheme.inputField;
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiInputField(
          value: 'Belgium',
          placeholder: 'Choose a country',
          onChanged: null,
          onTap: () {},
        ),
      );
      expect(find.text('Choose a country'), findsNothing);
      final text = tester.widget<Text>(find.text('Belgium'));
      expect(text.style?.color, theme.textStyles.text.color);
      expect(text.style?.fontSize, theme.textStyles.text.fontSize);
    });

    testWidgets('shows a new value from the parent', (tester) async {
      final value = ValueNotifier<String?>(null);
      await pumpAndSettleComponent(
        tester,
        ValueListenableBuilder<String?>(
          valueListenable: value,
          builder: (context, current, child) => ImpaktfullUiInputField(
            value: current,
            placeholder: 'Choose a country',
            onChanged: null,
            onTap: () {},
          ),
        ),
      );
      expect(find.text('Choose a country'), findsOneWidget);
      value.value = 'Belgium';
      await tester.pumpAndSettle();
      expect(find.text('Belgium'), findsOneWidget);
      expect(find.text('Choose a country'), findsNothing);
      value.value = null;
      await tester.pumpAndSettle();
      expect(find.text('Choose a country'), findsOneWidget);
    });

    testWidgets('shows the text of the controller and follows it',
        (tester) async {
      final controller = TextEditingController(text: 'Belgium');
      addTearDown(controller.dispose);
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiInputField(
          value: null,
          controller: controller,
          onChanged: null,
          onTap: () {},
        ),
      );
      expect(find.text('Belgium'), findsOneWidget);
      controller.text = 'France';
      await tester.pump();
      expect(find.text('France'), findsOneWidget);
    });

    testWidgets('looks enabled and keeps label, hint, icon and actions',
        (tester) async {
      final icons = ImpaktfullUiTheme.getDefault().assets.icons;
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiInputField(
          label: 'Country',
          hint: 'Where you live',
          value: 'Belgium',
          leadingIcon: icons.search,
          trailingInputActions: [
            ImpaktfullUiAssetWidget(asset: icons.chevronDown),
          ],
          onChanged: null,
          onTap: () {},
        ),
      );
      final opacity = tester.widget<Opacity>(find.descendant(
        of: find.byType(ImpaktfullUiInputField),
        matching: find.byType(Opacity),
      ));
      expect(opacity.opacity, 1);
      expect(find.text('Country'), findsOneWidget);
      expect(find.text('Where you live'), findsOneWidget);
      expect(
          find.byWidgetPredicate(isAssetWidget(icons.search)), findsOneWidget);
      expect(find.byWidgetPredicate(isAssetWidget(icons.chevronDown)),
          findsOneWidget);
    });

    testWidgets('shows the error and marks the card', (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiInputField(
          value: null,
          hint: 'Hint',
          error: 'Choose a country',
          onChanged: null,
          onTap: () {},
        ),
      );
      expect(find.text('Hint'), findsNothing);
      expect(find.text('Choose a country'), findsOneWidget);
      expect(
        tester.widget<ImpaktfullUiCard>(find.byType(ImpaktfullUiCard)).error,
        isTrue,
      );
    });

    testWidgets('has no show/hide button with obscureText', (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiInputField(
          value: 'Belgium',
          obscureText: true,
          onChanged: null,
          onTap: () {},
        ),
      );
      expect(find.byType(ImpaktfullUiIconButton), findsNothing);
      expect(find.text('Belgium'), findsOneWidget);
    });

    testWidgets('a trailing input action keeps its own tap', (tester) async {
      var fieldTaps = 0;
      var actionTaps = 0;
      final icons = ImpaktfullUiTheme.getDefault().assets.icons;
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiInputField(
          value: 'Belgium',
          trailingInputActions: [
            ImpaktfullUiIconButton(
              asset: icons.close,
              onTap: () => actionTaps++,
            ),
          ],
          onChanged: null,
          onTap: () => fieldTaps++,
        ),
      );
      await tester.tap(find.byType(ImpaktfullUiIconButton));
      await tester.pumpAndSettle();
      expect(actionTaps, 1);
      expect(fieldTaps, 0);
    });

    testWidgets('is as tall as a text field, with the same text style',
        (tester) async {
      await pumpAndSettleComponent(
        tester,
        Column(
          children: [
            ImpaktfullUiInputField(
              key: const Key('text'),
              value: 'Belgium',
              onChanged: (_) {},
            ),
            ImpaktfullUiInputField(
              key: const Key('picker'),
              value: 'Belgium',
              onChanged: null,
              onTap: () {},
            ),
          ],
        ),
      );
      expect(
        tester.getSize(find.byKey(const Key('picker'))).height,
        tester.getSize(find.byKey(const Key('text'))).height,
      );
      // The value looks like the text of the text field.
      final pickerText = tester.widget<Text>(find.descendant(
        of: find.byKey(const Key('picker')),
        matching: find.text('Belgium'),
      ));
      expect(
        pickerText.style,
        tester.widget<EditableText>(find.byType(EditableText)).style,
      );
    });

    group('focus', () {
      testWidgets('a tap focuses the field and calls onFocusChange',
          (tester) async {
        final focusChanges = <bool>[];
        final focusNode = FocusNode();
        addTearDown(focusNode.dispose);
        await pumpAndSettleComponent(
          tester,
          ImpaktfullUiInputField(
            value: 'Belgium',
            focusNode: focusNode,
            onChanged: null,
            onFocusChange: focusChanges.add,
            onTap: () {},
          ),
        );
        await tester.tap(find.text('Belgium'));
        await tester.pumpAndSettle();
        expect(focusNode.hasFocus, isTrue);
        expect(focusChanges, [true]);
        focusNode.unfocus();
        await tester.pumpAndSettle();
        expect(focusChanges, [true, false]);
      });

      testWidgets('a focused field shows the focused border', (tester) async {
        final theme = defaultComponentsTheme.inputField;
        final focusNode = FocusNode();
        addTearDown(focusNode.dispose);
        await pumpAndSettleComponent(
          tester,
          ImpaktfullUiInputField(
            value: 'Belgium',
            focusNode: focusNode,
            onChanged: null,
            onTap: () {},
            theme: theme.copyWith(
              colors: theme.colors.copyWith(borderFocused: customTestColor),
            ),
          ),
        );
        ImpaktfullUiCardTheme? cardTheme() => tester
            .widget<ImpaktfullUiCard>(find.byType(ImpaktfullUiCard))
            .theme;
        expect(cardTheme()?.colors.border, isNot(customTestColor));
        focusNode.requestFocus();
        await tester.pumpAndSettle();
        expect(cardTheme()?.colors.border, customTestColor);
      });

      testWidgets('autofocus focuses the field', (tester) async {
        final focusNode = FocusNode();
        addTearDown(focusNode.dispose);
        await pumpAndSettleComponent(
          tester,
          ImpaktfullUiInputField(
            value: 'Belgium',
            focusNode: focusNode,
            autofocus: true,
            onChanged: null,
            onTap: () {},
          ),
        );
        expect(focusNode.hasFocus, isTrue);
      });
    });

    for (final key in [LogicalKeyboardKey.enter, LogicalKeyboardKey.space]) {
      testWidgets('${key.keyLabel} calls onTap when focused with tab',
          (tester) async {
        var taps = 0;
        await pumpAccessibilityApp(
          tester,
          ImpaktfullUiInputField(
            label: 'Country',
            value: 'Belgium',
            onChanged: null,
            onTap: () => taps++,
          ),
        );
        await tester.sendKeyEvent(LogicalKeyboardKey.tab);
        await tester.pump();
        await tester.sendKeyEvent(key);
        await tester.pumpAndSettle();
        expect(taps, 1);
        expect(tester.testTextInput.hasAnyClients, isFalse);
      });
    }

    testWidgets('is one tab stop', (tester) async {
      final focusNode = FocusNode();
      addTearDown(focusNode.dispose);
      await pumpAccessibilityApp(
        tester,
        Column(
          children: [
            ImpaktfullUiInputField(
              value: 'Belgium',
              focusNode: focusNode,
              onChanged: null,
              onTap: () {},
            ),
            ImpaktfullUiButton(
              type: ImpaktfullUiButtonType.primary,
              title: 'Next',
              onTap: () {},
            ),
          ],
        ),
      );
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();
      expect(focusNode.hasFocus, isTrue);
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();
      expect(focusNode.hasFocus, isFalse);
    });

    group('semantics', () {
      testWidgets('is a button with the label and the value', (tester) async {
        final handle = tester.ensureSemantics();
        var taps = 0;
        await pumpAccessibilityApp(
          tester,
          ImpaktfullUiInputField(
            label: 'Country',
            placeholder: 'Choose a country',
            value: 'Belgium',
            onChanged: null,
            onTap: () => taps++,
          ),
        );
        expect(
          _pickerSemantics(),
          matchesSemantics(
            label: 'Country',
            value: 'Belgium',
            isButton: true,
            hasEnabledState: true,
            isEnabled: true,
            isFocusable: true,
            hasTapAction: true,
            hasFocusAction: true,
          ),
        );
        tester.semantics.tap(
          find.semantics.byPredicate((node) => node.flagsCollection.isButton),
        );
        expect(taps, 1);
        handle.dispose();
      });

      testWidgets('announces the placeholder without a value', (tester) async {
        final handle = tester.ensureSemantics();
        await pumpAccessibilityApp(
          tester,
          ImpaktfullUiInputField(
            label: 'Country',
            placeholder: 'Choose a country',
            value: null,
            onChanged: null,
            onTap: () {},
          ),
        );
        expect(
          _pickerSemantics(),
          matchesSemantics(
            label: 'Country',
            hint: 'Choose a country',
            isButton: true,
            hasEnabledState: true,
            isEnabled: true,
            isFocusable: true,
            hasTapAction: true,
            hasFocusAction: true,
          ),
        );
        handle.dispose();
      });

      testWidgets('is not a text field', (tester) async {
        final handle = tester.ensureSemantics();
        await pumpAccessibilityApp(
          tester,
          ImpaktfullUiInputField(
            label: 'Country',
            value: 'Belgium',
            onChanged: null,
            onTap: () {},
          ),
        );
        expect(
          find.semantics
              .byPredicate((node) => node.flagsCollection.isTextField),
          findsNothing,
        );
        handle.dispose();
      });
    });

    testWidgets('follows the reading direction (rtl)', (tester) async {
      final icons = ImpaktfullUiTheme.getDefault().assets.icons;
      await pumpAccessibilityApp(
        tester,
        ImpaktfullUiInputField(
          value: 'Belgium',
          leadingIcon: icons.search,
          trailingInputActions: [
            ImpaktfullUiAssetWidget(asset: icons.chevronDown),
          ],
          onChanged: null,
          onTap: () {},
        ),
        textDirection: TextDirection.rtl,
      );
      final leading =
          tester.getCenter(find.byWidgetPredicate(isAssetWidget(icons.search)));
      final value = tester.getCenter(find.text('Belgium'));
      final trailing = tester
          .getCenter(find.byWidgetPredicate(isAssetWidget(icons.chevronDown)));
      expect(leading.dx, greaterThan(value.dx));
      expect(value.dx, greaterThan(trailing.dx));
      // The value starts at the right, next to the leading icon.
      final paragraph =
          tester.renderObject<RenderParagraph>(find.text('Belgium'));
      final box = paragraph
          .getBoxesForSelection(
              const TextSelection(baseOffset: 0, extentOffset: 7))
          .single;
      expect(paragraph.size.width - box.right, lessThan(1));
    });
  });
}
