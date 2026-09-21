import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Shown instead of an [ImpaktfullUiNetworkImage] that failed to load.
///
/// In debug mode it shows a placeholder with the error, so a broken url is
/// noticed during development. In profile and release mode it keeps the size
/// of the image and shows nothing, instead of throwing (which would replace
/// the image, or the whole screen around it, with an error widget).
class ImpaktfullUiNetworkImageError extends StatelessWidget {
  final Object error;
  final double? width;
  final double? height;
  final bool showDebugInfo;

  const ImpaktfullUiNetworkImageError({
    required this.error,
    this.width,
    this.height,
    this.showDebugInfo = kDebugMode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (!showDebugInfo) {
      return SizedBox(
        width: width,
        height: height,
      );
    }
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
  }
}
