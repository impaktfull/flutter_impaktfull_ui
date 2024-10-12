import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/components/markdown/parser/markdown_parser.dart';
import 'package:impaktfull_ui_2/src/components/markdown/widget/markdown_code.dart';

/// This class is used to parse the markdown code into a widget.
///
/// The documentation that was used to generate these widgets:
/// - https://www.markdownguide.org/basic-syntax/#code
class ImpaktfullUiMarkdownCodeParser extends ImpaktfullUiMarkdownParser {
  const ImpaktfullUiMarkdownCodeParser();
  @override
  Widget? parse(String text) {
    if (text.isEmpty) return null;
    if (!text.startsWith('`') || !text.endsWith('`')) return null;
    final inlineCodeRegex = RegExp(r'`([^`]+)`');
    final inlineCodeMatches = inlineCodeRegex.allMatches(text);
    if (inlineCodeMatches.isEmpty) return null;
    return ImpaktfullUiMarkDownCode(
      text: inlineCodeMatches.first.group(1) ?? '',
    );
  }
}
