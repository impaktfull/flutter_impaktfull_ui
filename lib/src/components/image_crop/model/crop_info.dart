import 'dart:ui';

class CropInfo {
  final Rect cropRect;
  final double width;
  final double height;
  final double rotation;
  final double scale;
  final Offset position;
  final bool isFlippedVertical;
  final bool isFlippedHorizontal;

  const CropInfo({
    required this.cropRect,
    required this.width,
    required this.height,
    required this.rotation,
    required this.scale,
    required this.position,
    required this.isFlippedVertical,
    required this.isFlippedHorizontal,
  });

  CropInfo copyWith({
    Rect? cropRect,
    double? width,
    double? height,
    double? rotation,
    double? scale,
    Offset? position,
    bool? isFlippedVertical,
    bool? isFlippedHorizontal,
  }) {
    return CropInfo(
      cropRect: cropRect ?? this.cropRect,
      width: width ?? this.width,
      height: height ?? this.height,
      rotation: rotation ?? this.rotation,
      scale: scale ?? this.scale,
      position: position ?? this.position,
      isFlippedVertical: isFlippedVertical ?? this.isFlippedVertical,
      isFlippedHorizontal: isFlippedHorizontal ?? this.isFlippedHorizontal,
    );
  }
}
