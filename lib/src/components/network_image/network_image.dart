import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/network_image/network_image_style.dart';
import 'package:impaktfull_ui/src/components/network_image/widget/network_image_error.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'network_image_style.dart';

class ImpaktfullUiNetworkImage extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final ImpaktfullUiNetworkImageTheme? theme;

  /// What screen readers announce for the image (the alt text), e.g.
  /// `Profile picture of Jane`.
  final String? semanticLabel;

  /// Hides the image from screen readers, for a decorative image.
  final bool excludeFromSemantics;

  const ImpaktfullUiNetworkImage({
    required this.url,
    this.height,
    this.width,
    this.fit,
    this.theme,
    this.semanticLabel,
    this.excludeFromSemantics = false,
    super.key,
  });

  const ImpaktfullUiNetworkImage.random({
    this.height,
    this.width,
    this.fit,
    this.theme,
    this.semanticLabel,
    this.excludeFromSemantics = false,
    super.key,
  }) : url = 'https://picsum.photos';

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        String fullUrl = url;
        if (url.startsWith('https://picsum.photos')) {
          fullUrl =
              'https://picsum.photos/${(width ?? 300).toInt()}/${(height ?? 300).toInt()}';
        }
        return Image.network(
          fullUrl,
          height: height,
          width: width,
          fit: fit,
          semanticLabel: semanticLabel,
          excludeFromSemantics: excludeFromSemantics,
          errorBuilder: (context, error, stackTrace) =>
              ImpaktfullUiNetworkImageError(
            error: error,
            width: width,
            height: height,
          ),
        );
      },
    );
  }
}
