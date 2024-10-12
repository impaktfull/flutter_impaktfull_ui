import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui_2/src/components/markdown/markdown.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';

class ImpaktfullUiMarkDownImage extends StatelessWidget {
  final String text;
  final String imageUrl;
  final String? altText;
  final ImpaktfullUiMarkdownTheme? theme;
  final ImpaktfullUiMarkdownLinkCallback? onOpenLink;

  const ImpaktfullUiMarkDownImage({
    required this.text,
    required this.imageUrl,
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
        final isAsset =
            imageUrl.startsWith('/assets') || imageUrl.startsWith('assets/') || imageUrl.startsWith('file://assets/');
        if (isAsset) {
          final assetUrl = imageUrl;
          ImpaktfullUiAsset asset;
          if (assetUrl.endsWith('.svg')) {
            asset = ImpaktfullUiAsset.svg(assetUrl);
          } else {
            asset = ImpaktfullUiAsset.pixel(assetUrl);
          }
          return ImpaktfullUiAssetWidget(
            asset: asset,
          );
        }
        return Image.network(
          imageUrl,
          errorBuilder: (context, error, stackTrace) => Text(
            '${_getText()} (Failed to load image, $error)',
            style: componentTheme.textStyles.paragraph,
          ),
        );
      },
    );
  }

  String _getText() {
    if (text.isNotEmpty) return text;
    if (altText != null && altText!.isNotEmpty) return altText!;
    return imageUrl;
  }
}
