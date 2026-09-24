import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_inputs_test_helpers.dart';

/// Proves that every size and state token of `ImpaktfullUiInputFieldTheme`
/// really changes what is rendered, and that the defaults render the field the
/// way it was rendered before the tokens existed.

const _leadingIcon = ImpaktfullUiAsset.icon(Icons.home);

ImpaktfullUiInputFieldTheme get _theme => defaultComponentsTheme.inputField;

ImpaktfullUiInputFieldTheme _withDimens({
  EdgeInsetsDirectional? padding,
  EdgeInsetsDirectional? paddingWithActions,
  EdgeInsets? contentPadding,
  EdgeInsets? readOnlyContentPadding,
  double? minHeight,
  double? multilineMinHeight,
  double? spacing,
  double? iconSize,
  double? borderWidth,
  double? focusRingWidth,
}) =>
    _theme.copyWith(
      dimens: _theme.dimens.copyWith(
        padding: padding,
        paddingWithActions: paddingWithActions,
        contentPadding: contentPadding,
        readOnlyContentPadding: readOnlyContentPadding,
        minHeight: minHeight,
        multilineMinHeight: multilineMinHeight,
        spacing: spacing,
        iconSize: iconSize,
        borderWidth: borderWidth,
        focusRingWidth: focusRingWidth,
      ),
    );

ImpaktfullUiInputFieldTheme _withColors({
  Color? borderFocused,
  Color? borderHover,
  Color? focusRing,
}) =>
    _theme.copyWith(
      colors: _theme.colors.copyWith(
        borderFocused: borderFocused,
        borderHover: borderHover,
        focusRing: focusRing,
      ),
    );

/// Pumps a field of a fixed width, so its height is the only thing that moves.
Future<void> _pumpField(WidgetTester tester, Widget field) =>
    pumpAndSettleComponent(
      tester,
      Align(
        alignment: Alignment.topLeft,
        child: SizedBox(width: 300, child: field),
      ),
    );

Size _fieldSize(WidgetTester tester) =>
    tester.getSize(find.byType(ImpaktfullUiCard));

/// The container of the card of the field: it holds the border and the shadow.
ImpaktfullUiContainer _cardContainer(WidgetTester tester) =>
    tester.widget<ImpaktfullUiContainer>(
      find
          .descendant(
            of: find.byType(ImpaktfullUiCard),
            matching: find.byType(ImpaktfullUiContainer),
          )
          .first,
    );

BorderSide _cardBorder(WidgetTester tester) =>
    (_cardContainer(tester).border! as Border).top;

Future<void> _hover(WidgetTester tester, Finder finder) async {
  final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
  await gesture.addPointer(location: Offset.zero);
  addTearDown(gesture.removePointer);
  await tester.pump();
  await gesture.moveTo(tester.getCenter(finder));
  await tester.pumpAndSettle();
}

