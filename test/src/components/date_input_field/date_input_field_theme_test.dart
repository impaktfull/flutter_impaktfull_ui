import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_inputs_test_helpers.dart';

/// Proves that every size token of `ImpaktfullUiDateInputFieldDimensTheme`
/// really changes what is rendered.

const _leadingIcon = ImpaktfullUiAsset.icon(Icons.calendar_today);

ImpaktfullUiDateInputFieldTheme get _theme =>
    defaultComponentsTheme.dateInputField;

ImpaktfullUiDateInputFieldTheme _withDimens({
  EdgeInsetsGeometry? padding,
  EdgeInsetsGeometry? contentPadding,
  double? minHeight,
  double? spacing,
  double? iconSize,
  double? borderWidth,
}) =>
    _theme.copyWith(
      dimens: _theme.dimens.copyWith(
        padding: padding,
        contentPadding: contentPadding,
        minHeight: minHeight,
        spacing: spacing,
        iconSize: iconSize,
        borderWidth: borderWidth,
      ),
    );

Future<void> _pumpField(WidgetTester tester, Widget field) =>
    pumpAndSettleComponent(
      tester,
      Align(
        alignment: Alignment.topLeft,
        child: SizedBox(width: 300, child: field),
      ),
    );

double _fieldHeight(WidgetTester tester) =>
    tester.getSize(find.byType(ImpaktfullUiCard)).height;

BorderSide _cardBorder(WidgetTester tester) => (tester
        .widget<ImpaktfullUiContainer>(
          find
              .descendant(
                of: find.byType(ImpaktfullUiCard),
                matching: find.byType(ImpaktfullUiContainer),
              )
              .first,
        )
        .border! as Border)
    .top;

void main() {
  testWidgets('the default theme keeps the height of the field',
      (tester) async {
    await _pumpField(
      tester,
      ImpaktfullUiDateInputField(value: null, onChanged: (_) {}),
    );
    expect(_fieldHeight(tester), 40);
  });

  testWidgets('minHeight is the minimum height of the field', (tester) async {
    await _pumpField(
      tester,
      ImpaktfullUiDateInputField(
        value: null,
        onChanged: (_) {},
        theme: _withDimens(minHeight: 32, contentPadding: EdgeInsets.zero),
      ),
    );
    expect(_fieldHeight(tester), 32);
  });

  testWidgets('contentPadding is the space above and below the date',
      (tester) async {
    await _pumpField(
      tester,
      ImpaktfullUiDateInputField(
        value: DateTime(2026, 9, 24),
        onChanged: (_) {},
        theme: _withDimens(
          minHeight: 0,
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
        ),
      ),
    );
    final card = tester.getRect(find.byType(ImpaktfullUiCard));
    final text = tester.getRect(find.text('24/09/2026'));
    expect(text.top - card.top, 20);
  });

  testWidgets('padding is the space between the border and the content',
      (tester) async {
    await _pumpField(
      tester,
      ImpaktfullUiDateInputField(
        value: DateTime(2026, 9, 24),
        onChanged: (_) {},
        theme: _withDimens(padding: const EdgeInsets.symmetric(horizontal: 4)),
      ),
    );
    final card = tester.getRect(find.byType(ImpaktfullUiCard));
    final text = tester.getRect(find.text('24/09/2026'));
    expect(text.left - card.left, 4);
  });

  testWidgets('spacing is the space between the icon and the date',
      (tester) async {
    await _pumpField(
      tester,
      ImpaktfullUiDateInputField(
        value: DateTime(2026, 9, 24),
        onChanged: (_) {},
        leadingIcon: _leadingIcon,
        theme: _withDimens(spacing: 24),
      ),
    );
    final icon = tester.getRect(find.byType(ImpaktfullUiAssetWidget));
    final text = tester.getRect(find.text('24/09/2026'));
    expect(text.left - icon.right, 24);
  });

  testWidgets('iconSize is the size of the leading icon', (tester) async {
    await _pumpField(
      tester,
      ImpaktfullUiDateInputField(
        value: null,
        onChanged: (_) {},
        leadingIcon: _leadingIcon,
        theme: _withDimens(iconSize: 32),
      ),
    );
    expect(
      tester.getSize(find.byType(ImpaktfullUiAssetWidget)),
      const Size.square(32),
    );
  });

  testWidgets('borderWidth is the width of the border of the field',
      (tester) async {
    await _pumpField(
      tester,
      ImpaktfullUiDateInputField(
        value: null,
        onChanged: (_) {},
        theme: _withDimens(borderWidth: 2),
      ),
    );
    expect(_cardBorder(tester).width, 2);
  });

  testWidgets('borderWidth defaults to the width of the card', (tester) async {
    await _pumpField(
      tester,
      ImpaktfullUiDateInputField(value: null, onChanged: (_) {}),
    );
    expect(
      _cardBorder(tester).width,
      defaultComponentsTheme.card.dimens.borderWidth,
    );
  });
}
