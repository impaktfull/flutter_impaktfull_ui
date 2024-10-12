import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/components/markdown/parser/markdown_parser.dart';
import 'package:impaktfull_ui_2/src/components/markdown/widget/markdown_unordered_list.dart';

/// This class is used to parse the markdown unordered list into a widget.
///
/// The documentation that was used to generate these widgets:
/// - https://www.markdownguide.org/basic-syntax/#unordered-lists
class ImpaktfullUiMarkdownUnorderedParser extends ImpaktfullUiMarkdownParser {
  const ImpaktfullUiMarkdownUnorderedParser();
  static const _indicators = ['-', '*', '+'];

  @override
  Widget? parse(String text) {
    int indent = 0;
    String trimmedText = text.trimLeft();
    int leadingSpaces = text.length - trimmedText.length;
    indent = leadingSpaces ~/ 4;

    for (final indicator in _indicators) {
      if (trimmedText.startsWith(indicator)) {
        return ImpaktfullUiMarkDownUnorderedList(
          text: trimmedText.substring(indicator.length).trim(),
          indent: indent,
        );
      }
    }
    return null;
  }
}
