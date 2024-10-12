import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/components/markdown/markdown.dart';
import 'package:impaktfull_ui_2/src/components/markdown/parser/markdown_parser.dart';
import 'package:impaktfull_ui_2/src/components/markdown/widget/markdown_image.dart';

/// This class is used to parse the markdown image into a widget.
///
/// The documentation that was used to generate these widgets:
/// - https://www.markdownguide.org/basic-syntax/#images-1
class ImpaktfullUiMarkdownImageParser extends ImpaktfullUiMarkdownParser {
  final ImpaktfullUiMarkdownLinkCallback? onOpenLink;

  const ImpaktfullUiMarkdownImageParser({
    this.onOpenLink,
  });

  @override
  Widget? parse(String text) {
    final regex = RegExp(r'!\[(.*?)\]\((.*?)(?:\s+"(.*?)")?\)');
    final match = regex.firstMatch(text);
    if (match == null) return null;
    final altText = match.group(1) ?? '';
    final imageUrl = match.group(2) ?? '';
    final title = match.group(3);
    if (imageUrl.isEmpty) return null;
    return ImpaktfullUiMarkDownImage(
      text: title ?? '',
      imageUrl: imageUrl,
      altText: altText,
      onOpenLink: onOpenLink,
    );
  }
}
