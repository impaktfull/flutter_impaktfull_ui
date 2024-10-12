import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/components/markdown/parser/markdown_parser.dart';
import 'package:impaktfull_ui_2/src/components/markdown/widget/markdown_paragraph.dart';

/// This class is used to parse the markdown paragraph into a widget.
///
/// The documentation that was used to generate these widgets:
/// - https://www.markdownguide.org/basic-syntax/#paragraphs-1
class ImpaktfullUiMarkdownParagraphParser extends ImpaktfullUiMarkdownParser {
  const ImpaktfullUiMarkdownParagraphParser();
  @override
  Widget? parse(String text) {
    return ImpaktfullUiMarkDownPragraph(
      text: text,
    );
  }
}
