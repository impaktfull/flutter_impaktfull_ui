import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_inputs_test_helpers.dart';

/// Proves that the size token of `ImpaktfullUiNumberInputDimensTheme` really
/// changes what is rendered.

ImpaktfullUiNumberInputTheme get _theme => defaultComponentsTheme.numberInput;

Future<void> _pumpInput(WidgetTester tester, Widget input) =>
    pumpAndSettleComponent(
      tester,
      Align(
        alignment: Alignment.topLeft,
        child: SizedBox(width: 300, child: input),
      ),
    );

/// The space between the input field and the decrement button.
double _gap(WidgetTester tester) {
  final field = tester.getRect(find.byType(ImpaktfullUiCard));
  final button = tester.getRect(find.byType(ImpaktfullUiButton).first);
  return button.left - field.right;
}

void main() {
  testWidgets('the default theme keeps the spacing of the buttons',
      (tester) async {
    await _pumpInput(
      tester,
      ImpaktfullUiNumberInput<int>(value: 1, onChanged: (_) {}),
    );
    expect(_gap(tester), 8);
  });

  testWidgets('spacing is the space between the field and the buttons',
      (tester) async {
    await _pumpInput(
      tester,
      ImpaktfullUiNumberInput<int>(
        value: 1,
        onChanged: (_) {},
        theme: _theme.copyWith(dimens: _theme.dimens.copyWith(spacing: 24)),
      ),
    );
    expect(_gap(tester), 24);
  });
}
