import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/widget/actions/wysiwyg_action_item.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/widget/wysiwyg_input.dart';

import '../../../util/test_util.dart';

void main() {
  Finder actionItem(ImpaktfullUiWysiwygAction action) => find.byWidgetPredicate(
        (widget) => widget is WysiwygActionItem && widget.action == action,
      );

  testWidgets('input field without value and controller does not throw',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiWysiwygInputField(
        value: null,
        onChanged: (_) {},
        type: ImpaktfullUiWysiwygType.markdown,
        actions: ImpaktfullUiWysiwygAction.basicValues,
      ),
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('disposing the input field does not throw', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiWysiwygInputField(
        value: 'text',
        onChanged: (_) {},
        type: ImpaktfullUiWysiwygType.markdown,
        actions: ImpaktfullUiWysiwygAction.basicValues,
      ),
    );
    await pumpAndSettleComponent(tester, const SizedBox());
    expect(tester.takeException(), isNull);
  });

  testWidgets('formatting after the text changed from outside does not throw',
      (tester) async {
    final text = ValueNotifier('a');
    final changes = <String>[];
    await pumpAndSettleComponent(
      tester,
      ValueListenableBuilder<String>(
        valueListenable: text,
        builder: (context, value, child) => ImpaktfullUiWysiwyg(
          text: value,
          showPreview: false,
          onChanged: changes.add,
        ),
      ),
    );
    text.value = 'hello';
    await tester.pumpAndSettle();

    await tester.tap(actionItem(ImpaktfullUiWysiwygAction.bold));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(changes.last, 'hello****');
  });
}
