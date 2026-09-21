import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_inputs_test_helpers.dart';

void main() {
  TextField textField(WidgetTester tester) =>
      tester.widget<TextField>(find.byType(TextField));

  group('onChanged', () {
    testWidgets('is called with the typed text', (tester) async {
      final values = <String>[];
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiInputField(value: '', onChanged: values.add),
      );
      await tester.enterText(find.byType(TextField), 'hello');
      await tester.pump();
      expect(values, ['hello']);
    });

    testWidgets('a disabled field has no text field and shows the value',
        (tester) async {
      await pumpAndSettleComponent(
        tester,
        const ImpaktfullUiInputField(value: 'Disabled', onChanged: null),
      );
      expect(find.byType(TextField), findsNothing);
      expect(find.text('Disabled'), findsOneWidget);
      final card =
          tester.widget<ImpaktfullUiCard>(find.byType(ImpaktfullUiCard));
      expect(card.onTap, isNull);
    });

    testWidgets('a disabled field shows a new value from the parent',
        (tester) async {
      final value = ValueNotifier('First');
      await pumpAndSettleComponent(
        tester,
        ValueListenableBuilder<String>(
          valueListenable: value,
          builder: (context, current, child) =>
              ImpaktfullUiInputField(value: current, onChanged: null),
        ),
      );
      value.value = 'Second';
      await tester.pumpAndSettle();
      expect(find.text('Second'), findsOneWidget);
    });

    testWidgets('a readOnly field has a read only text field', (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiInputField(
          value: 'Read only',
          readOnly: true,
          onChanged: (_) {},
        ),
      );
      expect(textField(tester).readOnly, isTrue);
      expect(find.text('Read only'), findsOneWidget);
    });

    testWidgets('the input formatters are applied', (tester) async {
      final values = <String>[];
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiInputField(
          value: '',
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: values.add,
        ),
      );
      await tester.enterText(find.byType(TextField), 'a1b2');
      await tester.pump();
      expect(values.last, '12');
    });
  });

  testWidgets('onSubmit is called with the text on the done action',
      (tester) async {
    final submitted = <String>[];
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiInputField(
        value: '',
        onChanged: (_) {},
        onSubmit: submitted.add,
      ),
    );
    await tester.enterText(find.byType(TextField), 'done');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
    expect(submitted, ['done']);
  });

  testWidgets('a new value from the parent is shown', (tester) async {
    final value = ValueNotifier('First');
    await pumpAndSettleComponent(
      tester,
      ValueListenableBuilder<String>(
        valueListenable: value,
        builder: (context, current, child) =>
            ImpaktfullUiInputField(value: current, onChanged: (_) {}),
      ),
    );
    expect(textField(tester).controller!.text, 'First');
    value.value = 'Second';
    await tester.pumpAndSettle();
    expect(textField(tester).controller!.text, 'Second');
  });

  testWidgets('tapping the field focuses it and calls onFocusChanged',
      (tester) async {
    final focusChanges = <bool>[];
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiInputField(
        value: '',
        onChanged: (_) {},
        onFocusChanged: focusChanges.add,
      ),
    );
    await tester.tap(find.byType(TextField));
    await tester.pumpAndSettle();
    expect(textField(tester).focusNode!.hasFocus, isTrue);
    expect(focusChanges, contains(true));
  });

  testWidgets('autofocus focuses the field', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiInputField(value: '', autofocus: true, onChanged: (_) {}),
    );
    expect(textField(tester).focusNode!.hasFocus, isTrue);
  });

  group('validator', () {
    Widget buildSut({
      String? error,
      required ImpaktfullUiInputFieldValidatorResult Function(String) validator,
    }) =>
        ImpaktfullUiInputField(
          value: '',
          error: error,
          validator: validator,
          onChanged: (_) {},
        );

    ImpaktfullUiInputFieldValidatorResult minLength(String value) =>
        value.length < 3
            ? const ImpaktfullUiInputFieldValidatorResult.invalid(
                errorMessage: 'Too short')
            : const ImpaktfullUiInputFieldValidatorResult.valid();

    testWidgets('shows the error of an invalid value and hides it when valid',
        (tester) async {
      await pumpAndSettleComponent(tester, buildSut(validator: minLength));
      await tester.enterText(find.byType(TextField), 'ab');
      await tester.pump();
      expect(find.text('Too short'), findsOneWidget);

      await tester.enterText(find.byType(TextField), 'abc');
      await tester.pump();
      expect(find.text('Too short'), findsNothing);
    });

    testWidgets('pending final validation shows no error', (tester) async {
      await pumpAndSettleComponent(
        tester,
        buildSut(
          validator: (_) => const ImpaktfullUiInputFieldValidatorResult
              .pendingFinalValidation(),
        ),
      );
      await tester.enterText(find.byType(TextField), 'a');
      await tester.pump();
      expect(find.byType(Text), findsNothing);
    });

    testWidgets('the error param has priority over the validator',
        (tester) async {
      await pumpAndSettleComponent(
        tester,
        buildSut(error: 'Server error', validator: minLength),
      );
      await tester.enterText(find.byType(TextField), 'a');
      await tester.pump();
      expect(find.text('Server error'), findsOneWidget);
      expect(find.text('Too short'), findsNothing);
    });

    test('the validator results', () {
      const valid = ImpaktfullUiInputFieldValidatorResult.valid();
      expect(valid.isValid, isTrue);
      expect(valid.errorMessage, '');
      const invalid =
          ImpaktfullUiInputFieldValidatorResult.invalid(errorMessage: 'Error');
      expect(invalid.isValid, isFalse);
      expect(invalid.errorMessage, 'Error');
      const emptyError =
          ImpaktfullUiInputFieldValidatorResult.invalid(errorMessage: '');
      expect(emptyError.isValid, isTrue);
      const pending =
          ImpaktfullUiInputFieldValidatorResult.pendingFinalValidation();
      expect(pending.isPendingFinalValidation, isTrue);
      expect(pending.isValid, isTrue);
    });
  });

  group('hint and error', () {
    testWidgets('the hint is shown without an error', (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiInputField(value: '', hint: 'Hint', onChanged: (_) {}),
      );
      expect(find.text('Hint'), findsOneWidget);
    });

    testWidgets('the error replaces the hint and marks the card',
        (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiInputField(
          value: '',
          hint: 'Hint',
          error: 'Error',
          onChanged: (_) {},
        ),
      );
      expect(find.text('Hint'), findsNothing);
      expect(find.text('Error'), findsOneWidget);
      expect(
          tester.widget<ImpaktfullUiCard>(find.byType(ImpaktfullUiCard)).error,
          isTrue);
    });
  });

  group('obscureText', () {
    testWidgets('the show/hide button toggles the obscured text',
        (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiInputField(
          value: 'secret',
          obscureText: true,
          onChanged: (_) {},
        ),
      );
      expect(textField(tester).obscureText, isTrue);
      await tester.tap(find.byType(ImpaktfullUiIconButton));
      await tester.pump();
      expect(textField(tester).obscureText, isFalse);
      await tester.tap(find.byType(ImpaktfullUiIconButton));
      await tester.pump();
      expect(textField(tester).obscureText, isTrue);
    });

    testWidgets('a new obscureText from the parent is used', (tester) async {
      final obscure = ValueNotifier(false);
      await pumpAndSettleComponent(
        tester,
        ValueListenableBuilder<bool>(
          valueListenable: obscure,
          builder: (context, isObscured, child) => ImpaktfullUiInputField(
            value: 'secret',
            obscureText: isObscured,
            onChanged: (_) {},
          ),
        ),
      );
      expect(textField(tester).obscureText, isFalse);
      obscure.value = true;
      await tester.pumpAndSettle();
      expect(textField(tester).obscureText, isTrue);
    });
  });

  testWidgets('multiline uses the newline action and 3 min lines',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiInputField(value: '', multiline: true, onChanged: (_) {}),
    );
    expect(textField(tester).textInputAction, TextInputAction.newline);
    expect(textField(tester).minLines, 3);
  });

  testWidgets('a trailing action is not shown for a multiline field',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiInputField(
        value: '',
        multiline: true,
        trailingAction: ImpaktfullUiInputFieldAction(
          label: 'Action',
          onTap: () {},
        ),
        onChanged: (_) {},
      ),
    );
    expect(find.text('Action'), findsNothing);
  });

  testWidgets('the trailing action calls onTap', (tester) async {
    var taps = 0;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiInputField(
        value: '',
        trailingAction: ImpaktfullUiInputFieldAction(
          label: 'Action',
          onTap: () => taps++,
        ),
        onChanged: (_) {},
      ),
    );
    await tester.tap(find.text('Action'));
    await tester.pump();
    expect(taps, 1);
  });

  group(
    'theme colors',
    () {
      testWidgets('the background color of the theme override is used',
          (tester) async {
        final theme = defaultComponentsTheme.inputField;
        await pumpAndSettleComponent(
          tester,
          ImpaktfullUiInputField(
            value: '',
            onChanged: (_) {},
            theme: theme.copyWith(
              colors: theme.colors.copyWith(background: customTestColor),
            ),
          ),
        );
        expect(
          find.descendant(
            of: find.byType(ImpaktfullUiInputField),
            matching: find.byWidgetPredicate((widget) =>
                widget is ImpaktfullUiContainer &&
                widget.color == customTestColor),
          ),
          findsWidgets,
        );
      });
    },
  );

  testWidgets('the theme override is used', (tester) async {
    final theme = defaultComponentsTheme.inputField;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiInputField(
        value: 'secret',
        obscureText: true,
        onChanged: (_) {},
        theme: theme.copyWith(
          assets: theme.assets.copyWith(passwordHide: customTestAsset),
          textStyles: theme.textStyles.copyWith(
            text: theme.textStyles.text.copyWith(color: customTestColor),
          ),
        ),
      ),
    );
    expect(textField(tester).style?.color, customTestColor);
    expect(
        find.byWidgetPredicate(isAssetWidget(customTestAsset)), findsOneWidget);
  });
}
