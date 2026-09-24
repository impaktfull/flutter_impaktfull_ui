import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_inputs_test_helpers.dart';

/// Proves that every size token of `ImpaktfullUiColorInputFieldDimensTheme`
/// really changes what is rendered.

ImpaktfullUiColorInputFieldTheme get _theme =>
    defaultComponentsTheme.colorInputField;

ImpaktfullUiColorInputFieldTheme _withDimens({
  double? swatchSize,
  double? borderWidth,
  double? spacing,
}) =>
    _theme.copyWith(
      dimens: _theme.dimens.copyWith(
        swatchSize: swatchSize,
        borderWidth: borderWidth,
        spacing: spacing,
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

/// The swatch that shows the color: the first touch feedback of the field, in
/// front of the hex input field.
Finder _swatch() => find
    .descendant(
      of: find.byType(ImpaktfullUiColorInputField),
      matching: find.byType(ImpaktfullUiTouchFeedback),
    )
    .first;

void main() {
  testWidgets('the default theme keeps the size of the swatch', (tester) async {
    await _pumpField(
      tester,
      ImpaktfullUiColorInputField(onChanged: (_) {}),
    );
    expect(tester.getSize(_swatch()), const Size.square(40));
  });

  testWidgets('swatchSize is the size of the swatch', (tester) async {
    await _pumpField(
      tester,
      ImpaktfullUiColorInputField(
        onChanged: (_) {},
        theme: _withDimens(swatchSize: 32),
      ),
    );
    expect(tester.getSize(_swatch()), const Size.square(32));
  });

  testWidgets('borderWidth is the width of the border of the swatch',
      (tester) async {
    await _pumpField(
      tester,
      ImpaktfullUiColorInputField(
        onChanged: (_) {},
        theme: _withDimens(borderWidth: 3),
      ),
    );
    final border =
        tester.widget<ImpaktfullUiTouchFeedback>(_swatch()).border! as Border;
    expect(border.top.width, 3);
    expect(border.top.color, _theme.colors.border);
  });

  testWidgets('spacing is the space between the swatch and the input field',
      (tester) async {
    await _pumpField(
      tester,
      ImpaktfullUiColorInputField(
        onChanged: (_) {},
        theme: _withDimens(spacing: 24),
      ),
    );
    final swatch = tester.getRect(_swatch());
    final card = tester.getRect(find.byType(ImpaktfullUiCard));
    expect(card.left - swatch.right, 24);
  });
}
