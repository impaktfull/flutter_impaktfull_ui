import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../_data_display_test_helpers.dart';

void main() {
  final markdownTheme = ImpaktfullUiTheme.getDefault().components.markdown;

  Future<void> pumpMarkdown(WidgetTester tester, Widget markdown) =>
      pumpSized(tester, SingleChildScrollView(child: markdown));

  /// Taps the text span that contains [text].
  Future<void> tapSpan(WidgetTester tester, String text) async {
    final richText = find.byWidgetPredicate(
      (widget) =>
          widget is RichText && widget.text.toPlainText().contains(text),
    );
    final paragraph = tester.renderObject<RenderParagraph>(richText.first);
    final plainText = paragraph.text.toPlainText();
    final index = plainText.indexOf(text) + 1;
    final boxes = paragraph.getBoxesForSelection(
      TextSelection(baseOffset: index, extentOffset: index + 1),
    );
    final offset = paragraph.localToGlobal(boxes.first.toRect().center);
    await tester.tapAt(offset);
  }

  testWidgets('tapping a link calls onLinkTapped with the url', (tester) async {
    final links = <String>[];
    await pumpMarkdown(
      tester,
      ImpaktfullUiMarkdown(
        data: 'Go to [impaktfull](https://impaktfull.com) now',
        onLinkTapped: links.add,
      ),
    );
    await tapSpan(tester, 'impaktfull');
    expect(links, ['https://impaktfull.com']);
  });

  testWidgets('without onLinkTapped tapping a link does not throw',
      (tester) async {
    await pumpMarkdown(
      tester,
      const ImpaktfullUiMarkdown(
        data: 'Go to [impaktfull](https://impaktfull.com) now',
      ),
    );
    await tapSpan(tester, 'impaktfull');
    expect(tester.takeException(), isNull);
  });

  testWidgets('code blocks use the code builder of the theme', (tester) async {
    await pumpMarkdown(
      tester,
      const ImpaktfullUiMarkdown(data: '```\nline 1\nline 2\n```'),
    );
    final code = find.text('line 1\nline 2');
    expect(code, findsOneWidget);
    expect(tester.widget<Text>(code).style, markdownTheme.textStyles.code);
    final container = tester.widget<Container>(
      find.ancestor(of: code, matching: find.byType(Container)).first,
    );
    expect(
      (container.decoration as BoxDecoration).color,
      markdownTheme.colors.code,
    );
    // A multi line code block uses the full width.
    expect(
      tester
          .getSize(
              find.ancestor(of: code, matching: find.byType(Container)).first)
          .width,
      400,
    );
  });

  testWidgets('inline code is not stretched', (tester) async {
    await pumpMarkdown(
      tester,
      const ImpaktfullUiMarkdown(data: 'Some `code` here'),
    );
    final code = find.text('code');
    expect(code, findsOneWidget);
    expect(
      tester
          .getSize(
              find.ancestor(of: code, matching: find.byType(Container)).first)
          .width,
      lessThan(100),
    );
  });

  testWidgets('shows new data passed by the parent', (tester) async {
    var data = '# First';
    late StateSetter setState;
    await pumpMarkdown(
      tester,
      StatefulBuilder(
        builder: (context, setter) {
          setState = setter;
          return ImpaktfullUiMarkdown(data: data);
        },
      ),
    );
    expect(find.text('First'), findsOneWidget);
    setState(() => data = '# Second');
    await tester.pumpAndSettle();
    expect(find.text('Second'), findsOneWidget);
    expect(find.text('First'), findsNothing);
  });

  testWidgets('a network image falls back to the error widget', (tester) async {
    await pumpMarkdown(
      tester,
      const ImpaktfullUiMarkdown(data: '![image](https://example.com/a.png)'),
    );
    expect(find.byType(ImpaktfullUiNetworkImage), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
