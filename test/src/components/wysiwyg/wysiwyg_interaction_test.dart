import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/formatter/wysiwyg_bold_formatter.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/formatter/wysiwyg_code_block_formatter.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/formatter/wysiwyg_code_formatter.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/formatter/wysiwyg_formatter.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/formatter/wysiwyg_header_formatter.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/formatter/wysiwyg_italic_formatter.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/formatter/wysiwyg_link_formatter.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/formatter/wysiwyg_photo_formatter.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/formatter/wysiwyg_unorderedlist_formatter.dart';
import 'package:impaktfull_ui/src/components/wysiwyg/widget/actions/wysiwyg_action_item.dart';

import '../../../util/test_util.dart';
import '../_inputs_test_helpers.dart';

void main() {
  Finder actionItem(ImpaktfullUiWysiwygAction action) => find.byWidgetPredicate(
        (widget) => widget is WysiwygActionItem && widget.action == action,
      );

  TextSelection all(String text) =>
      TextSelection(baseOffset: 0, extentOffset: text.length);

  group('formatters', () {
    void expectFormat(
      ImpaktfullUiWysiwygFormatter formatter,
      String text,
      TextSelection selection,
      String expected,
    ) {
      expect(formatter.format(text, selection).text, expected);
    }

    test('bold wraps the selection and keeps it selected', () {
      final result = const ImpaktfullUiWysiwygBoldFormatter()
          .format('hello', all('hello'));
      expect(result.text, '**hello**');
      expect(result.textSelection,
          const TextSelection(baseOffset: 2, extentOffset: 7));
    });

    test('bold removes the markers around the selection', () {
      final result = const ImpaktfullUiWysiwygBoldFormatter().format(
        '**hello**',
        const TextSelection(baseOffset: 2, extentOffset: 7),
      );
      expect(result.text, 'hello');
      expect(result.textSelection,
          const TextSelection(baseOffset: 0, extentOffset: 5));
    });

    test('bold removes the markers inside the selection', () {
      expectFormat(const ImpaktfullUiWysiwygBoldFormatter(), '**hi**',
          all('**hi**'), 'hi');
    });

    test('bold on an empty selection adds empty markers at the cursor', () {
      expectFormat(const ImpaktfullUiWysiwygBoldFormatter(), 'ab',
          const TextSelection.collapsed(offset: 1), 'a****b');
    });

    test('italic, code and code block wrap the selection', () {
      expectFormat(
          const ImpaktfullUiWysiwygItalicFormatter(), 'x', all('x'), '_x_');
      expectFormat(
          const ImpaktfullUiWysiwygCodeFormatter(), 'x', all('x'), '`x`');
      expectFormat(const ImpaktfullUiWysiwygCodeBlockFormatter(), 'x', all('x'),
          '```x```');
    });

    test('header and unordered list add a prefix', () {
      expectFormat(const ImpaktfullUiWysiwygHeaderFormatter(), 'Title',
          all('Title'), '#Title');
      expectFormat(const ImpaktfullUiWysiwygUnorderedListFormatter(), 'Item',
          all('Item'), '- Item');
    });

    test('link uses the selection as url or as text', () {
      const formatter = ImpaktfullUiWysiwygLinkFormatter();
      expectFormat(formatter, 'https://impaktfull.com',
          all('https://impaktfull.com'), '[text](https://impaktfull.com)');
      expectFormat(
          formatter, 'impaktfull', all('impaktfull'), '[impaktfull](url)');
      expectFormat(formatter, '', const TextSelection.collapsed(offset: 0),
          '[text](url)');
    });

    test('photo uses the selection as url or as alt text', () {
      const formatter = ImpaktfullUiWysiwygPhotoFormatter();
      expectFormat(formatter, 'cat.PNG', all('cat.PNG'), '![text](cat.PNG)');
      expectFormat(
          formatter, 'assets/cat', all('assets/cat'), '![text](assets/cat)');
      expectFormat(formatter, 'cat', all('cat'), '![cat](url)');
      expectFormat(formatter, '', const TextSelection.collapsed(offset: 0),
          '![text](url)');
    });
  });

  testWidgets('typing calls onChanged', (tester) async {
    final changes = <String>[];
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiWysiwyg(
          value: '', showPreview: false, onChanged: changes.add),
    );
    await tester.enterText(find.byType(TextField), 'Hello');
    await tester.pump();
    expect(changes, ['Hello']);
  });

  testWidgets('an action formats the selected text', (tester) async {
    final changes = <String>[];
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiWysiwyg(
        value: 'hello',
        showPreview: false,
        onChanged: changes.add,
      ),
    );
    final textField = tester.widget<TextField>(find.byType(TextField));
    textField.controller!.selection =
        const TextSelection(baseOffset: 0, extentOffset: 5);
    await tester.pump();
    await tester.tap(actionItem(ImpaktfullUiWysiwygAction.italic));
    await tester.pump();
    expect(changes.last, '_hello_');
    expect(textField.controller!.text, '_hello_');
  });

  testWidgets('only the given actions are shown', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiWysiwyg(
        value: '',
        showPreview: false,
        actions: const [ImpaktfullUiWysiwygAction.bold],
        onChanged: (_) {},
      ),
    );
    expect(actionItem(ImpaktfullUiWysiwygAction.bold), findsOneWidget);
    expect(actionItem(ImpaktfullUiWysiwygAction.italic), findsNothing);
  });

  testWidgets('an empty list of actions shows no actions', (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiWysiwyg(
        value: '',
        showPreview: false,
        actions: const [],
        onChanged: (_) {},
      ),
    );
    expect(find.byType(WysiwygActionItem), findsNothing);
  });

  group('preview', () {
    testWidgets('the preview button toggles between editor and preview',
        (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiWysiwyg(value: '**bold**', onChanged: (_) {}),
      );
      expect(find.byType(TextField), findsOneWidget);
      expect(find.byType(ImpaktfullUiMarkdown), findsNothing);

      await tester.tap(find.text('Preview'));
      await tester.pumpAndSettle();
      expect(find.byType(TextField), findsNothing);
      expect(find.byType(ImpaktfullUiMarkdown), findsOneWidget);

      await tester.tap(find.text('Editor'));
      await tester.pumpAndSettle();
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('showPreview false hides the preview button', (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiWysiwyg(
          value: '',
          showPreview: false,
          onChanged: (_) {},
        ),
      );
      expect(find.text('Preview'), findsNothing);
    });

    testWidgets('the preview shows the latest text of the parent',
        (tester) async {
      final text = ValueNotifier('first');
      await pumpAndSettleComponent(
        tester,
        ValueListenableBuilder<String>(
          valueListenable: text,
          builder: (context, value, child) =>
              ImpaktfullUiWysiwyg(value: value, onChanged: (_) {}),
        ),
      );
      await tester.tap(find.text('Preview'));
      await tester.pumpAndSettle();
      text.value = 'second';
      await tester.pumpAndSettle();
      expect(
          tester
              .widget<ImpaktfullUiMarkdown>(find.byType(ImpaktfullUiMarkdown))
              .data,
          'second');
    });
  });

  testWidgets('a new text from the parent is shown in the editor',
      (tester) async {
    final text = ValueNotifier('first');
    await pumpAndSettleComponent(
      tester,
      ValueListenableBuilder<String>(
        valueListenable: text,
        builder: (context, value, child) => ImpaktfullUiWysiwyg(
          value: value,
          showPreview: false,
          onChanged: (_) {},
        ),
      ),
    );
    text.value = 'second';
    await tester.pumpAndSettle();
    expect(tester.widget<TextField>(find.byType(TextField)).controller!.text,
        'second');
  });

  group(
    'theme override',
    () {
      testWidgets('the assets of the theme override are used', (tester) async {
        final theme = defaultComponentsTheme.wysiwyg;
        await pumpAndSettleComponent(
          tester,
          ImpaktfullUiWysiwyg(
            value: '',
            showPreview: false,
            onChanged: (_) {},
            theme: theme.copyWith(
              assets: theme.assets.copyWith(bold: customTestAsset),
            ),
          ),
        );
        expect(
          tester
              .widget<WysiwygActionItem>(
                  actionItem(ImpaktfullUiWysiwygAction.bold))
              .asset,
          same(customTestAsset),
        );
      });
    },
  );
}
