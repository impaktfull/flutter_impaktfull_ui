import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:impaktfull_ui_2/src/components/markdown/markdown_style.dart';
import 'package:impaktfull_ui_2/src/components/network_image/network_image.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'markdown_style.dart';

part 'markdown.describe.dart';

typedef ImpaktfullUiMarkdownLinkCallback = FutureOr<void> Function(String url);

class ImpaktfullUiMarkdown extends StatelessWidget
    with ComponentDescriptorMixin {
  final String data;
  final ImpaktfullUiMarkdownLinkCallback? onOpenLink;
  final ImpaktfullUiMarkdownTheme? theme;

  const ImpaktfullUiMarkdown({
    required this.data,
    this.onOpenLink,
    this.theme,
    super.key,
  });

  @override
  String describe(BuildContext context) => _describeInstance(context, this);

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiMarkdownTheme>(
      overrideComponentTheme: theme,
      builder: (context, componentTheme) => MarkdownBody(
        styleSheet: MarkdownStyleSheet(
          h1: componentTheme.textStyles.h1,
          h2: componentTheme.textStyles.h2,
          h3: componentTheme.textStyles.h3,
          h4: componentTheme.textStyles.h4,
          h5: componentTheme.textStyles.h5,
          h6: componentTheme.textStyles.h6,
          p: componentTheme.textStyles.paragraph,
          listBullet: componentTheme.textStyles.unorderedList,
          a: componentTheme.textStyles.link,
          code: componentTheme.textStyles.code.copyWith(
            backgroundColor: componentTheme.colors.code,
          ),
        ),
        onTapLink: onOpenLink == null ? null : _onTapLink,
        imageBuilder: (uri, title, alt) {
          final url = uri.toString();
          if (url.startsWith('resource:')) {
            final cleanAssetPath = url.replaceFirst('resource:', '');
            if (url.endsWith('.svg')) {
              return SvgPicture.asset(
                cleanAssetPath,
              );
            }
            return Image.asset(
              cleanAssetPath,
            );
          }
          if (url.endsWith('.svg')) {
            return SvgPicture.network(
              url,
            );
          }
          return ImpaktfullUiNetworkImage(
            url: url,
          );
        },
        data: data,
      ),
    );
  }

  void _onTapLink(String text, String? href, String title) {
    if (href == null) return;
    onOpenLink?.call(href);
  }
}