void main() {
  group('ImpaktfullUiInputFieldDimensTheme', () {
    testWidgets('the default theme keeps the height of the field',
        (tester) async {
      await _pumpField(
        tester,
        ImpaktfullUiInputField(value: '', onChanged: (_) {}),
      );
      // `contentPadding` above and below a line of the text style of the
      // field, which is more than `minHeight`: the height of the field is
      // derived, not declared (48 with the font of the tests).
      expect(_fieldSize(tester).height, 48);
      expect(_fieldSize(tester).height, greaterThan(_theme.dimens.minHeight));
    });

    testWidgets('minHeight is the minimum height of the field', (tester) async {
      await _pumpField(
        tester,
        ImpaktfullUiInputField(
          value: '',
          onChanged: (_) {},
          theme: _withDimens(minHeight: 80),
        ),
      );
      expect(_fieldSize(tester).height, 80);
    });

    testWidgets(
        'minHeight without a contentPadding is the exact height of the field',
        (tester) async {
      await _pumpField(
        tester,
        ImpaktfullUiInputField(
          value: '',
          onChanged: (_) {},
          // What Ant Design's `controlHeight: 32` needs: a declared height
          // instead of one that is derived from the padding.
          theme: _withDimens(minHeight: 32, contentPadding: EdgeInsets.zero),
        ),
      );
      expect(_fieldSize(tester).height, 32);
    });

    testWidgets('minHeight is the minimum height of a read only field',
        (tester) async {
      await _pumpField(
        tester,
        ImpaktfullUiInputField(
          value: 'Value',
          onChanged: null,
          theme: _withDimens(minHeight: 60),
        ),
      );
      expect(find.byType(TextField), findsNothing);
      expect(_fieldSize(tester).height, 60);
    });

    testWidgets('multilineMinHeight is the minimum height of a multiline field',
        (tester) async {
      await _pumpField(
        tester,
        ImpaktfullUiInputField(
          value: '',
          onChanged: (_) {},
          multiline: true,
          theme: _withDimens(multilineMinHeight: 140),
        ),
      );
      expect(_fieldSize(tester).height, 140);
    });

    testWidgets('padding is the space between the border and the content',
        (tester) async {
      await _pumpField(
        tester,
        ImpaktfullUiInputField(
          value: '',
          onChanged: (_) {},
          theme: _withDimens(
            padding: const EdgeInsetsDirectional.all(4),
            contentPadding: EdgeInsets.zero,
            minHeight: 0,
          ),
        ),
      );
      final card = tester.getRect(find.byType(ImpaktfullUiCard));
      final textField = tester.getRect(find.byType(TextField));
      expect(textField.left - card.left, 4);
      expect(card.right - textField.right, 4);
      expect(textField.top - card.top, 4);
    });

    testWidgets('paddingWithActions is used when the field shows actions',
        (tester) async {
      await _pumpField(
        tester,
        ImpaktfullUiInputField(
          value: '',
          onChanged: (_) {},
          obscureText: true,
          theme: _withDimens(
            paddingWithActions: const EdgeInsetsDirectional.only(start: 24),
          ),
        ),
      );
      final card = tester.getRect(find.byType(ImpaktfullUiCard));
      final textField = tester.getRect(find.byType(TextField));
      expect(textField.left - card.left, 24);
    });

    testWidgets('readOnlyContentPadding is the padding around the value',
        (tester) async {
      await _pumpField(
        tester,
        ImpaktfullUiInputField(
          value: 'Value',
          onChanged: null,
          theme: _withDimens(
            minHeight: 0,
            readOnlyContentPadding: const EdgeInsets.symmetric(vertical: 20),
          ),
        ),
      );
      final card = tester.getRect(find.byType(ImpaktfullUiCard));
      final text = tester.getRect(find.text('Value'));
      expect(text.top - card.top, 20);
    });

    testWidgets('spacing is the space between the icon and the text',
        (tester) async {
      await _pumpField(
        tester,
        ImpaktfullUiInputField(
          value: '',
          onChanged: (_) {},
          leadingIcon: _leadingIcon,
          theme: _withDimens(spacing: 32),
        ),
      );
      final icon = tester.getRect(find.byType(ImpaktfullUiAssetWidget));
      final textField = tester.getRect(find.byType(TextField));
      expect(textField.left - icon.right, 32);
    });

    testWidgets('iconSize is the size of the leading icon', (tester) async {
      await _pumpField(
        tester,
        ImpaktfullUiInputField(
          value: '',
          onChanged: (_) {},
          leadingIcon: _leadingIcon,
          theme: _withDimens(iconSize: 40),
        ),
      );
      expect(
        tester.getSize(find.byType(ImpaktfullUiAssetWidget)),
        const Size.square(40),
      );
    });

    testWidgets('borderWidth is the width of the border of the field',
        (tester) async {
      await _pumpField(
        tester,
        ImpaktfullUiInputField(
          value: '',
          onChanged: (_) {},
          theme: _withDimens(borderWidth: 3),
        ),
      );
      expect(_cardBorder(tester).width, 3);
    });

    testWidgets('borderWidth defaults to the width of the card',
        (tester) async {
      await _pumpField(
        tester,
        ImpaktfullUiInputField(value: '', onChanged: (_) {}),
      );
      expect(
        _cardBorder(tester).width,
        defaultComponentsTheme.card.dimens.borderWidth,
      );
    });
  });

  group('ImpaktfullUiInputFieldColorTheme', () {
    testWidgets('a field has no focused border by default', (tester) async {
      await _pumpField(
        tester,
        ImpaktfullUiInputField(
          value: '',
          onChanged: (_) {},
          autofocus: true,
        ),
      );
      expect(_cardBorder(tester).color, _theme.colors.border);
    });

    testWidgets('borderFocused is the border of a focused field',
        (tester) async {
      await _pumpField(
        tester,
        ImpaktfullUiInputField(
          value: '',
          onChanged: (_) {},
          theme: _withColors(borderFocused: customTestColor),
        ),
      );
      expect(_cardBorder(tester).color, _theme.colors.border);
      await tester.tap(find.byType(TextField));
      await tester.pumpAndSettle();
      expect(_cardBorder(tester).color, customTestColor);
    });

    testWidgets('an erroneous field keeps its error border while focused',
        (tester) async {
      await _pumpField(
        tester,
        ImpaktfullUiInputField(
          value: '',
          onChanged: (_) {},
          error: 'Wrong',
          autofocus: true,
          theme: _withColors(borderFocused: customTestColor),
        ),
      );
      expect(_cardBorder(tester).color, _theme.colors.borderError);
    });

    testWidgets('borderHover is the border of a hovered field', (tester) async {
      await _pumpField(
        tester,
        ImpaktfullUiInputField(
          value: '',
          onChanged: (_) {},
          theme: _withColors(borderHover: customTestColor),
        ),
      );
      expect(_cardBorder(tester).color, _theme.colors.border);
      await _hover(tester, find.byType(ImpaktfullUiCard));
      expect(_cardBorder(tester).color, customTestColor);
    });

    testWidgets('borderFocused wins over borderHover', (tester) async {
      const hoverColor = Color(0xFFFF00FF);
      await _pumpField(
        tester,
        ImpaktfullUiInputField(
          value: '',
          onChanged: (_) {},
          autofocus: true,
          theme: _withColors(
            borderFocused: customTestColor,
            borderHover: hoverColor,
          ),
        ),
      );
      await _hover(tester, find.byType(ImpaktfullUiCard));
      expect(_cardBorder(tester).color, customTestColor);
    });

    testWidgets('a field without a borderHover does not watch the pointer',
        (tester) async {
      await _pumpField(
        tester,
        ImpaktfullUiInputField(value: '', onChanged: (_) {}),
      );
      expect(
        find.descendant(
          of: find.byType(ImpaktfullUiInputField),
          matching: find.byType(ImpaktfullUiHoverFeedback),
        ),
        findsNothing,
      );
    });

    testWidgets('focusRing draws a ring around a focused field',
        (tester) async {
      await _pumpField(
        tester,
        ImpaktfullUiInputField(
          value: '',
          onChanged: (_) {},
          theme: _withColors(focusRing: customTestColor)
              .copyWith(dimens: _theme.dimens.copyWith(focusRingWidth: 3)),
        ),
      );
      final cardShadows = defaultComponentsTheme.card.shadows.card;
      expect(_cardContainer(tester).shadow, cardShadows);
      await tester.tap(find.byType(TextField));
      await tester.pumpAndSettle();
      final shadow = _cardContainer(tester).shadow!;
      expect(shadow.length, cardShadows.length + 1);
      expect(shadow.last.color, customTestColor);
      expect(shadow.last.blurRadius, 0);
      expect(shadow.last.offset, Offset.zero);
      // The border of the card covers the first pixel of the ring, so the ring
      // reaches `focusRingWidth` beyond it.
      expect(
        shadow.last.spreadRadius,
        3 + defaultComponentsTheme.card.dimens.borderWidth,
      );
    });

    testWidgets('a field without a focusRing keeps the shadow of the card',
        (tester) async {
      await _pumpField(
        tester,
        ImpaktfullUiInputField(
          value: '',
          onChanged: (_) {},
          autofocus: true,
        ),
      );
      expect(
        _cardContainer(tester).shadow,
        defaultComponentsTheme.card.shadows.card,
      );
    });
  });
}
