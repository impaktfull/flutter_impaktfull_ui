import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/network_image/network_image_style.dart';
import 'package:impaktfull_ui/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';

export 'network_image_style.dart';

part 'network_image.describe.dart';

class ImpaktfullUiNetworkImage extends StatelessWidget
    with ComponentDescriptorMixin {
  final String url;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final ImpaktfullUiNetworkImageTheme? theme;

  const ImpaktfullUiNetworkImage({
    required this.url,
    this.height,
    this.width,
    this.fit,
    this.theme,
    super.key,
  });

  const ImpaktfullUiNetworkImage.random({
    this.height,
    this.width,
    this.fit,
    this.theme,
    super.key,
  }) : url = 'https://picsum.photos';

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuilder<ImpaktfullUiNetworkImageTheme>(
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
          errorBuilder: (context, error, stackTrace) {
            if (!kDebugMode) throw error;
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Placeholder(
                  color: Colors.red,
                  fallbackWidth: width ?? 300,
                  fallbackHeight: height ?? 300,
                ),
                FractionallySizedBox(
                  widthFactor: 0.5,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Error: $error',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}
