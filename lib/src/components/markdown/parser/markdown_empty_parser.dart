import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/components/markdown/parser/markdown_parser.dart';
import 'package:impaktfull_ui_2/src/components/markdown/widget/markdown_empty_line.dart';

/// This class is used to parse the markdown empty line into a widget.
class ImpaktfullUiMarkdownEmptyParser extends ImpaktfullUiMarkdownParser {
  const ImpaktfullUiMarkdownEmptyParser();
  @override
  Widget? parse(String text) {
    if (text.isNotEmpty) return null;
    return const ImpaktfullUiMarkDownEmptyLine();
  }
}
