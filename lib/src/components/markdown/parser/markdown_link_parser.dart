import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/components/markdown/markdown.dart';
import 'package:impaktfull_ui_2/src/components/markdown/parser/markdown_parser.dart';
import 'package:impaktfull_ui_2/src/components/markdown/widget/markdown_link.dart';

/// This class is used to parse the markdown link into a widget.
///
/// The documentation that was used to generate these widgets:
/// - https://www.markdownguide.org/basic-syntax/#links
class ImpaktfullUiMarkdownLinkParser extends ImpaktfullUiMarkdownParser {
  final ImpaktfullUiMarkdownLinkCallback? onOpenLink;

  const ImpaktfullUiMarkdownLinkParser({
    this.onOpenLink,
  });

  @override
  Widget? parse(String text) {
    final regex = RegExp(r'\[(.*?)\]\((.*?)(?:\s+"(.*?)")?\)');
    final match = regex.firstMatch(text);
    if (match == null) return null;
    final linkText = match.group(1) ?? '';
    final linkUrl = match.group(2) ?? '';
    final altText = match.group(3);
    if (linkText.isEmpty && linkUrl.isEmpty) return null;
    return ImpaktfullUiMarkDownLink(
      text: linkText,
      link: linkUrl,
      altText: altText,
      onOpenLink: onOpenLink,
    );
  }
}
