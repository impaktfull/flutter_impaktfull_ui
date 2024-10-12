import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/components/markdown/parser/markdown_parser.dart';
import 'package:impaktfull_ui_2/src/components/markdown/widget/markdown_ordered_list.dart';

/// This class is used to parse the markdown ordered list into a widget.
/// It is used in the [ImpaktfullUiMarkDown] widget.
///
/// The documentation that was used to generate these widgets:
/// - https://www.markdownguide.org/basic-syntax/#ordered-lists
class ImpaktfullUiMarkdownOrderedParser extends ImpaktfullUiMarkdownParser {
  const ImpaktfullUiMarkdownOrderedParser();

  @override
  Widget? parse(String text) {
    var indent = 0;
    final trimmedText = text.trimLeft();
    final leadingSpaces = text.length - trimmedText.length;
    indent = leadingSpaces ~/ 4;
    final match = RegExp(r'^(\d+)\.\s').firstMatch(trimmedText);
    if (match == null) return null;
    final numberGroup = match.group(1);
    if (numberGroup == null) return null;
    final number = int.tryParse(numberGroup);
    if (number == null) return null;
    return ImpaktfullUiMarkDownOrderedList(
      number: number,
      text: trimmedText.substring(match.end).trim(),
      indent: indent,
    );
  }
}
