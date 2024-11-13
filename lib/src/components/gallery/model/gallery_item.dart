import 'package:flutter/widgets.dart';

class ImpaktfullUiGalleryItem {
  final String? title;
  final String? description;
  final String? id;
  final Widget? _child;
  final String? imageUrl;
  final BoxFit? imageFit;

  String get heroTag {
    if (id != null) return id!;
    if (imageUrl != null) return imageUrl!;
    return '';
  }

  Widget get child {
    if (_child != null) return _child;
    return Image.network(
      imageUrl!,
      fit: imageFit,
    );
  }

  bool get hasInfo => title != null || description != null;

  const ImpaktfullUiGalleryItem({
    this.id,
    this.title,
    this.description,
    required Widget child,
  })  : _child = null,
        imageUrl = null,
        imageFit = null;

  const ImpaktfullUiGalleryItem.image({
    this.id,
    this.title,
    this.description,
    required this.imageUrl,
    this.imageFit = BoxFit.contain,
  }) : _child = null;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ImpaktfullUiGalleryItem &&
        other.title == title &&
        other.description == description &&
        other.id == id &&
        other._child == _child &&
        other.imageUrl == imageUrl &&
        other.imageFit == imageFit;
  }

  @override
  int get hashCode => Object.hash(
        title,
        description,
        id,
        _child,
        imageUrl,
        imageFit,
      );
}
