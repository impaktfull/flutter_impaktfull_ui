import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/network_image/network_image_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'network_image_style.dart';

part 'network_image.describe.dart';

class ImpaktfullUiNetworkImage extends StatelessWidget with ComponentDescriptorMixin {
  final String url;
  final double? height;
  final double? width;
  final ImpaktfullUiNetworkImageTheme? theme;

  const ImpaktfullUiNetworkImage({
    required this.url,
    this.height,
    this.width,
    this.theme,
    super.key,
  });

  const ImpaktfullUiNetworkImage.random({
    this.height,
    this.width,
    this.theme,
    super.key,
  }) : url = 'https://picsum.photos';

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiNetworkImageTheme>(
      overrideComponentTheme: theme,
      builder: (context, theme, componentTheme) {
        String fullUrl = url;
        if (url.startsWith('https://picsum.photos')) {
          fullUrl = 'https://picsum.photos/${(width ?? 300).toInt()}/${(height ?? 300).toInt()}';
        }
        return Image.network(
          fullUrl,
          height: height,
          width: width,
        );
      },
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}
