// Runs on the Dart VM and in Chrome (tool/test_web.sh). Chrome measures text
// a bit wider than the VM, which is how the overflow below was found (in the
// header of ImpaktfullUiDatePicker).

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

const _longTitle = 'A title that is much wider than the button can be';

void main() {
  testWidgets('a title wider than the button wraps instead of overflowing',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      const Center(
        child: SizedBox(
          width: 120,
          child: ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: _longTitle,
          ),
        ),
      ),
    );
    expect(tester.takeException(), isNull);
    final title = tester.getRect(find.text(_longTitle));
    final button = tester.getRect(find.byType(ImpaktfullUiButton));
    expect(title.width, lessThanOrEqualTo(button.width));
  });

  testWidgets('a button without a width bound sizes to its title',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: 'Save',
          ),
        ],
      ),
    );
    expect(tester.takeException(), isNull);
    final title = tester.getRect(find.text('Save'));
    final button = tester.getRect(find.byType(ImpaktfullUiButton));
    expect(button.width, greaterThan(title.width));
    expect(button.width, lessThan(200));
  });

  testWidgets('a fullWidth button fills the width', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const Center(
        child: SizedBox(
          width: 300,
          child: ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: 'Save',
            fullWidth: true,
          ),
        ),
      ),
    );
    expect(tester.takeException(), isNull);
    expect(tester.getSize(find.byType(ImpaktfullUiButton)).width, 300);
  });
}
