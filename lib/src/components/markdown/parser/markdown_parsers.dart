import 'package:impaktfull_ui_2/src/components/markdown/markdown.dart';
import 'package:impaktfull_ui_2/src/components/markdown/parser/markdown_code_parser.dart';
import 'package:impaktfull_ui_2/src/components/markdown/parser/markdown_header_parser.dart';
import 'package:impaktfull_ui_2/src/components/markdown/parser/markdown_image_parser.dart';
import 'package:impaktfull_ui_2/src/components/markdown/parser/markdown_link_parser.dart';
import 'package:impaktfull_ui_2/src/components/markdown/parser/markdown_ordered_parser.dart';
import 'package:impaktfull_ui_2/src/components/markdown/parser/markdown_paragraph_parser.dart';
import 'package:impaktfull_ui_2/src/components/markdown/parser/markdown_parser.dart';
import 'package:impaktfull_ui_2/src/components/markdown/parser/markdown_unordered_parser.dart';

/// This class is used to parse the markdown text into widgets.
/// It is used in the [ImpaktfullUiMarkdown] widget.
///
/// The documentation that was used to generate these widgets:
/// - https://www.markdownguide.org/cheat-sheet/
/// - https://www.markdownguide.org/basic-syntax/
class ImpaktfullUiMarkdownParsers {
  final ImpaktfullUiMarkdownParser header;
  final ImpaktfullUiMarkdownParser paragraph;
  final ImpaktfullUiMarkdownParser image;
  final ImpaktfullUiMarkdownParser link;
  final ImpaktfullUiMarkdownParser unordered;
  final ImpaktfullUiMarkdownParser orderedList;
  final ImpaktfullUiMarkdownParser code;
  final List<ImpaktfullUiMarkdownParser> extraParsers;
  const ImpaktfullUiMarkdownParsers({
    required this.header,
    required this.paragraph,
    required this.image,
    required this.link,
    required this.unordered,
    required this.orderedList,
    required this.code,
    required this.extraParsers,
  });

  static ImpaktfullUiMarkdownParsers getDefault({
    ImpaktfullUiMarkdownLinkCallback? onOpenLink,
  }) =>
      ImpaktfullUiMarkdownParsers(
        header: const ImpaktfullUiMarkdownHeaderParser(),
        paragraph: const ImpaktfullUiMarkdownParagraphParser(),
        image: ImpaktfullUiMarkdownImageParser(
          onOpenLink: onOpenLink,
        ),
        link: ImpaktfullUiMarkdownLinkParser(
          onOpenLink: onOpenLink,
        ),
        unordered: const ImpaktfullUiMarkdownUnorderedParser(),
        orderedList: const ImpaktfullUiMarkdownOrderedParser(),
        code: const ImpaktfullUiMarkdownCodeParser(),
        extraParsers: [],
      );

  List<ImpaktfullUiMarkdownParser> get parsers => [
        ...extraParsers,
        header,
        image,
        link,
        unordered,
        orderedList,
        code,
        paragraph,
      ];

  ImpaktfullUiMarkdownParsers copyWith({
    ImpaktfullUiMarkdownParser? header,
    ImpaktfullUiMarkdownParser? paragraph,
    ImpaktfullUiMarkdownParser? image,
    ImpaktfullUiMarkdownParser? link,
    ImpaktfullUiMarkdownParser? unordered,
    ImpaktfullUiMarkdownParser? orderedList,
    ImpaktfullUiMarkdownParser? code,
    List<ImpaktfullUiMarkdownParser>? extraParsers,
  }) {
    return ImpaktfullUiMarkdownParsers(
      header: header ?? this.header,
      paragraph: paragraph ?? this.paragraph,
      image: image ?? this.image,
      link: link ?? this.link,
      unordered: unordered ?? this.unordered,
      orderedList: orderedList ?? this.orderedList,
      code: code ?? this.code,
      extraParsers: extraParsers ?? this.extraParsers,
    );
  }
}
