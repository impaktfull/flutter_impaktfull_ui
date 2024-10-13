import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/markdown/markdown.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/components/tooltip/tooltip.dart';

class ImpaktfullUiMarkDownLink extends StatelessWidget {
  final String text;
  final String link;
  final String? altText;
  final ImpaktfullUiMarkdownTheme? theme;
  final ImpaktfullUiMarkdownLinkCallback? onOpenLink;

  const ImpaktfullUiMarkDownLink({
    required this.text,
    required this.link,
    this.altText,
    this.theme,
    this.onOpenLink,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiMarkdownTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final hasLink = link.isNotEmpty;
        return MouseRegion(
          cursor: hasLink ? SystemMouseCursors.click : MouseCursor.defer,
          child: ImpaktfullUiTooltip(
            message: altText ?? '',
            child: GestureDetector(
              onTap: hasLink && onOpenLink != null
                  ? () => onOpenLink!.call(link)
                  : null,
              child: Text(
                _getText(),
                style: hasLink
                    ? componentTheme.textStyles.link
                    : componentTheme.textStyles.paragraph,
              ),
            ),
          ),
        );
      },
    );
  }

  String _getText() {
    if (text.isNotEmpty) return text;
    if (altText != null && altText!.isNotEmpty) return altText!;
    return link;
  }
}
