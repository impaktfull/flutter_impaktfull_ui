import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/components/markdown/model/header/header_level.dart';
import 'package:impaktfull_ui_2/src/components/markdown/parser/markdown_parser.dart';
import 'package:impaktfull_ui_2/src/components/markdown/widget/markdown_header.dart';

/// This class is used to parse the markdown header into a widget.
///
/// The documentation that was used to generate these widgets:
/// - https://www.markdownguide.org/basic-syntax/#headings
class ImpaktfullUiMarkdownHeaderParser extends ImpaktfullUiMarkdownParser {
  const ImpaktfullUiMarkdownHeaderParser();
  @override
  Widget? parse(String text) {
    if (!text.startsWith('#')) return null;
    final headerLevel = text.split('#').length - 1;
    if (headerLevel == 0 || headerLevel > 6) {
      return null;
    }

    final headerContent = text.substring(headerLevel).trim();
    if (headerContent.isEmpty) return null;
    return ImpaktfullUiMarkDownHeader(
      text: headerContent,
      level: ImpaktfullUiMarkDownHeaderLevel.parse(headerLevel),
    );
  }
}
