import 'dart:ui';

class ImpaktfullUiImageCropInfo {
  final Rect cropRect;
  final double width;
  final double height;
  final double scale;
  final Offset position;
  final Color backgroundColor;

  const ImpaktfullUiImageCropInfo({
    required this.cropRect,
    required this.width,
    required this.height,
    required this.scale,
    required this.position,
    this.backgroundColor = const Color(0x00000000),
  });

  ImpaktfullUiImageCropInfo copyWith({
    Rect? cropRect,
    double? width,
    double? height,
    double? rotation,
    double? scale,
    Offset? position,
    bool? isFlippedVertical,
    bool? isFlippedHorizontal,
    Color? backgroundColor,
  }) {
    return ImpaktfullUiImageCropInfo(
      cropRect: cropRect ?? this.cropRect,
      width: width ?? this.width,
      height: height ?? this.height,
      scale: scale ?? this.scale,
      position: position ?? this.position,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }
}
